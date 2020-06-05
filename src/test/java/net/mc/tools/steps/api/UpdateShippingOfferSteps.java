package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.UpdateShippingOfferRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.UpdateShippingOfferService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.auth.RegisterService.gson;

public class UpdateShippingOfferSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private UpdateShippingOfferRequestModel updateShippingOfferRequestModel;


    @When("^User enters shipping offer details$")
    public void userEnterUpdateShippingOffer(List<UpdateShippingOfferRequestModel> updateShippingOfferRequestModelList)
    {
       this.updateShippingOfferRequestModel=updateShippingOfferRequestModelList.get(0);
       if (updateShippingOfferRequestModelList.get(0).getDescription().length()!=0)
       {
           updateShippingOfferRequestModel.setDescription(updateShippingOfferRequestModelList.get(0).getDescription()+HelperClass.getApiHitTime());
       }

       if (updateShippingOfferRequestModelList.get(0).getPrice().length()!=0)
       {
           updateShippingOfferRequestModel.setPrice(RandomGenerator.randomInteger(2));
       }
    }

    @When("^User make a request to update shipping offer$")
    public void userRequestToUpdateShippingOffer()
    {

        jsonResponse = UpdateShippingOfferService.UpdateShippingOfferRequest(updateShippingOfferRequestModel,LoginSteps.token);

    }

    @When("^User make a request to update shipping offer with Incorrect/blank token field in form of without login credentials$")
    public void userRequestToUpdateShippingOfferWithInavidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {

        jsonResponse = UpdateShippingOfferService.UpdateShippingOfferRequest(updateShippingOfferRequestModel,tokenMessageRequestModelList.get(0).gettoken());

    }


    @Then("^User should be able to update shipping offer successfully$")
    public void userSuccessfullyUpdateShippingOffer()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
    }

    @Then("^User should not be able to update shipping offer for seller and user should get validation error message$")
    public void userValidateErrorMsgUpdateOffer(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}