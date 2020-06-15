package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.UpdateShippingBandRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.UpdateShippingBandService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateShippingBandSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private List<UpdateShippingBandRequestModel> updateShippingOfferRequestModels;
    private static int i;

    @When("^User enters shipping band details to update$")
    public void userEnterUpdateShippingOfferId(List<UpdateShippingBandRequestModel> updateShippingOfferRequestModels)
    {
        jsonResponse = UpdateShippingBandService.req(updateShippingOfferRequestModels,LoginSteps.token);
    }


    @When("^User enters shipping band details to update for vendor$")
    public void userEnterUpdateShippingOfferId_for_vendor(List<UpdateShippingBandRequestModel> updateShippingOfferRequestModels)
    {

            updateShippingOfferRequestModels.get(0).setParentId(updateShippingOfferRequestModels.get(0).get_id());

        jsonResponse = UpdateShippingBandService.req(updateShippingOfferRequestModels,LoginSteps.token);
    }

    @When("^User enter details for update shipping band for seller with Incorrect/blank token field$")
    public void userEnterUpdateShippingOfferIdforBlankToken(List<UpdateShippingBandRequestModel> updateShippingOfferRequestModels)
    {

       this.updateShippingOfferRequestModels=updateShippingOfferRequestModels;

    }

    @When("^user make a request to request to update shipping band with Incorrect/blank token field in form of without login credentials$")
    public void userEnterUpdateShippingOfferIdRequest(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {

        jsonResponse = UpdateShippingBandService.req(updateShippingOfferRequestModels,tokenMessageRequestModelList.get(0).gettoken());

    }

    @Then("^User should be able to update shipping band$")
    public void userSuccessfullyUpdateShippingOffer()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
    }

    @Then("^User should not be able to update shipping band and user should get validate error message$")
    public void userValidateErrorMsgUpdateOffer(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}