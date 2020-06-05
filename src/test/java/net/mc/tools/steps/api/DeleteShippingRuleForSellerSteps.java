package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.DeleteShippingRuleRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.DeleteShippingRuleService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.auth.RegisterService.gson;

public class DeleteShippingRuleForSellerSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private DeleteShippingRuleRequestModel deleteShippingRuleRequestModel;


    @When("^User enters shippingRuleId$")
    public void userEnterShippingRuleId(List<DeleteShippingRuleRequestModel> deleteShippingRuleRequestModelList)
    {
       deleteShippingRuleRequestModel=deleteShippingRuleRequestModelList.get(0);
    }

    @When("^user make a request to delete shipping rule$")
    public void userRequestToDeleteShippingRuleId()
    {
        jsonResponse = DeleteShippingRuleService.deleteShippingRuleReq(deleteShippingRuleRequestModel,LoginSteps.token);
        deleteShippingRuleRequestModel=null;
    }

    @When("^user make a request to request to delete shipping rule with Incorrect/blank token field in form of without login credentials$")
    public void userRequestToDeleteShippingRuleIdwithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = DeleteShippingRuleService.deleteShippingRuleReq(deleteShippingRuleRequestModel,tokenMessageRequestModelList.get(0).gettoken());
        deleteShippingRuleRequestModel=null;
    }

    @Then("^User should be able to delete shipping rule$")
    public void userSuccessfullyDeleteShippingRule()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
    }

    @Then("^User should not be able to delete shipping rule and user should get validation error message$")
    public void userValidateRuleErrorMsg(List<String> errorMesage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMesage);
    }
}