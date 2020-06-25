package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.UpdateShippingBandRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.CreateShippingBandForSellerService;
import net.mc.tools.services.UpdateShippingBandService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateShippingBandSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private UpdateShippingBandRequestModel updateShippingBandRequestModel;

    @When("^User enters shipping band details to update$")
    public void userEnterUpdateShippingOfferId(List<UpdateShippingBandRequestModel> updateShippingBandRequestModelList)
    {
        this.updateShippingBandRequestModel=updateShippingBandRequestModelList.get(0);
        if(updateShippingBandRequestModelList.get(0).getDescription().equals("Testing"))
        {
            this.updateShippingBandRequestModel.setDescription(updateShippingBandRequestModelList.get(0).getDescription()+HelperClass.getUpdatedTime());
        }
        if(updateShippingBandRequestModelList.get(0).getName().equals("Vikrant1"))
        {
            this.updateShippingBandRequestModel.setName(updateShippingBandRequestModelList.get(0).getName()+"-"+RandomGenerator.randomAlphabetic(5));
        }
    }


    @When("^User enter details for update shipping band for seller with Incorrect/blank token field$")
    public void userEnterUpdateShippingOfferIdforBlankToken(List<UpdateShippingBandRequestModel> updateShippingBandRequestModelList)
    {
       this.updateShippingBandRequestModel=updateShippingBandRequestModelList.get(0);
    }

    @When("^User make a request to update shipping band$")
    public void UserMakeARequestToUpdateShippingBand()
    {
        jsonResponse = UpdateShippingBandService.UpdateShippingBandRequest(updateShippingBandRequestModel,LoginSteps.token);
    }

    @When("^User make a request to request to update shipping band with Incorrect/blank token field in form of without login credentials$")
    public void userEnterUpdateShippingOfferIdRequest(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = UpdateShippingBandService.UpdateShippingBandRequest(updateShippingBandRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^User should be able to update shipping band$")
    public void userSuccessfullyUpdateShippingOffer()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
        jsonResponse=null;
        responseCommonForAll=null;
        updateShippingBandRequestModel=null;
    }

    @Then("^User should not be able to update shipping band and user should get validation error message$")
    public void userValidateErrorMsgUpdateOffer(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

    @When("^Without isUpdateAllowed field user make a request to update shipping band$")
    public void WithoutIsUpdateAllowedFieldUserMakeRequestToCreateShippingBand()
    {
        if (this.updateShippingBandRequestModel.getIsUpdateAllowed().equals(false))
        {
            this.updateShippingBandRequestModel.setIsUpdateAllowed(null);
        }
        jsonResponse = UpdateShippingBandService.UpdateShippingBandRequest(updateShippingBandRequestModel,LoginSteps.token);
    }
}