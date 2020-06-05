package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.login.request.LoginRequestModel;
import net.mc.tools.models.login.response.LoginResponseModel;
import net.mc.tools.services.auth.LoginService;
import org.junit.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

import static net.mc.tools.services.auth.RegisterService.gson;

public class LoginSteps
{

    public static String token=null;
    public static Response jsonResponse;
    private LoginRequestModel loginRequestModel;
    private LoginResponseModel loginResponseModel;
    public static Logger log= LoggerFactory.getLogger(LoginSteps.class);

    @When("^User enters email and password$")
    public void userIsEntersValidEmailAndPassword(List<LoginRequestModel> loginRequestModelList)
    {
        this.loginRequestModel=loginRequestModelList.get(0);
        jsonResponse = LoginService.loginRequest(loginRequestModel);
    }

    @Then("^User should be able to login to the system and now User will Land on Home Page$")
    public void userShouldBeAbleToLoginToTheSystem()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        loginResponseModel = gson().fromJson(jsonResponse.body().prettyPrint(), LoginResponseModel.class);
        Assert.assertEquals("ok" , loginResponseModel.getStatus());
        Assert.assertEquals("true", loginResponseModel.getData().getData());
        Assert.assertTrue(loginResponseModel.getData().getToken() != null);
    }

    @Then("^User should not be able to login into to the system and user should get validation error message$")
    public void userShouldNotBeAbleToLoginToTheSystem(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

    @When("^User is able to log into application$")
    public void user_IsEntersValidEmailAndPassword(List<LoginRequestModel> loginRequestModelList)
    {
        this.loginRequestModel=loginRequestModelList.get(0);
        jsonResponse = LoginService.loginRequest(loginRequestModel);
    }

    @Then("^User should be able to login to the system and store token$")
    public void user_ShouldBeAbleToLoginToTheSystem()
     {
         try
         {
             if(jsonResponse.getStatusCode() == 200)
             {
                 Assert.assertTrue(jsonResponse.getStatusCode() == 200);
                 loginResponseModel = gson().fromJson(jsonResponse.body().prettyPrint(), LoginResponseModel.class);
                 Assert.assertEquals("ok", loginResponseModel.getStatus());
                 Assert.assertEquals("true", loginResponseModel.getData().getData());
                 Assert.assertTrue(loginResponseModel.getData().getToken() != null);
                 token = loginResponseModel.getData().getToken();
                 System.out.println("Now : User is able to use the system");
             }
             else
             {
               System.out.println("User is unable to login in the system");
             }
          }
         catch (Exception e)
         {
           e.printStackTrace();
         }
     }


}
