package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.orders.request.UpdateOrderRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.UpdateOrderService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateOrderSteps
{

    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private UpdateOrderRequestModel updateOrderRequestModel;



    @And("^User enters order details for update order$")
    public void userEnterDetailsOfOrder(List<UpdateOrderRequestModel> updateOrderRequestModelList)
    {
        updateOrderRequestModel=updateOrderRequestModelList.get(0);
    }

    @And("^User enters notes to be filled by customer for update order$")
    public void enterNoteDetails(List<String> notesStringList)
    {
      updateOrderRequestModel.setNote(notesStringList.get(0)+" "+RandomGenerator.randomAlphabetic(2)+" "+HelperClass.getUpdatedTime());
    }



    @And("^user make a request to update order$")
    public void enterRequestToUpdateOrder()
    {
        jsonResponse = UpdateOrderService.UpdateOrderRequest(updateOrderRequestModel, LoginSteps.token);
    }

    @And("^user make a request to update order with Incorrect/blank token field in form of without login credentials$")
    public void enterRequestToUpdateOrderwithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = UpdateOrderService.UpdateOrderRequest(updateOrderRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }


    @Then("^User should be able to update order$")
    public void userShouldBeAbleToUpdateOrder()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertTrue(responseCommonForAll.getData() != null);
        Assert.assertEquals("ok", responseCommonForAll.getStatus());
    }

    @Then("^User should not be able to update order and user should get validation error message$")
    public void userShouldNotBeAbleToUpdateOrder(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
