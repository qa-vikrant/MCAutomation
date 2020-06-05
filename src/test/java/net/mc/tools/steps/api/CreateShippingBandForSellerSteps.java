package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.CreateShippingBandForSellerRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.CreateShippingBandForSellerService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.auth.RegisterService.gson;

public class CreateShippingBandForSellerSteps
{
    public static  String token = null;
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private List<CreateShippingBandForSellerRequestModel> shippingBandForSellerRequestModel;
       private static int i = 0;

    @When("^User enter details for create shipping band for seller$")
    public void userEnterShippingBandDetails(List<CreateShippingBandForSellerRequestModel> shippingBandForSellerRequestModel)
    {
        if(shippingBandForSellerRequestModel.get(0).getName().equalsIgnoreCase("Vikrant"))
        {
            shippingBandForSellerRequestModel.get(0).setName(shippingBandForSellerRequestModel.get(0).getName()+ RandomGenerator.randomAlphanumeric(5));
        }
        jsonResponse = CreateShippingBandForSellerService.CreateShippingBandRequest(shippingBandForSellerRequestModel,LoginSteps.token);

    }

    @When("^User enter details for create shipping band for seller with already existed shipping band name$")
    public void User_enter_details_for_create_shipping_band_for_seller_with_already_existed_shipping_band_name(List<CreateShippingBandForSellerRequestModel> shippingBandForSellerRequestModel)
    {
        jsonResponse = CreateShippingBandForSellerService.CreateShippingBandRequest(shippingBandForSellerRequestModel,LoginSteps.token);

    }

    @When("^User enter details for create shipping band for seller with Incorrect/blank token field$")
    public void User_enter_details_for_create_shipping_band_for_seller_with_Incorrectblank_token_field(List<CreateShippingBandForSellerRequestModel> shippingBandForSellerRequestModel)
    {
        this.shippingBandForSellerRequestModel=shippingBandForSellerRequestModel;

    }
    @When("^user make a request to request to create shipping band with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_to_request_to_create_shipping_band_with_Incorrectblank_token_field_in_form_of_without_login_credentials(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = CreateShippingBandForSellerService.CreateShippingBandRequest(shippingBandForSellerRequestModel,tokenMessageRequestModelList.get(0).gettoken());

    }

    @Then("^User should be able to create shipping band successfully for seller$")
    public void userSuccessfullyCreateShippingBand()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
        jsonResponse=null;
    }

    @Then("^User should not be able to create shipping band for seller and user should get validation message$")
    public void userValidateShippingBandErrorMsg(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
