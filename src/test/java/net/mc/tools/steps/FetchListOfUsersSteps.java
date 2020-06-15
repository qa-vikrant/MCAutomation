package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.fetchListOfUsers.FetchListOfUsersRequest.FetchListOfUsersRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.FetchListOfUsersService;
import org.junit.Assert;

import java.util.List;

public class FetchListOfUsersSteps
{
    private Response jsonResponse;
    private FetchListOfUsersRequestModel fetchListOfUsersRequestModel;


    @Then("^user enter the requesterID and userType$")
    public void user_enter_the_requesterID_and_userType(List<FetchListOfUsersRequestModel> fetchListOfUsersRequestModelList) throws Exception
    {
       this.fetchListOfUsersRequestModel=fetchListOfUsersRequestModelList.get(0);
    }

    @Then("^user make a request to fetch list of seller$")
    public void user_make_a_request_to_fetch_list_of_seller() throws Exception
    {
        jsonResponse= FetchListOfUsersService.FetchListOfUsersWithToken(fetchListOfUsersRequestModel,LoginSteps.token);

    }

    @Then("^user should be able to gets all list of seller that he requested$")
    public void user_should_be_able_to_gets_all_list_of_seller_that_he_requested() throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
    }

    @Then("^user make a request to fetch list of vendor$")
    public void user_make_a_request_to_fetch_list_of_vendor() throws Exception
    {
        jsonResponse= FetchListOfUsersService.FetchListOfUsersWithToken(fetchListOfUsersRequestModel,LoginSteps.token);

    }

    @Then("^user should be able to gets all list of vendor that he requested$")
    public void user_should_be_able_to_gets_all_list_of_vendor_that_he_requested() throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
    }

    @Then("^user should not be able to gets any list of seller that he requested and user should get validation messages$")
    public void user_should_not_be_able_to_gets_any_list_of_seller_that_he_requested_and_user_should_get_validation_messages(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);

    }

    @Then("^user should not be able to gets any list of vendor that he requested and user should get validation messages$")
    public void user_should_not_be_able_to_gets_any_list_of_vendor_that_he_requested_and_user_should_get_validation_messages(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

    @Then("^so user as a vendor should not be able to gets any list of vendor or seller that he requested and user should get validation message$")
    public void so_user_as_a_vendor_should_not_be_able_to_gets_any_list_of_vendor_or_seller_that_he_requested_and_user_should_get_validation_message(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

    @When("^user make a request for list of seller or vendor with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_for_list_of_seller_or_vendor_with_Incorrect_blank_token_field_in_form_of_without_login_credentials(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        System.out.println(" tokenMessage ---("+tokenMessageRequestModelList.get(0).gettoken()+")");
        jsonResponse= FetchListOfUsersService.FetchListOfUsersWithToken(fetchListOfUsersRequestModel,tokenMessageRequestModelList.get(0).gettoken());
        jsonResponse.body().prettyPrint();

    }

    @Then("^user should not be able to gets any list of vendor or seller that he requested then user should get a validation message for Incorrect/blank token$")
    public void user_should_not_be_able_to_gets_any_list_of_vendor_or_seller_that_he_requested_then_user_should_get_a_validation_message_for_Incorrect_blank_token(List<String> errorMessage) throws Exception
    {
       HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


}
