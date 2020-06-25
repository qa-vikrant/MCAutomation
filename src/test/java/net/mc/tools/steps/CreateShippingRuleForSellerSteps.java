package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.CreateShippingRuleForSellerRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.CreateShippingRuleForSellerService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class CreateShippingRuleForSellerSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    CreateShippingRuleForSellerRequestModel createShippingRuleForSellerRequestModel=new CreateShippingRuleForSellerRequestModel();
    private String[] productIds=new String[1];
    private String[] destinationCodes=new String[1];

    @Then("^User should be able to create shipping rule$")
    public void userSuccessfullyCreateShippingRule()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
        createShippingRuleForSellerRequestModel=null;
        jsonResponse=null;
        responseCommonForAll=null;
    }

    @Then("^User should not be able to create new shipping rule and user should gets validation error message$")
    public void userValidateErrorMsgForCreateShippingRule(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


    @When("^User enters destination details$")
    public void user_enters_destination_details(List<String> destinationCodesStringList) throws Exception
    {
        if (destinationCodesStringList.get(0).equals("ES"))
        {
            this.destinationCodes[0]=destinationCodesStringList.get(0);

        }
        createShippingRuleForSellerRequestModel.setDestinationCodes(destinationCodes);
        destinationCodes=null;
    }

    @When("^User enters product details$")
    public void user_enters_product_details(List<String> productIdsStringList) throws Exception
    {
        if (productIdsStringList.get(0).equals("5ef2d8ea1ff87400116ebda7"))
        {
            this.productIds[0]=productIdsStringList.get(0);
        }
        createShippingRuleForSellerRequestModel.setProductIds(productIds);
        productIds=null;
    }


    @When("^User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule$")
    public void user_enters_the_shippingBandID_detailsFor_shipping_rule(List<CreateShippingRuleForSellerRequestModel> createShippingRuleForSellerRequestModelList) throws Exception
    {
        this.createShippingRuleForSellerRequestModel=createShippingRuleForSellerRequestModelList.get(0);
    }


    @When("^User make a request to create new shipping rules based on the destination$")
    public void User_make_a_request_to_create_new_shipping_rules_based_on_the_destination() throws Exception
    {
        createShippingRuleForSellerRequestModel.setProductIds(null);
        jsonResponse= CreateShippingRuleForSellerService.CreateShippingRuleRequest(createShippingRuleForSellerRequestModel,LoginSteps.token);
    }

    @When("^User make a request to create new shipping rules based on the products$")
    public void Usermakearequesttocreatenewshippingrulesbasedontheproducts() throws Exception
    {
        createShippingRuleForSellerRequestModel.setDestinationCodes(null);
        jsonResponse= CreateShippingRuleForSellerService.CreateShippingRuleRequest(createShippingRuleForSellerRequestModel,LoginSteps.token);
    }

    @When("^User make a request to create new shipping rules based on the destination with Incorrect/blank token field in form of without login credentials$")
    public void UsermakearequesttocreatenewshippingrulesbasedontheproductswithIncorrectToken(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        createShippingRuleForSellerRequestModel.setProductIds(null);
        jsonResponse= CreateShippingRuleForSellerService.CreateShippingRuleRequest(createShippingRuleForSellerRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }



}