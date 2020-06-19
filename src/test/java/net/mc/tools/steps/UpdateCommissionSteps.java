package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.commission.request.CommissionRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.CommissionService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateCommissionSteps
{
     private Response jsonResponse;
     private CommissionRequestModel commissionRequestModel;
     private ResponseCommonForAll responseCommonForAll;

    @When("^User enters the commision details$")
    public void UserEntersTheCommisionDetails(List<CommissionRequestModel> commissionRequestModelList)
    {
       this.commissionRequestModel=commissionRequestModelList.get(0);
    }

    @When("^User make a request to update the commission$")
    public void userMakeCommissionChangeRequest()
    {
        jsonResponse = CommissionService.commissionChangeRequest(commissionRequestModel,LoginSteps.token);
    }

    @When("^User make a request to update the commission with incorrect/blank token field in form of without login credentials$")
    public void userMakeCommissionChangeRequestWithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = CommissionService.commissionChangeRequest(commissionRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^User should be able to update the commission$")
    public void userShouldBeAbleToChangeCommission()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
        jsonResponse=null;
        responseCommonForAll=null;
        commissionRequestModel=null;

    }

    @Then("^User should not be able to update the commission and user should get validation error message$")
    public void userShouldNotBeAbleToChangeWithoutCommission(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }



}
