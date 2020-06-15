package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.DeleteShippingBandRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.DeleteShippingBandService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class DeleteShippingBandForSellerSteps
{

    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private DeleteShippingBandRequestModel deleteShippingBandRequestModel;

    @When("^User enters shippingBandId$")
    public void userEnterShippingBandId(List<DeleteShippingBandRequestModel> deleteShippingBandRequestModelList)
    {
      deleteShippingBandRequestModel=deleteShippingBandRequestModelList.get(0);
    }

    @When("^user make request to delete shipping band$")
    public void user_make_request_to_delete_shipping_band()
    {
        jsonResponse = DeleteShippingBandService.deleteShippingBandRequest(deleteShippingBandRequestModel, LoginSteps.token);
        deleteShippingBandRequestModel=null;
    }


    @Then("^User should be able to delete shipping band for seller$")
    public void userSuccessfullyDeleteShippingBand()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
    }

    @Then("^User should not be able to delete shipping band of seller and user should get a validation message$")
    public void userValidateErrorMsg(List<String> errorMesage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMesage);
    }

    @When("^user make a request to request to delete shipping band with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_to_request_to_delete_shipping_band_with_Incorrectblank_token_field_inform_of_without_login_credentials(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = DeleteShippingBandService.deleteShippingBandRequest(deleteShippingBandRequestModel, tokenMessageRequestModelList.get(0).gettoken());
        deleteShippingBandRequestModel=null;
    }

}