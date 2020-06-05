package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.CreateShippingOfferRequestModel;
import net.mc.tools.models.shipping.request.OrderValue;
import net.mc.tools.models.shipping.request.ProductPrice;
import net.mc.tools.models.shipping.request.ProductQuantity;
import net.mc.tools.services.auth.CreateShippingOfferService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.ArrayList;
import java.util.List;

import static net.mc.tools.services.auth.RegisterService.gson;

public class CreateShippingOfferSteps
{
    private  Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private  CreateShippingOfferRequestModel createShippingOffer=new CreateShippingOfferRequestModel();
    private  ProductPrice productPrice;
    private OrderValue orderValue=new OrderValue();
    private ProductQuantity productQuantity=new ProductQuantity();
    private  String[] productIds=new String[1];
    private  String[] destinationCodes=new String[1];

    @When("^user enters details for create shipping offer for seller$")
    public void userEnterDetailsForCreateShippingOffer(List<CreateShippingOfferRequestModel> createShippingOfferRequestModelList)
    {
        this.createShippingOffer=createShippingOfferRequestModelList.get(0);
    }


    @When("^user make a request to create a shipping offer$")
    public void user_make_a_request_to_create_a_shipping_offer()
    {
        jsonResponse = CreateShippingOfferService.creteShippingOffer(createShippingOffer, LoginSteps.token);

    }

    @Then("^User should be able to create shipping offer$")
    public void userSuccessfullyCreateShippingOffer()
    {
        if (jsonResponse.getStatusCode()>=400)
        {
            List<String> errorMessage=new ArrayList<>();
            errorMessage.add("A shipping offer already exists with provided details");
            HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
            Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        }
        else
        {
            Assert.assertTrue(jsonResponse.getStatusCode() == 200);
            responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
            Assert.assertEquals("ok" , responseCommonForAll.getStatus());
            Assert.assertEquals("true", responseCommonForAll.getData());
        }

    }

    @Then("^User should not be able to create offer and user should gets validation error message$")
    public void userValidateErrorMsgForCreateShippingOffer(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


    @Then("^User enters product details for shipping offer$")
    public void user_enters_product_details_for_shipping_offer(List<String> productIdsStringList) throws Exception
    {
        if (productIdsStringList.get(0).equals(productIdsStringList.get(0)))
        {
            this.productIds[0]=productIdsStringList.get(0);
        }
        createShippingOffer.setProductIds(productIds);
    }

    @Then("^User enters destination details for shipping offer$")
    public void user_enters_destination_details_for_shipping_offer(List<String> destinationCodesStringList) throws Exception
    {
        if (destinationCodesStringList.get(0).equals("UK"))
        {
            this.destinationCodes[0]= RandomGenerator.randomAlphabetic(2);
        }
        createShippingOffer.setDestinationCodes(destinationCodes);
    }




    @Then("^User enters the shippingBandID details,Price details,shipping offer condition and description of shipping offer$")
    public void user_enters_the_shippingBandID_details_Price_details_shipping_offer_condition_and_description_of_shipping_offer(List<CreateShippingOfferRequestModel> createShippingOfferRequestModelList ) throws Exception
    {
        createShippingOffer.setShippingBandId(createShippingOfferRequestModelList.get(0).getShippingBandId());

        if(createShippingOfferRequestModelList.get(0).getDescription().length()!=0)
        {
            createShippingOffer.setDescription(createShippingOfferRequestModelList.get(0).getDescription()+HelperClass.getApiHitTime());  //add creation timing
        }
        else
        {
            createShippingOffer.setDescription(null);
        }

        createShippingOffer.setPrice(createShippingOfferRequestModelList.get(0).getPrice());
        createShippingOffer.setPriceType(createShippingOfferRequestModelList.get(0).getPriceType());
        createShippingOffer.setIsCumulative(createShippingOfferRequestModelList.get(0).getIsCumulative());
        createShippingOffer.setCondition(createShippingOfferRequestModelList.get(0).getCondition());

    }
    @Then("^User enters the condition criteria and condition value$")
    public void user_enters_destination_details_for_shipping_offer_criteria_And_Value(List<ProductPrice> productPriceList) throws Exception
    {

        if (createShippingOffer.getCondition().equals("productPrice"))
        {
            productPrice=productPriceList.get(0);
        }
        if (createShippingOffer.getCondition().equals("orderValue"))
        {

            orderValue.setCriteria(productPriceList.get(0).getCriteria());
            orderValue.setValue(productPriceList.get(0).getValue());

        }
        if (createShippingOffer.getCondition().equals("productQuantity"))
        {

            productQuantity.setValue(productPriceList.get(0).getValue());
            productQuantity.setCriteria(productPriceList.get(0).getCriteria());

        }

    }

    @Then("^user make a request to create a shipping offer based on products$")
    public void user_make_a_request_to_create_a_shipping_offer_based_on_products() throws Exception
    {
        createShippingOffer.setDestinationCodes(null);
        Request_Calling();

    }


    @Then("^user make a request to create a shipping offer based on destination$")
    public void user_make_a_request_to_create_a_shipping_offer_based_on_destination() throws Exception
    {
        createShippingOffer.setProductIds(null);
        Request_Calling();
    }

    @Then("^user make a request to create a shipping offer based on conditions$")
    public void user_make_a_request_to_create_a_shipping_offer_based_on_conditions() throws Exception
    {

    }


    public void Request_Calling()
    {
        if (createShippingOffer.getCondition().equals(""))
        {
            jsonResponse = CreateShippingOfferService.creteShippingOffer(createShippingOffer, LoginSteps.token);
            createShippingOffer=null;
        }
        else {
            if (createShippingOffer.getCondition().equals("productPrice"))
            {

                createShippingOffer.setProductPrice(productPrice);
                jsonResponse = CreateShippingOfferService.creteShippingOffer(createShippingOffer, LoginSteps.token);
                createShippingOffer = null;
            }
            else
            {
                if (createShippingOffer.getCondition().equals("productQuantity")) {
                    createShippingOffer.setProductQuantity(productQuantity);
                    jsonResponse = CreateShippingOfferService.creteShippingOffer(createShippingOffer, LoginSteps.token);
                    createShippingOffer = null;
                }
                else
                {
                    if (createShippingOffer.getCondition().equals("orderValue"))
                    {
                        createShippingOffer.setOrderValue(orderValue);
                        jsonResponse = CreateShippingOfferService.creteShippingOffer(createShippingOffer, LoginSteps.token);
                        createShippingOffer = null;
                    }

                }

            }
        }

    }
}