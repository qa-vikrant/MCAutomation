package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.models.updateProductBySellerAndVendor.updateProductRequest.UpdateProductRequestModel;
import net.mc.tools.services.UpdateProductService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateProductSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private UpdateProductRequestModel updateProductRequestModel=new UpdateProductRequestModel();


    @When("^user enters tag details for Update product$")
    public void user_enter_tags_product_details_toUpdate(List<String> tagsList)
    {

    }

    @When("^user enter image details for Update product$")
    public void user_enter_images_product_details_toUpdate(List<String> imagesList)
    {

    }

    @When("^user enter variant details for Update product$")
    public void user_enter_variants_product_details_toUpdate(List<String> variantsList)
    {

    }


    @When("^user enter other details for Update product$")
    public void user_enter_Update_product_details(List<UpdateProductRequestModel> updateProductRequestModelList)
    {
        this.updateProductRequestModel=updateProductRequestModelList.get(0);

        if(updateProductRequestModelList.get(0).getTitle().equals("Nike"))
        {
            updateProductRequestModel.setTitle(updateProductRequestModel.getTitle()+"  Update Testing  "+ RandomGenerator.randomAlphabetic(4));
        }
        if(updateProductRequestModelList.get(0).getDescription().equals("API Automation by vikrant") || updateProductRequestModelList.get(0).getDescription().equals("API Automation by System Admin"))
        {
            updateProductRequestModel.setDescription("Update Testing"+updateProductRequestModel.getDescription()+"  "+ HelperClass.getApiHitTime());
        }
        if(updateProductRequestModelList.get(0).getHandle().equals("handle"))
        {
            updateProductRequestModel.setHandle(RandomGenerator.randomAlphabetic(4));
        }
        if(updateProductRequestModelList.get(0).getPrice().equals("12"))
        {
            updateProductRequestModel.setPrice(RandomGenerator.randomInteger(4));
        }
        if(updateProductRequestModelList.get(0).getComparePrice().equals("12"))
        {
            updateProductRequestModel.setComparePrice(RandomGenerator.randomInteger(5));
        }
        if(updateProductRequestModelList.get(0).getSku().equals("12"))
        {
            updateProductRequestModel.setSku(RandomGenerator.randomInteger(2));
        }
        if(updateProductRequestModelList.get(0).getWeight().equals("12"))
        {
            updateProductRequestModel.setWeight(RandomGenerator.randomInteger(1));
        }


    }


    @When("^user make request to Update product on marketcube$")
    public void user_make_request_to_Update_product_on_marketcube()
    {
        jsonResponse = UpdateProductService.UpdateProductRequest(updateProductRequestModel, LoginSteps.token);
    }


    @When("^user make request to Update product on marketcube with Incorrect/blank token field in form of without login credentials$")
    public void user_make_request_to_Update_product_on_marketcube_with_Invalid_token(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = UpdateProductService.UpdateProductRequest(updateProductRequestModel, tokenMessageRequestModelList.get(0).gettoken());
    }


    @Then("^user should be able to Update product on marketcube$")
    public void product_Should_Be_Updated_SuccessfullyIntoTheSystem()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);

    }


    @Then("^user should not be able to Update product on marketcube and user should get validation error message$")
    public void productShouldNotBeUpdate(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
