package net.mc.tools.steps;


import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;


import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.loginAsUserProxyAccessLogin.LoginAsUserProxyAccessLoginResponse.LoginAsUserProxyAccessLoginResponseModel;
import net.mc.tools.models.loginAsUserProxyAccessLogin.loginAsUserProxyAccessLoginRequest.LoginAsUserProxyAccessLoginRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.LoginAsUserProxyAccessLoginService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class LoginAsUserProxyAccessLoginSteps
{
    private Response jsonResponse;
    private LoginAsUserProxyAccessLoginRequestModel loginAsUserProxyAccessLoginRequestModel;
    private LoginAsUserProxyAccessLoginResponseModel loginAsUserProxyAccessLoginResponseModel;
    private Integer otp;

    @And("^user enters vendorId ,userRole and Access Method details of login of desired vendor$")
    public void userEntersVendorIdUserRoleAndAccessMethodDetailsOfTheirRespectiveVendor(List<LoginAsUserProxyAccessLoginRequestModel> loginAsUserProxyAccessLoginRequestModelList)
    {
        this.loginAsUserProxyAccessLoginRequestModel=loginAsUserProxyAccessLoginRequestModelList.get(0);
    }


    @And("^user enters sellerId ,userRole and Access Method details of desired seller$")
    public void userEnterssellerIdUserRoleAndAccessMethodDetailsOfTheirRespectiveVendor(List<LoginAsUserProxyAccessLoginRequestModel> loginAsUserProxyAccessLoginRequestModelList)
    {
        this.loginAsUserProxyAccessLoginRequestModel=loginAsUserProxyAccessLoginRequestModelList.get(0);
    }

    @And("^user make a request to proxy access login$")
    public void userMakeARequestToProxyAccessLoginOfTheirRespectiveVendor()
    {
        jsonResponse= LoginAsUserProxyAccessLoginService.ProxyLoginRequest(loginAsUserProxyAccessLoginRequestModel,LoginSteps.token);
    }


    @And("^user make a request to proxy access login with Incorrect/blank token field in form of without login credentials$")
    public void userMakeARequestToProxyAccessLoginOfTheirRespectiveVendorwithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse= LoginAsUserProxyAccessLoginService.ProxyLoginRequest(loginAsUserProxyAccessLoginRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^user should be able to proxy access login successfully$")
    public void userShouldBeAbleToProxyAccessLoginOfTheirRespectiveVendorAndUserShouldGetOtp()
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        loginAsUserProxyAccessLoginResponseModel=gson().fromJson(jsonResponse.body().prettyPrint(),LoginAsUserProxyAccessLoginResponseModel.class);
        Assert.assertEquals("true",loginAsUserProxyAccessLoginResponseModel.getData().getData());
        Assert.assertEquals("ok",loginAsUserProxyAccessLoginResponseModel.getStatus());
        Assert.assertTrue(!loginAsUserProxyAccessLoginResponseModel.getData().getToken().isEmpty());
        if(loginAsUserProxyAccessLoginRequestModel.getOnlyRead().equals(false))
        {
            Assert.assertTrue(!loginAsUserProxyAccessLoginResponseModel.getData().getOtp().isEmpty());
            otp=Integer.parseInt(loginAsUserProxyAccessLoginResponseModel.getData().getOtp());
            Assert.assertTrue(otp>=1000);
            System.out.println("otp is :"+loginAsUserProxyAccessLoginResponseModel.getData().getOtp()+"="+otp);
        }

        loginAsUserProxyAccessLoginRequestModel=null;
        loginAsUserProxyAccessLoginResponseModel=null;
        jsonResponse=null;
        otp=null;

    }

    @Then("^user should not be able to proxy access login and user should get validation error message$")
    public void userShould_Not_BeAbleToProxyAccessLoginOfTheirRespectiveVendorAndUserShouldGetOtp(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
