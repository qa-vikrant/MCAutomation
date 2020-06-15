package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.productVariant.ProductVariantResponse.ProductVariantResponseModel;
import net.mc.tools.models.productVariant.UpdateProductVariantRequest.UpdateProductVariantRequestModel;
import net.mc.tools.services.UpdateProductVariantService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class UpdateProductVariantSteps
{
    private Response jsonResponse;
    private UpdateProductVariantRequestModel updateProductVariantRequestModel;
    private ProductVariantResponseModel productVariantResponseModel;

    @When("^User enters the details of product variant for updation$")
    public void user_enters_the_details_of_product_variant_for_updation(List<UpdateProductVariantRequestModel> updateProductVariantRequestModelList) throws Exception
    {
        this.updateProductVariantRequestModel=updateProductVariantRequestModelList.get(0);
        if(!this.updateProductVariantRequestModel.getOption1Val().isEmpty())
        {
            this.updateProductVariantRequestModel.setOption1Val(RandomGenerator.randomInteger(2));
            this.updateProductVariantRequestModel.setSku(RandomGenerator.randomInteger(2));
            this.updateProductVariantRequestModel.setWeight(RandomGenerator.randomInteger(1));
        }
        if(!this.updateProductVariantRequestModel.getOption2Val().isEmpty())
        {
            this.updateProductVariantRequestModel.setOption2Val(RandomGenerator.randomAlphabetic(3));
        }
        if(!this.updateProductVariantRequestModel.getOption3Val().isEmpty())
        {
            this.updateProductVariantRequestModel.setOption3Val(RandomGenerator.randomAlphabetic(4));
        }
    }


    @When("^User make a request to update the variant of product$")
    public void user_make_a_request_to_update_the_product_variant() throws Exception
    {
        jsonResponse= UpdateProductVariantService.UpdateProductVariantRequest(updateProductVariantRequestModel,LoginSteps.token);
        updateProductVariantRequestModel=null;
    }

    @Then("^User should be able to update the variant of product$")
    public void user_should_be_able_to_update_the_variant_of_product(List<String> ProductObjectId) throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        productVariantResponseModel =gson().fromJson(jsonResponse.body().prettyPrint(), ProductVariantResponseModel.class);
        Assert.assertEquals("ok", productVariantResponseModel.getStatus());
        Assert.assertEquals(ProductObjectId.get(0), productVariantResponseModel.getData().getId());
        Assert.assertTrue(productVariantResponseModel.getData().getPosition()!=null);
        productVariantResponseModel =null;
        jsonResponse=null;
    }

    @Then("^User should not be able to update the product variant and user should get validation error message$")
    public void user_should_Not_be_able_to_update_the_variant_of_product(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


}
