package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.ManageShippingDetailsRequestModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.ManageShippingDetailsService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class ManageShippingDetailsSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    ManageShippingDetailsRequestModel manageShippingDetailsRequestModel=new ManageShippingDetailsRequestModel();
    String[] vendorIds;

    @When("^User enters shipping details$")
    public void userEnterManageShippingDetails(List<ManageShippingDetailsRequestModel> manageShippingDetailsRequestModelList)
    {
        this.manageShippingDetailsRequestModel=manageShippingDetailsRequestModelList.get(0);
    }

    @When("^User enters vendor manage vendorIds$")
    public void userEnterVendorID(List<String> vendorIdList)
    {
        if(manageShippingDetailsRequestModel.getTerm().equals("vendorManage") && manageShippingDetailsRequestModel.getAllowVendor().equals("selected"))
        {
            vendorIds=new String[vendorIdList.size()];
            for(int i=0;i<vendorIds.length;i++)
            {
             vendorIds[i]=vendorIdList.get(i);
            }
            manageShippingDetailsRequestModel.setVendorIds(vendorIds);
            vendorIds=null;
        }
    }

    @When("^User make a request to update shipping details$")
    public void userEnterManageShippingDetailsRequest()
    {
        jsonResponse = ManageShippingDetailsService.ManageShippingDetailsRequest(manageShippingDetailsRequestModel,LoginSteps.token);
    }

    @When("^User make request to update shipping details with Incorrect/blank token field in form of without login credentials$")
    public void userEnterManageShippingDetailsRequestwithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = ManageShippingDetailsService.ManageShippingDetailsRequest(manageShippingDetailsRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^User should be able to update shipping details successfully$")
    public void userSuccessfullyManageShippingDetails()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
        jsonResponse=null;
        responseCommonForAll=null;
        manageShippingDetailsRequestModel=null;
    }


    @Then("^User should not be able to manage shipping details and user should get validation error message$")
    public void userValidateErrorMsgForCreateShippingRule(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


}