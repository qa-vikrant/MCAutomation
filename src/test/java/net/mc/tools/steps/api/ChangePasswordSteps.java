package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.change_Password.request.ChangePasswordRequest;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.ChangePasswordService;
import org.junit.Assert;

import java.util.List;


public class ChangePasswordSteps
{
    private Response jsonResponse;
    private ChangePasswordRequest changePasswordRequest;
    private ResponseCommonForAll responseCommonForAll;


    @When("^User enter the valid old Password and valid new password$")
    public void user_enter_the_valid_old_Password_and_valid_new_password(List<ChangePasswordRequest> changePasswordRequestList) throws Exception
    {
      this.changePasswordRequest=changePasswordRequestList.get(0);
      if(this.changePasswordRequest.getToken()==null)
      {
          this.changePasswordRequest.setToken(LoginSteps.token);
      }
    }


    @When("^User make a request to change the Password with existing password$")
    public void UserMakeRequestToChangeThePasswordWithExistingPassword() throws Exception
    {
        jsonResponse= ChangePasswordService.Change_Password_Request_with_Token(changePasswordRequest,LoginSteps.token);
    }

    @When("^User make a request to change the Password with existing password with Incorrect/blank token field in form of without login credentials$")
    public void UserMakeRequestToChangeThePasswordWithExistingPasswordwithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        jsonResponse= ChangePasswordService.Change_Password_Request_with_Token(changePasswordRequest,tokenMessageRequestModelList.get(0).gettoken());
    }



    @Then("^User should be able to change the Password with existing password successfully$")
    public void password_change_successfully_and_user_got_message_ok_recieved() throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAll= ChangePasswordService.gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
        Assert.assertEquals("true",responseCommonForAll.getData());
    }

    @Then("^User should not be able to change password and user should get validation error message$")
    public void user_will_not_able_to_change_password_and_user_should_get_validation_messages(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


}
