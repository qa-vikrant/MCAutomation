package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.verificationMail.verificationMailRequest.ResendVerificationMailRequestModel;
import net.mc.tools.models.verificationMail.verificationMailRequest.VerifyEmailRequestModel;
import net.mc.tools.models.verificationMail.verificationMailResponse.ResendVerificationMailResponseModel;
import net.mc.tools.services.VerificationMailService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class VerificationMailSteps
{
    private Response jsonResponse;
    private ResendVerificationMailRequestModel resendVerificationMailRequestModel;
    private VerifyEmailRequestModel verifyEmailRequestModel;
    private ResendVerificationMailResponseModel resendVerificationMailResponseModel;
    private ResponseCommonForAll responseCommonForAll;
    public static String tokenToBeUsed;

    @When("^User enters emailId to resend verification link$")
    public void new_Vendor_request_to_get_registered_into_the_system_by_resend_verification_mail_link(List<ResendVerificationMailRequestModel> resendVerificationMailRequestModelList) throws Exception
    {
        this.resendVerificationMailRequestModel=resendVerificationMailRequestModelList.get(0);
        if(RegisterSupplierBySelfSteps.emailID!=null)
        {
            this.resendVerificationMailRequestModel.setemail(RegisterSupplierBySelfSteps.emailID);
        }
    }

    @When("^User make a request to resend verification link on their registered emailId$")
    public void UserMakeRequestToResendVerificationLinkOnTheirRegisteredEmailId() throws Exception
    {
        jsonResponse= VerificationMailService.resendVerificationEmailRequest(resendVerificationMailRequestModel);
        RegisterSupplierBySelfSteps.emailID=null;
    }

    @Then("^User should be able to resend verification link on their registered emailId$")
    public void new_Vendor_should_get_message_as_a_Mail_Sent_Successfully() throws Exception
    {
        Assert.assertTrue(jsonResponse.statusCode()==200);
        resendVerificationMailResponseModel = gson().fromJson(jsonResponse.body().prettyPrint(), ResendVerificationMailResponseModel.class);
        Assert.assertEquals("ok", resendVerificationMailResponseModel.getStatus());
        Assert.assertTrue(resendVerificationMailResponseModel.getData().getToken() != null);
        tokenToBeUsed=resendVerificationMailResponseModel.getData().getToken();
        jsonResponse=null;
        resendVerificationMailResponseModel =null;
        resendVerificationMailRequestModel=null;
    }

    @When("^User enters the verification link in form of Token$")
    public void UserEntersTheVerificationLinkInFormOfToken(List<VerifyEmailRequestModel> verifyEmailRequestModelList) throws Exception
    {
        this.verifyEmailRequestModel=verifyEmailRequestModelList.get(0);
        if(tokenToBeUsed!=null)
        {
            this.verifyEmailRequestModel.setToken(tokenToBeUsed);
        }
        if(RegisterSupplierBySelfSteps.token!=null)
        {
            this.verifyEmailRequestModel.setToken(RegisterSupplierBySelfSteps.token);
        }
    }

    @When("^User make a request to confirms the token by clicking on a link that has been sent to its registered email$")
    public void new_vendor_confirms_the_token_by_clicking_on_a_link_that_has_been_sent_to_its_registered_email() throws Exception
    {
        jsonResponse=VerificationMailService.verifyEmailRequest(verifyEmailRequestModel);
        tokenToBeUsed=null;
        RegisterSupplierBySelfSteps.token=null;
    }



    @Then("^User should be able to verify their emailId and Vendor should get message as a Your Email is Verified Successfully.$")
    public void vendor_should_be_registered_successfully_into_the_system_and_Vendor_should_get_message_as_a_Your_Email_is_Verified_Successfully() throws Exception
    {
        Assert.assertTrue(jsonResponse.statusCode()==200);
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals("true",responseCommonForAll.getData());
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
        jsonResponse=null;
        responseCommonForAll=null;
        verifyEmailRequestModel=null;
    }


    @Then("^User should not be able to verify their emailId and user should get validation error message$")
    public void vendor_should_not_be_able_to_register_into_the_system_and_vendor_should_get_a_validation_messages(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

    @Then("^User should not be able to resend verification link on their registered emailId and user should get validation error message$")
    public void UserShouldNotBeAbleToResendVerificationLinkOnTheirRegisteredEmailIdAndUserShouldGetValidationErrorMessage(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
