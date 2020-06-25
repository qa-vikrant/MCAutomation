package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.DeleteShippingRuleRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.DeleteShippingRuleService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

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

    @When("^User make a request to delete shipping rule$")
    public void userRequestToDeleteShippingRuleId()
    {
        jsonResponse = DeleteShippingRuleService.deleteShippingRuleRequest(deleteShippingRuleRequestModel,LoginSteps.token);

    }

    @When("^User make a request to request to delete shipping rule with Incorrect/blank token field in form of without login credentials$")
    public void userRequestToDeleteShippingRuleIdwithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = DeleteShippingRuleService.deleteShippingRuleRequest(deleteShippingRuleRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^User should be able to delete shipping rule$")
    public void userSuccessfullyDeleteShippingRule()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
        deleteShippingRuleRequestModel=null;
        jsonResponse=null;
        responseCommonForAll=null;
    }

    @Then("^User should not be able to delete shipping rule and user should get validation error message$")
    public void userValidateRuleErrorMsg(List<String> errorMesage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMesage);
    }
}