package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.productVariant.ProductVariantResponse.ProductVariantResponseModel;
import net.mc.tools.models.productVariant.updateProductVariantImageRequest.UpdateProductVariantImageRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.UpdateProductVariantImageService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class UpdateProductVariantImageSteps
{
    private Response jsonResponse;
    private UpdateProductVariantImageRequestModel updateProductVariantImageRequestModel;
    private ProductVariantResponseModel productVariantResponseModel;

    @When("^user enters the details of productId , id and image url$")
    public void user_enters_the_details_of_productId_for_update_the_product_variant_Image(List<UpdateProductVariantImageRequestModel> updateProductVariantImageRequestModelList) throws Exception
    {
        this.updateProductVariantImageRequestModel=updateProductVariantImageRequestModelList.get(0);
    }


    @When("^user make a request to update product variant image$")
    public void user_make_a_request_to_update_the_product_variant_Image() throws Exception
    {
        jsonResponse= UpdateProductVariantImageService.UpdateProductVariantImageRequest(updateProductVariantImageRequestModel,LoginSteps.token);
        updateProductVariantImageRequestModel=null;
    }

    @When("^User make a request to update the product variant image with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_to_update_the_product_variant_Image_with_Invalid_token(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        jsonResponse= UpdateProductVariantImageService.UpdateProductVariantImageRequest(updateProductVariantImageRequestModel,tokenMessageRequestModelList.get(0).gettoken());
        updateProductVariantImageRequestModel=null;
    }

    @Then("^user should be able to update product variant image$")
    public void user_should_be_able_to_update_the_product_variant_Image(List<String> sellerProductObjectId) throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        productVariantResponseModel =gson().fromJson(jsonResponse.body().prettyPrint(), ProductVariantResponseModel.class);
        Assert.assertEquals("ok", productVariantResponseModel.getStatus());
        Assert.assertEquals(sellerProductObjectId.get(0), productVariantResponseModel.getData().getId());
        Assert.assertTrue(productVariantResponseModel.getData().getPosition()!=null);
        productVariantResponseModel =null;
        jsonResponse=null;
    }


    @Then("^user should not be able to update product variant image and user should get validation error message$")
    public void user_should_not_be_able_to_update_the_product_variant_Image(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


}
