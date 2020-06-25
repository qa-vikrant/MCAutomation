package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.CreateShippingBandForSellerRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.CreateShippingBandForSellerService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class CreateShippingBandForSellerSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private CreateShippingBandForSellerRequestModel createShippingBandForSellerRequestModel;

    @When("^User enters shipping band details$")
    public void userEnterShippingBandDetails(List<CreateShippingBandForSellerRequestModel> createShippingBandForSellerRequestModelList)
    {
        this.createShippingBandForSellerRequestModel=createShippingBandForSellerRequestModelList.get(0);
        if(createShippingBandForSellerRequestModelList.get(0).getName().equalsIgnoreCase("Harward"))
        {
            this.createShippingBandForSellerRequestModel.setName(createShippingBandForSellerRequestModelList.get(0).getName()+"-"+RandomGenerator.randomAlphanumeric(5));
        }
        if(createShippingBandForSellerRequestModelList.get(0).getDescription().equals("this is the desc for fixed"))
        {
            this.createShippingBandForSellerRequestModel.setDescription(createShippingBandForSellerRequestModelList.get(0).getDescription()+HelperClass.getApiHitTime());
        }
    }

    @When("^User make a request to create shipping band$")
    public void UserMakeRequestToCreateShippingBand()
    {
        jsonResponse = CreateShippingBandForSellerService.CreateShippingBandRequest(createShippingBandForSellerRequestModel,LoginSteps.token);
    }

    @When("^User make a request to request to create shipping band with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_to_request_to_create_shipping_band_with_Incorrectblank_token_field_in_form_of_without_login_credentials(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = CreateShippingBandForSellerService.CreateShippingBandRequest(createShippingBandForSellerRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^User should be able to create shipping band successfully$")
    public void userSuccessfullyCreateShippingBand()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
        jsonResponse=null;
        responseCommonForAll=null;
        createShippingBandForSellerRequestModel=null;
    }

    @Then("^User should not be able to create shipping band and user should get validation error message$")
    public void userValidateShippingBandErrorMsg(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


    @When("^Without isUpdateAllowed field user make a request to create shipping band$")
    public void WithoutIsUpdateAllowedFieldUserMakeRequestToCreateShippingBand()
    {
        if (this.createShippingBandForSellerRequestModel.getIsUpdateAllowed().equals(false))
        {
            this.createShippingBandForSellerRequestModel.setIsUpdateAllowed(null);
        }
        jsonResponse = CreateShippingBandForSellerService.CreateShippingBandRequest(createShippingBandForSellerRequestModel,LoginSteps.token);
    }


}
