package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ErrorResponseCommonForAll;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.models.updateprofileofSupplier.request.UpdateprofileofSupplierRequestModel;
import net.mc.tools.services.UpdateprofileofSupplierService;

import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateprofileofSupplierSteps
{
    private Response josnResponse;
    private ResponseCommonForAll responseCommonForAll;
    private ErrorResponseCommonForAll errorResponseCommonForAll;
    private UpdateprofileofSupplierRequestModel updateprofileofSupplierRequestModel;

    @When("^user enters profile details for update vendor profile$")
    public void user_make_a_request_to_change_the_profile_of_their_associated_Vendor(List<UpdateprofileofSupplierRequestModel> updateprofileofSupplierRequestModelList) throws Exception
    {
        if(updateprofileofSupplierRequestModelList.get(0).getfirstName().equals(null))
        {
            updateprofileofSupplierRequestModelList.get(0).setfirstName("");
        }
        this.updateprofileofSupplierRequestModel=updateprofileofSupplierRequestModelList.get(0);
    }

    @When("^user make a request to update the profile of their associated Vendor$")
    public void user_make_a_request_to_change_the_profile_of_their_associated_Vendor() throws Exception
    {
        josnResponse = UpdateprofileofSupplierService.UpdateprofileRequest(updateprofileofSupplierRequestModel,LoginSteps.token);
    }


    @Then("^user should be able to update the vendor profile successfully$")
    public void user_is_able_to_change_the_profile_successfully_and_should_get_a_message_as_a_Profile_updated_successfully() throws Exception
    {
        Assert.assertTrue(josnResponse.statusCode()==200);
        responseCommonForAll=gson().fromJson(josnResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals("true",responseCommonForAll.getData());
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
    }

    @Then("^user should not able to update vendor profile and user should get validation error message$")
    public void user_will_not_able_to_change_profile_and_user_should_get_validation_messages(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(josnResponse,errorMessage);
    }

    @When("^user make a request to update the vendor profile with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_to_change_profile_of_vendor_with_Incorrect_blank_token_field_in_form_of_without_login_credentials(List<TokenMessageRequestModel> tokenMessage1) throws Exception
    {
        josnResponse = UpdateprofileofSupplierService.UpdateprofileRequest(updateprofileofSupplierRequestModel, tokenMessage1.get(0).gettoken());
    }

}
