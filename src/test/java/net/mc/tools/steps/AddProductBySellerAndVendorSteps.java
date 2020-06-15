package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.addProduct.request.AddProductRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.AddProductBySellerAndVendorService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class AddProductBySellerAndVendorSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private AddProductRequestModel addProductRequestModel=new AddProductRequestModel();


    @When("^user enters tag details for new product$")
    public void user_enter_tags_product_details(List<String> tagsList)
    {

    }

    @When("^user enter image details for new product$")
    public void user_enter_images_product_details(List<String> imagesList)
    {

    }

    @When("^user enter variant details for new product$")
    public void user_enter_variants_product_details(List<String> variantsList)
    {

    }


    @When("^user enter other details for new product$")
    public void user_enter_new_product_details(List<AddProductRequestModel> addProductRequestModelList)
    {
        this.addProductRequestModel=addProductRequestModelList.get(0);

        if(addProductRequestModelList.get(0).getTitle().equals("Nike"))
        {
            addProductRequestModel.setTitle(addProductRequestModel.getTitle()+"  "+RandomGenerator.randomAlphabetic(4));
        }
        if(addProductRequestModelList.get(0).getDescription().equals("API Automation by vikrant") || addProductRequestModelList.get(0).getDescription().equals("API Automation by System Admin"))
        {
            addProductRequestModel.setDescription(addProductRequestModel.getDescription()+"  "+ HelperClass.getApiHitTime());
        }
        if(addProductRequestModelList.get(0).getHandle().equals("handle"))
        {
            addProductRequestModel.setHandle(RandomGenerator.randomAlphabetic(4));
        }
        if(addProductRequestModelList.get(0).getPrice().equals("12"))
        {
            addProductRequestModel.setPrice(RandomGenerator.randomInteger(4));
        }
        if(addProductRequestModelList.get(0).getComparePrice().equals("12"))
        {
            addProductRequestModel.setComparePrice(RandomGenerator.randomInteger(5));
        }
        if(addProductRequestModelList.get(0).getSku().equals("12"))
        {
            addProductRequestModel.setSku(RandomGenerator.randomInteger(2));
        }
        if(addProductRequestModelList.get(0).getWeight().equals("12"))
        {
            addProductRequestModel.setWeight(RandomGenerator.randomInteger(1));
        }

    }


    @When("^user make request to add product on marketcube$")
    public void user_make_request_to_add_product_on_marketcube()
    {
        jsonResponse = AddProductBySellerAndVendorService.AddProductRequest(addProductRequestModel,LoginSteps.token);
    }



    @When("^user make request to add product on marketcube with Incorrect/blank token field in form of without login credentials$")
    public void user_make_request_to_add_product_on_marketcube_with_Invalid_Token(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = AddProductBySellerAndVendorService.AddProductRequest(addProductRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }



    @Then("^user should be able to add product on marketcube$")
    public void product_Should_BeRegisteredSuccessfullyIntoTheSystem()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok", responseCommonForAll.getStatus());
        Assert.assertTrue(responseCommonForAll.getData() != null);
        jsonResponse=null;
        responseCommonForAll=null;
    }


    @Then("^user should not be able to add product on marketcube and user should get validation error message$")
    public void productShouldNotBeAdded(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
