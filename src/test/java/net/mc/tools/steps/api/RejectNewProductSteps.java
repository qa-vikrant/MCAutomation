package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.models.productVariant.ProductVariantResponse.ProductVariantResponseModel;
import net.mc.tools.models.rejectNewProduct.rejectNewProductRequest.RejectNewProductRequestModel;
import net.mc.tools.services.auth.RejectNewProductService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class RejectNewProductSteps
{
    private Response jsonResponse;
    private RejectNewProductRequestModel rejectNewProductRequestModel;
    private ProductVariantResponseModel productVariantResponseModel;

    @When("^user enters the product details that he wants to reject$")
    public void user_enters_the_product_details_that_he_wants_to_reject(List<RejectNewProductRequestModel> rejectNewProductRequestModelList) throws Exception
    {
     this.rejectNewProductRequestModel=rejectNewProductRequestModelList.get(0);
    }

    @When("^user make a request to reject the desired product$")
    public void user_make_a_request_to_reject_the_desired_product() throws Exception
    {
      jsonResponse= RejectNewProductService.RejectNewProductRequest(rejectNewProductRequestModel,LoginSteps.token);

    }

    @Then("^user should be able to reject the desired product$")
    public void user_should_be_able_to_reject_the_desired_product(List<String> ProductObjectId) throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        productVariantResponseModel =gson().fromJson(jsonResponse.body().prettyPrint(), ProductVariantResponseModel.class);
        Assert.assertEquals("ok", productVariantResponseModel.getStatus());
        Assert.assertEquals(ProductObjectId.get(0), productVariantResponseModel.getData().getId());
        Assert.assertTrue(productVariantResponseModel.getData().getPosition()!=null);
        productVariantResponseModel =null;
        jsonResponse=null;
    }


}
