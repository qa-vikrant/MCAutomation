package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.updateSellerProfile.updateSellerProfileRequest.UpdateSellerProfileRequestModel;
import net.mc.tools.services.UpdateSellerProfileService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class UpdateSellerProfileSteps
{
    private Response jsonResponse;
    private UpdateSellerProfileRequestModel updateSellerProfileRequestModel;
    private ResponseCommonForAll responseCommonForAll;


    @And("^User enters the required details to update seller profile$")
    public void userEntersTheRequiredDetailsToUpdateSellerProfile(List<UpdateSellerProfileRequestModel> updateSellerProfileRequestModelList)
    {
        this.updateSellerProfileRequestModel=updateSellerProfileRequestModelList.get(0);
    }

    @And("^User make a request to update the seller profile$")
    public void userMakeARequestToUpdateTheSellerProfile()
    {
        jsonResponse= UpdateSellerProfileService.UpdateSellerProfileRequest(updateSellerProfileRequestModel,LoginSteps.token);
    }

    @Then("^User should be able to update the seller profile successfully$")
    public void userShouldBeAbleToUpdateTheSellerProfileSuccessfully()
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals("true",responseCommonForAll.getData());
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
    }
}
