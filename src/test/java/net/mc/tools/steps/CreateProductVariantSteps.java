package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.productVariant.createProductVariantRequest.CreateProductVariantRequestModel;
import net.mc.tools.models.productVariant.ProductVariantResponse.ProductVariantResponseModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.CreateProductVariantService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class CreateProductVariantSteps
{
    private Response jsonResponse;
    private CreateProductVariantRequestModel productVariantRequestModel;
    private ProductVariantResponseModel productVariantResponseModel;

    @When("^User enters the details of product variant$")
    public void user_enters_the_details_of_product_variant(List<CreateProductVariantRequestModel> createProductVariantRequestModelList) throws Exception
    {
        this.productVariantRequestModel=createProductVariantRequestModelList.get(0);
        if(!this.productVariantRequestModel.getOption1Val().isEmpty())
        {
          this.productVariantRequestModel.setOption1Val(RandomGenerator.randomInteger(2));
          this.productVariantRequestModel.setSku(RandomGenerator.randomInteger(2));
          this.productVariantRequestModel.setWeight(RandomGenerator.randomInteger(1));
        }
        if(!this.productVariantRequestModel.getOption2Val().isEmpty())
        {
            this.productVariantRequestModel.setOption2Val(RandomGenerator.randomAlphabetic(3));
        }
        if(!this.productVariantRequestModel.getOption3Val().isEmpty())
        {
            this.productVariantRequestModel.setOption3Val(RandomGenerator.randomAlphabetic(4));
        }

    }

    @When("^User make a request to create the variant of product$")
    public void user_make_a_request_to_create_the_variant_of_product() throws Exception
    {
           jsonResponse= CreateProductVariantService.CreateProductVariantRequest(productVariantRequestModel,LoginSteps.token);

    }

    @When("^User make a request to create the variant of product with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_to_create_the_variant_of_product_With_Invalid_Token(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        jsonResponse= CreateProductVariantService.CreateProductVariantRequest(productVariantRequestModel,tokenMessageRequestModelList.get(0).gettoken());

    }

    @Then("^User should be able to create the variant of product$")
    public void user_should_be_able_to_create_the_variant_of_product(List<String> ProductObjectId) throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        productVariantResponseModel =gson().fromJson(jsonResponse.body().prettyPrint(), ProductVariantResponseModel.class);
        Assert.assertEquals("ok", productVariantResponseModel.getStatus());
        Assert.assertEquals(ProductObjectId.get(0), productVariantResponseModel.getData().getId());
        Assert.assertTrue(productVariantResponseModel.getData().getPosition()!=null);
        productVariantResponseModel =null;
        productVariantRequestModel=null;
    }


    @Then("^User should not be able to create the product variant and user should get validation error message$")
    public void user_should_Not_be_able_to_create_the_variant_of_product(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
