package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.UpdateShippingRuleforSellerandVendorRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.UpdateShippingRuleforSellerandVendorService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateShippingRuleforSellerandVendorSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private UpdateShippingRuleforSellerandVendorRequestModel updateRuleObject=new UpdateShippingRuleforSellerandVendorRequestModel();
    private String[] productIds=new String[1];
    private String[] destinationCodes=new String[1];

    @When("^User enters destination details for updation$")
    public void user_enters_destination_details(List<String> destinationCodesStringList) throws Exception
    {
        if (destinationCodesStringList.get(0).equals("UK"))
        {
            this.destinationCodes[0]= RandomGenerator.randomAlphabetic(2);
        }
       else
            {
            this.destinationCodes[0] = destinationCodesStringList.get(0);
        }

        if (destinationCodesStringList.get(0)==null)
        {
            this.destinationCodes[0] =null;
        }
        updateRuleObject.setDestinationCodes(destinationCodes);
    }

    @When("^User enters product details for updation$")
    public void user_enters_product_details(List<String> productIdsStringList) throws Exception
    {
        if (productIdsStringList.get(0).equals("12DFF344DFFFF1"))
        {
            this.productIds[0]=RandomGenerator.randomAlphanumeric(10)+productIdsStringList.get(0);
        }
        else {
            this.productIds[0]=productIdsStringList.get(0);
        }
        if (productIdsStringList.get(0)==null)
        {
            this.productIds[0]=null;
        }
        updateRuleObject.setProductIds(productIds);
    }


    @When("^User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation$")
    public void user_enters_the_shippingBandID_details_Price_details_shipping_rule_condition_and_description_of_shipping_rule(List<UpdateShippingRuleforSellerandVendorRequestModel> updateShippingRuleforSellerandVendorRequestModelList) throws Exception
    {
        updateRuleObject.setCondition(updateShippingRuleforSellerandVendorRequestModelList.get(0).getCondition());
        updateRuleObject.setDescription(updateShippingRuleforSellerandVendorRequestModelList.get(0).getDescription());
        updateRuleObject.setPrice(updateShippingRuleforSellerandVendorRequestModelList.get(0).getPrice());
        updateRuleObject.setPriceType(updateShippingRuleforSellerandVendorRequestModelList.get(0).getPriceType());
        updateRuleObject.setShippingBandId(updateShippingRuleforSellerandVendorRequestModelList.get(0).getShippingBandId());
        updateRuleObject.setIsShippingDisabled(updateShippingRuleforSellerandVendorRequestModelList.get(0).getIsShippingDisabled());
        updateRuleObject.set_id(updateShippingRuleforSellerandVendorRequestModelList.get(0).get_id());
    }


    @When("^User make a request to update shipping rules based on the destination$")
    public void User_make_a_request_to_updateshipping_based_on_the_destination() throws Exception
    {
        updateRuleObject.setProductIds(null);
        jsonResponse= UpdateShippingRuleforSellerandVendorService.UpdateShippingRuleRequest(updateRuleObject,LoginSteps.token);
        updateRuleObject=null;
    }

    @When("^User make a request to update new shipping rules based on the products$")
    public void User_make_a_request_to_updateshipping_rules_based_on_the_products() throws Exception
    {
        updateRuleObject.setDestinationCodes(null);
        jsonResponse= UpdateShippingRuleforSellerandVendorService.UpdateShippingRuleRequest(updateRuleObject,LoginSteps.token);
         updateRuleObject=null;
    }

    @When("^User make a request to update new shipping rules based on the destination with Incorrect/blank token field in form of without login credentials$")
    public void User_make_a_request_to_updateshipping_based_on_the_productswithIncorrectToken(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        updateRuleObject.setProductIds(null);
        jsonResponse= UpdateShippingRuleforSellerandVendorService.UpdateShippingRuleRequest(updateRuleObject,tokenMessageRequestModelList.get(0).gettoken());
        updateRuleObject=null;
    }


    @Then("^User should be able to update shipping rule$")
    public void userSuccessfullyUpdateShippingrule()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
    }

    @Then("^User should not be able to update shipping rule and user should get validation message$")
    public void userNotAbletoUpdateShippingrule(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

}

