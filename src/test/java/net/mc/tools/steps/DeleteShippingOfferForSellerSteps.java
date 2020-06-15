package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.DeleteShippingOfferRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.DeleteShippingOfferService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class DeleteShippingOfferForSellerSteps
   {

    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private DeleteShippingOfferRequestModel deleteShippingOfferRequestModel;

    @When("^User enters shippingOfferId$")
    public void userEnterShippingOfferId(List<DeleteShippingOfferRequestModel> deleteShippingOfferRequestModelList)
    {
      this.deleteShippingOfferRequestModel=deleteShippingOfferRequestModelList.get(0);
    }

    @When("^user make a request to delete shipping offer$")
    public void userRequestToDeleteShippingOffer()
    {
       jsonResponse = DeleteShippingOfferService.shippingOfferDeleteReq(deleteShippingOfferRequestModel,LoginSteps.token);
       deleteShippingOfferRequestModel=null;
    }


    @When("^user make a request to request to delete shipping offer with Incorrect/blank token field in form of without login credentials$")
    public void userRequestToDeleteShippingOfferwithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = DeleteShippingOfferService.shippingOfferDeleteReq(deleteShippingOfferRequestModel,tokenMessageRequestModelList.get(0).gettoken());
        deleteShippingOfferRequestModel=null;
    }

    @Then("^User should be able to delete shipping offer$")
    public void userSuccessfullyDeleteShippingOffer()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
        responseCommonForAll=null;
    }

    @Then("^User should not be able to delete shipping offer and user should get validation error message$")
    public void userValidateErrorMsgOffer(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}