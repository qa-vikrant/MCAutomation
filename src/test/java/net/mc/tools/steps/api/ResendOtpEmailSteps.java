package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.resendOtpEmail.resendOtpEmailRequest.ResendOtpEmailRequestModel;
import net.mc.tools.models.resendOtpEmail.resendOtpEmailResponse.ResendOtpEmailRequestResponseModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.ResendOtpEmailService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class ResendOtpEmailSteps
{
    private Response jsonResponse;
    private ResendOtpEmailRequestModel resendOtpEmailRequestModel;
    private ResendOtpEmailRequestResponseModel resendOtpEmailRequestResponseModel;


    @And("^user enters desired vendor details to Reset Credentials$")
    public void userEntersDesiredVendorDetailsToResetCredentials(List<ResendOtpEmailRequestModel> resendOtpEmailRequestModelList)
    {
        this.resendOtpEmailRequestModel=resendOtpEmailRequestModelList.get(0);
    }

    @And("^user make a request to Reset Vendor Credentials$")
    public void userMakeARequestToResetVendorCredentials()
    {
       jsonResponse= ResendOtpEmailService.ResendOtpEmailRequest(resendOtpEmailRequestModel,LoginSteps.token);
    }

    @And("^user make request to Reset Vendor Credentials with Incorrect/blank token field in form of without login credentials$")
    public void userMakeARequestToResetVendorCredentialsWithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse= ResendOtpEmailService.ResendOtpEmailRequest(resendOtpEmailRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^user should be able to Reset Vendor Credentials$")
    public void userShouldBeAbleToResetVendorCredentials()
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        resendOtpEmailRequestResponseModel=gson().fromJson(jsonResponse.body().prettyPrint(),ResendOtpEmailRequestResponseModel.class);
        Assert.assertEquals(resendOtpEmailRequestModel.getEmail(),resendOtpEmailRequestResponseModel.getData().getEmail().getAddress());
        Assert.assertEquals(resendOtpEmailRequestModel.getId(),resendOtpEmailRequestResponseModel.getData().getId());
        Assert.assertEquals("ok",resendOtpEmailRequestResponseModel.getStatus());
    }

    @Then("^user should not be able to Reset Vendor Credentials and user should get validation error message$")
    public void userShouldNotBeAbleToResetVendorCredentials(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

}
