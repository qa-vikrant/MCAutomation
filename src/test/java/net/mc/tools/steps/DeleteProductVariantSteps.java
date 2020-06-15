package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.productVariant.deleteProductVariantRequest.DeleteProductVariantRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.DeleteProductVariantService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class DeleteProductVariantSteps
{
    private Response jsonResponse;
    private DeleteProductVariantRequestModel deleteProductVariantRequestModel;
    private ResponseCommonForAll responseCommonForAll;

    @When("^user enters the details of productId , id and sellerid$")
    public void user_enters_the_details_of_productId_url_of_image_and_sellerid_from_seller_products(List<DeleteProductVariantRequestModel> deleteProductVariantRequestModelList) throws Exception
    {
        this.deleteProductVariantRequestModel=deleteProductVariantRequestModelList.get(0);
    }


    @When("^User make a request to delete the variant of product$")
    public void user_make_a_request_to_delete_the_variant_of_product() throws Exception
    {
        jsonResponse= DeleteProductVariantService.deleteProductVariantRequest(deleteProductVariantRequestModel,LoginSteps.token);


    }

    @Then("^user should be able to delete the variant of product$")
    public void user_should_be_able_to_delete_the_variant_of_product(List<String> ResponseData) throws Exception
    {
        Assert.assertTrue((jsonResponse.getStatusCode()==200));
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals(ResponseData.get(0), responseCommonForAll.getData());
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
        jsonResponse=null;
        deleteProductVariantRequestModel=null;

    }

    @Then("^user should not be able to delete the product variant and user should get validation error message$")
    public void user_should_not_be_able_to_delete_the_variant_of_product(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);

    }


    @When("^User make a request to delete the variant of product with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_delete_the_variant_of_product_with_Incorrect_blank_token_field_in_form_of_without_login_credentials(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        jsonResponse=DeleteProductVariantService.deleteProductVariantRequest(deleteProductVariantRequestModel,tokenMessageRequestModelList.get(0).gettoken());
        deleteProductVariantRequestModel=null;

    }

}
