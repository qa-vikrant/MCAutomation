package net.mc.tools.steps.api;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.jayway.restassured.path.json.JsonPath;
import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.models.fetchListOfProducts.fetchListOfProductsRequest.FetchListOfProductsRequestModel;
import net.mc.tools.models.fetchListOfProducts.fetchListOfProductsResponse.FetchListOfProductsResponseModel;
import net.mc.tools.models.fetchListOfProducts.fetchListOfProductsResponse.Product;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.FetchListOfProductsService;
import org.junit.Assert;

import java.util.List;
import java.util.Map;

import static net.mc.tools.helpers.ApiHelper.gson;


public class FetchListOfProductsSteps
{
    private FetchListOfProductsRequestModel fetchListOfProductsRequestModel;
    private Response jsonResponse;
    private FetchListOfProductsResponseModel fetchListOfProductsResponseModel;
    private Product product;

     private JsonPath jsonPath,jsonPath2;

    private List<Product> products;
    private String status,MapProduct;

    private Map<String,Object> ProductMap;
    private ObjectMapper mapper=new ObjectMapper();


    @Then("^user enters the requesterID for product list$")
    public void user_enters_the_requesterID_for_product_list(List<FetchListOfProductsRequestModel> fetchListOfProductsRequestModelList1) throws Exception
    {
        this.fetchListOfProductsRequestModel=fetchListOfProductsRequestModelList1.get(0);
    }


    @Then("^user make a request to fetch list of products$")
    public void user_make_a_request_to_fetch_list_of_products() throws Exception
    {
        jsonResponse= FetchListOfProductsService.FetchListOfProductRequestWithToken(fetchListOfProductsRequestModel,LoginSteps.token);
    }


    @Then("^User should be able to fetch product list that he requested$")
    public void user_should_be_able_to_fetch_product_list_that_he_requested() throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        fetchListOfProductsResponseModel = gson().fromJson(jsonResponse.body().prettyPrint(), FetchListOfProductsResponseModel.class);

        System.out.println("Total No of Products for this seller is : " + fetchListOfProductsResponseModel.getCount());
        int NoOfProducts=fetchListOfProductsResponseModel.getProducts().size();
        System.out.println("No of Products in current page is : " + NoOfProducts);
        for (int i = 0; i <fetchListOfProductsResponseModel.getProducts().size();i++)
        {
            System.out.println("No of Images in current product is : " + fetchListOfProductsResponseModel.getProducts().get(i).getImages().size());
            System.out.println("No of Variants in current Product is : " + fetchListOfProductsResponseModel.getProducts().get(i).getVariants().size());
        }

    }



    @Then("^User should be able to fetch product list that system admin requested$")
    public void user_should_be_able_to_fetch_product_list_that_system_admin_requested() throws Exception
    {
        jsonResponse.body().prettyPrint();
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);

    }


    @Then("^User should not be able to fetch products list that he requested and user should get validation message$")
    public void User_should_not_be_able_to_fetch_products_list_that_he_requested_and_user_should_get_validation_message(List<String> errorMessage) throws Exception
    {
       // HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }



    @When("^user make a request for list of products with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_for_list_of_products_with_Incorrect_blank_token_field_in_form_of_without_login_credentials(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        //jsonResponse= FetchListOfProductsService.FetchListOfProductRequestWithToken(fetchListOfProductsRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }



}
