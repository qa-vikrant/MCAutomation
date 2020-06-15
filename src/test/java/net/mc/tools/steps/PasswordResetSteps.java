package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.passwordReset.request.PasswordResetRequestModel;
import net.mc.tools.models.passwordReset.request.TokenGenerateRequestModel;
import net.mc.tools.models.passwordReset.response.PasswordResetResponseModel;
import net.mc.tools.models.passwordReset.response.TokenGenerateResponseModel;
import net.mc.tools.services.PasswordResetService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class PasswordResetSteps
{

    private Response passwordResetResponse,generateTokenResponse;
    private TokenGenerateRequestModel tokenGenerateRequestModel;
    private PasswordResetRequestModel passwordResetRequestModel;
    private TokenGenerateResponseModel tokenGenerateResponseModel;
    private PasswordResetResponseModel passwordResetResponseModel;
    private static String token;

    @When("^User enters the registered email for token creation$")
    public void userRequestToGetRegisteredIntoTheSystem(List<TokenGenerateRequestModel> tokenGenerateRequestModelList)
    {
        this.tokenGenerateRequestModel=tokenGenerateRequestModelList.get(0);
    }


    @When("^User make a request to create a token$")
    public void UserMakeRequestToCreateToken()
    {
        generateTokenResponse = PasswordResetService.GenerateTokenRequest(tokenGenerateRequestModel);
        tokenGenerateRequestModel=null;
    }

    @Then("^Token has been created successfully and user should get a message request to reset password for marketplace account$")
    public void ThenTokenhasbeencreatedsuccessfullyandusershouldgetamessageasaMailSentSuccessfully()
    {
        Assert.assertTrue(generateTokenResponse.getStatusCode() == 200);
        tokenGenerateResponseModel = gson().fromJson(generateTokenResponse.body().prettyPrint(), TokenGenerateResponseModel.class);
        Assert.assertEquals("ok",tokenGenerateResponseModel.getStatus());
        Assert.assertTrue(tokenGenerateResponseModel.getData().getToken()!=null);
        token = tokenGenerateResponseModel.getData().getToken();
        tokenGenerateResponseModel=null;
        generateTokenResponse=null;
    }


    @Then("^User should not be able for token creation and user should get a validation error message$")
    public void user_should_get_validation_error_message(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(generateTokenResponse,errorMessage);
    }


    @When("^User enter the incorrect/wrong email and wants to create a token$")
    public void user_enter_the_incorrect_wrong_email_and_wants_to_create_a_token(List<TokenGenerateRequestModel> tokenGenerateRequestModelList) throws Exception
    {
        this.tokenGenerateRequestModel=tokenGenerateRequestModelList.get(0);
    }




    @When("^User enters new passowrd$")
    public void userTryToChangePassword(List<PasswordResetRequestModel> passwordResetRequestModelList)
    {
        this.passwordResetRequestModel=passwordResetRequestModelList.get(0);
        if (passwordResetRequestModel.getToken()== null)
        {
            passwordResetRequestModel.setToken(token);
        }

    }

    @When("^User make a request to reset marketplace password$")
    public void userTryToChangePassword()
    {
         passwordResetResponse = PasswordResetService.PasswordResetRequest(passwordResetRequestModel);
        passwordResetRequestModel=null;
    }

    @And("^User should be able to reset marketplace password$")
    public void UserpasswordchangedsuccessfullyandusershouldgetamessageasaPasswordChangedSuccessfully()
    {
        Assert.assertTrue(passwordResetResponse.getStatusCode() == 200);
        passwordResetResponseModel = gson().fromJson(passwordResetResponse.body().prettyPrint(), PasswordResetResponseModel.class);
        Assert.assertEquals("true",passwordResetResponseModel.getData());
        Assert.assertEquals("ok",passwordResetResponseModel.getStatus());
        passwordResetResponseModel=null;
        passwordResetResponse=null;
    }


    @Then("^User should not be able to reset password and user should get validation error message$")
    public void userGetErrorMessageForInvalidToken(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(passwordResetResponse,errorMessage);
    }




}