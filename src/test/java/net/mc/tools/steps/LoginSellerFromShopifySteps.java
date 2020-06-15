package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.login.response.LoginResponseModel;
import net.mc.tools.models.loginSellerFromShopify.loginSellerFromShopifyRequest.LoginSellerFromShopifyRequestModel;
import net.mc.tools.services.LoginSellerFromShopifyService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class LoginSellerFromShopifySteps
{
    private Response jsonResponse;
    private LoginSellerFromShopifyRequestModel loginSellerFromShopifyRequestModel;
    private LoginResponseModel loginResponseModel;


    @When("^User enters sellerId and shopifyAccessToken$")
    public void userEntersSellerIdAndShopifyAccessToken(List<LoginSellerFromShopifyRequestModel> loginSellerFromShopifyRequestModelList )
    {
      this.loginSellerFromShopifyRequestModel=loginSellerFromShopifyRequestModelList.get(0);
    }


    @When("^User make a request to login to the system from shopify$")
    public void UserMakeRequestToLoginToTheSystemFromShopify()
    {
        jsonResponse= LoginSellerFromShopifyService.LoginSellerFromShopifyRequest(loginSellerFromShopifyRequestModel);
    }

    @Then("^User should be able to login to the system from shopify$")
    public void userShouldBeAbleToLoginToTheSystemfromshopify()
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        loginResponseModel=gson().fromJson(jsonResponse.body().prettyPrint(),LoginResponseModel.class);
        Assert.assertEquals("ok" , loginResponseModel.getStatus());
        Assert.assertEquals("true", loginResponseModel.getData().getData());
        Assert.assertTrue(loginResponseModel.getData().getToken() != null);
    }

    @Then("^User should not be able to login to the system from shopify and user should get validation error message$")
    public void userShouldNotBeAbleToLoginToTheSystemfromshopify(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
