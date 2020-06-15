package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.removePaymentDetailsForSellerAndVendor.RemovePaymentDetailsForSellerAndVendorRequest.RemovePaymentDetailsForSellerAndVendorRequest;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAllBooleanData;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.RemovePaymentDetailsForSellerAndVendorService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RemovePaymentDetailsForSellerAndVendorService.gson;

public class RemovePaymentDetailsForSellerAndVendorSteps
{
    private Response jsonResponse;
    private ResponseCommonForAllBooleanData responseCommonForAllBooleanData;
    private RemovePaymentDetailsForSellerAndVendorRequest removePaymentDetailsForSellerAndVendorRequest;



    @When("^User enters payment method details$")
    public void user_enter_the_payment_method_and_request_to_remove_the_that_payment_method_in_form_of_clicking_on_disconnect_button(List<RemovePaymentDetailsForSellerAndVendorRequest> removePaymentDetailsForSellerAndVendorRequestList) throws Exception
    {
        this.removePaymentDetailsForSellerAndVendorRequest=removePaymentDetailsForSellerAndVendorRequestList.get(0);
    }

    @When("^User make a request to remove that payment method in form of clicking on disconnect button$")
    public void UserMakeaRequestToRemoveThatPaymentMethodInFormOfClickingOnDisconnectButton() throws Exception
    {
        jsonResponse = RemovePaymentDetailsForSellerAndVendorService.RemovePaymentDetailsWithTokenRequest(removePaymentDetailsForSellerAndVendorRequest,LoginSteps.token);
    }

    @When("^user make a request to remove payment method with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_to_remove_payment_method_with_Incorrect_blank_token_field_in_form_of_without_login_credentials(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        jsonResponse = RemovePaymentDetailsForSellerAndVendorService.RemovePaymentDetailsWithTokenRequest(removePaymentDetailsForSellerAndVendorRequest,tokenMessageRequestModelList.get(0).gettoken());
    }


    @Then("^User should be able to remove payment method successfully that he requested$")
    public void user_should_be_able_to_remove_payment_method_successfully_that_he_requested() throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAllBooleanData =gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAllBooleanData.class);
        Assert.assertEquals(true, responseCommonForAllBooleanData.getData());
        Assert.assertEquals("ok", responseCommonForAllBooleanData.getStatus());
    }

    @Then("^User should not be able to remove payment method that he requested and user should get a validation message$")
    public void user_should_not_be_able_to_remove_payment_method_that_he_requested_and_user_should_get_a_validation_message_as_a(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


}
