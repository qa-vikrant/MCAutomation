package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.updateOneTimePasswordReset.updateOneTimePasswordResetRequest.UpdateOneTimePasswordResetRequestModel;
import net.mc.tools.services.UpdateOneTimePasswordResetService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class UpdateOneTimePasswordResetSteps
{
    private Response jsonResponse;
    private UpdateOneTimePasswordResetRequestModel updateOneTimePasswordResetRequestModel;
    private ResponseCommonForAll responseCommonForAll;


    @When("^user enter emailId and password that users have received on their registered email id$")
    public void userEnterEmailIdAndPasswordThatUsersHaveReceivedOnTheirRegisteredEmailId(List<UpdateOneTimePasswordResetRequestModel> updateOneTimePasswordResetRequestModelList)
    {
        this.updateOneTimePasswordResetRequestModel=updateOneTimePasswordResetRequestModelList.get(0);
    }

    @And("^User enters newPassword$")
    public void userEntersNewPassword(List<UpdateOneTimePasswordResetRequestModel> updateOneTimePasswordResetRequestModelList)
    {
      this.updateOneTimePasswordResetRequestModel.setNewPassword(updateOneTimePasswordResetRequestModelList.get(0).getNewPassword());
    }

    @And("^User make a request to Password Reset$")
    public void userMakeARequestToPasswordReset()
    {
      jsonResponse= UpdateOneTimePasswordResetService.UpdateOneTimePasswordResetRequest(updateOneTimePasswordResetRequestModel);
    }

    @And("^User should be able to Password Reset$")
    public void userShouldBeAbleToPasswordReset()
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals("true",responseCommonForAll.getData());
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
        responseCommonForAll=null;
        jsonResponse=null;
        updateOneTimePasswordResetRequestModel=null;
    }

    @Then("^User should not be able to Password Reset and user should get validation error message$")
    public void userShouldNotBeAbleToPasswordReset(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


}
