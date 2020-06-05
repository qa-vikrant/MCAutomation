package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.actionsOnbulkProduct.bulkProductRequest.BulkProductRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAllBooleanData;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.BulkDeleteProductsBySellerAndVendorService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class BulkDeleteProductsBySellerAndVendorSteps
{
    private Response jsonResponse;
    private BulkProductRequestModel bulkProductRequestModel;
    private String[] productIds;
    private ResponseCommonForAllBooleanData responseCommonForAllBooleanData;

    @Given("^user enters productIds to Delete products$")
    public void user_enters_productIds_to_Delete_products(List<String> productIdList) throws Exception
    {
        productIds=new String[productIdList.size()];
        for (int i=0;i<productIds.length;i++)
        {
            productIds[i]=productIdList.get(i);
        }
    }

    @Given("^user enter actions details to Delete products$")
    public void user_enter_actions_details_to_Delete_products(List<BulkProductRequestModel> bulkProductRequestModelList) throws Exception
    {
        this.bulkProductRequestModel=bulkProductRequestModelList.get(0);
        this.bulkProductRequestModel.setIds(productIds);
    }

    @When("^user make request to Delete products in bulk$")
    public void user_make_request_to_Delete_products_in_bulk() throws Exception
    {
        jsonResponse= BulkDeleteProductsBySellerAndVendorService.BulkDeleteProductsRequest(bulkProductRequestModel,LoginSteps.token);

    }

    @When("^user make request to Delete products in bulk with Incorrect/blank token field in form of without login credentials$")
    public void user_make_request_to_Delete_products_in_bulk_with_invalid_Token(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        jsonResponse= BulkDeleteProductsBySellerAndVendorService.BulkDeleteProductsRequest(bulkProductRequestModel,tokenMessageRequestModelList.get(0).gettoken());

    }

    @Then("^user should be able to Delete products in bulk$")
    public void user_should_be_able_to_Delete_products_in_bulk() throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAllBooleanData=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAllBooleanData.class);
        Assert.assertEquals("ok",responseCommonForAllBooleanData.getStatus());
        Assert.assertEquals(true,responseCommonForAllBooleanData.getData());
        productIds=null;
        jsonResponse=null;
        bulkProductRequestModel=null;
        responseCommonForAllBooleanData=null;
    }


    @Then("^user should not be able to Delete products in bulk and user should get validation error message$")
    public void user_should_not_be_able_to_Delete_products_in_bulk(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

}
