package net.mc.tools.steps.api;

import com.jayway.restassured.path.json.JsonPath;
import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.models.updatePlanFeaturesOfSellers.updatePlanFeaturesOfSellersRequest.UpdatePlanFeaturesOfSellersRequestModel;
import net.mc.tools.models.updatePlanFeaturesOfSellers.updatePlanFeaturesOfSellersRequest.UpdatePlanFeaturesOfSellersRequestModelLong;
import net.mc.tools.services.auth.UpdatePlanFeaturesOfSellersService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class UpdatePlanFeaturesOfSellersSteps
{
    private Response jsonResponse;
    JsonPath jsonPath;
    private UpdatePlanFeaturesOfSellersRequestModel updatePlanFeaturesOfSellersRequestModel;
    private UpdatePlanFeaturesOfSellersRequestModelLong updatePlanFeaturesOfSellersRequestModelLong;
    private ResponseCommonForAll responseCommonForAll;

    @And("^user enters the seller details and new plan details$")
    public void userEntersTheSellerDetailsAndNewPlanDetails(List<UpdatePlanFeaturesOfSellersRequestModelLong> updatePlanFeaturesOfSellersRequestModelList)
    {
        this.updatePlanFeaturesOfSellersRequestModelLong=updatePlanFeaturesOfSellersRequestModelList.get(0);
    }

    @And("^user make a request to Update plan features of seller$")
    public void userMakeARequestToUpdatePlanFeaturesOfSellers()
    {
      jsonResponse= UpdatePlanFeaturesOfSellersService.UpdatePlanFeaturesOfSellersLongRequest(updatePlanFeaturesOfSellersRequestModelLong,LoginSteps.token);
    }

    @And("^user make request to Update plan features of sellers with Incorrect/blank token field in form of without login credentials$")
    public void userMakeARequestToUpdatePlanFeaturesOfSellersWithInvalidLogin(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse= UpdatePlanFeaturesOfSellersService.UpdatePlanFeaturesOfSellersLongRequest(updatePlanFeaturesOfSellersRequestModelLong,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^user should be able to Update plan features of seller$")
    public void userShouldBeAbleToUpdatePlanFeaturesOfSellers()
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
        Assert.assertEquals("true",responseCommonForAll.getData());

    }


    @Then("^user should not be able to Update plan features of seller and user should get validation error message$")
    public void userShould_Not_BeAbleToUpdatePlanFeaturesOfSellers(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

//for non long type  maxProducts and maxVendors field request model-------------------------------------

    @And("^user enters the seller detail and new plan detail$")
    public void userEntersTheSellerDetailsAndNewPlanDetailslong(List<UpdatePlanFeaturesOfSellersRequestModel> updatePlanFeaturesOfSellersRequestModelList)
    {
        this.updatePlanFeaturesOfSellersRequestModel=updatePlanFeaturesOfSellersRequestModelList.get(0);
    }

    @And("^user make a request to Update plan feature of seller$")
    public void userMakeARequestToUpdatePlanFeaturesOfSellerslong()
    {
        jsonResponse= UpdatePlanFeaturesOfSellersService.UpdatePlanFeaturesOfSellersRequest(updatePlanFeaturesOfSellersRequestModel,LoginSteps.token);
    }

}
