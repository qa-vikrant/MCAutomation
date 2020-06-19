package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.models.updateUserSetting.updateUserSettingRequest.UpdateUserSettingRequestModel;
import net.mc.tools.models.updateUserSetting.updateUserSettingResponse.UpdateUserSettingResponseModel;
import net.mc.tools.services.UpdateUserSettingService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateUserSettingSteps {

    private Response jsonResponse;
    private UpdateUserSettingRequestModel updateUserSettingRequestModel;
    private UpdateUserSettingResponseModel updateUserSettingResponseModel;


    @When("^User enters order settings details$")
    public void userEnterSettingDetails(List<UpdateUserSettingRequestModel> updateUserSettingRequestModelList)
    {
        this.updateUserSettingRequestModel=updateUserSettingRequestModelList.get(0);
    }


    @When("^User make a request to update order settings$")
    public void UserMakeARequestToUpdateOrderSettings()
    {
        jsonResponse = UpdateUserSettingService.UpdateUserSettingRequest(updateUserSettingRequestModel,LoginSteps.token);
    }


    @When("^User make a request to update order settings with incorrect/blank token field in form of without login credentials$")
    public void UserMakeARequestToUpdateOrderSettingsWithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = UpdateUserSettingService.UpdateUserSettingRequest(updateUserSettingRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }


    @Then("^User should be able to update order settings$")
    public void userShouldBeAbleToUpdateorderorderSetting()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        updateUserSettingResponseModel = gson().fromJson(jsonResponse.body().prettyPrint(), UpdateUserSettingResponseModel.class);
        Assert.assertEquals(updateUserSettingRequestModel.getId(),updateUserSettingResponseModel.getData().getId());
        Assert.assertEquals(updateUserSettingRequestModel.getIsAcceptOrder(),updateUserSettingResponseModel.getData().getSetting().getIsAcceptOrder());

        jsonResponse=null;
        updateUserSettingRequestModel=null;
        updateUserSettingResponseModel=null;

    }

    @Then("^User should not be able to update order settings and user should get validation error message$")
    public void userShouldNotBeAbleToUpdateSetting(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
