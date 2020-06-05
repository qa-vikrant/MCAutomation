package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.shipping.request.UpdateShippingSettingRequestModel;
import net.mc.tools.services.auth.UpdateShippingSettingOfSellerService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.auth.RegisterService.gson;

public class UpdateShippingSettingOfSellerSteps
{
    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private UpdateShippingSettingRequestModel updateShippingSettingRequestModel=new UpdateShippingSettingRequestModel();
    private String[] vendorShipping=new String[1];

    @When("^User enters shipping setting details to update$")
    public void userEnterUpdateShippingSetting(List<UpdateShippingSettingRequestModel> updateShippingSettingRequestModelList)
    {
     this.updateShippingSettingRequestModel=updateShippingSettingRequestModelList.get(0);
    }

    @When("^User Make a request to update shipping setting for seller$")
    public void userEnterUpdateShippingSettingRequest()
    {
        jsonResponse = UpdateShippingSettingOfSellerService.UpdateShippingSettingOfSellerRequest(updateShippingSettingRequestModel,LoginSteps.token);
    }

    @Then("^User should be able to update shipping setting for seller$")
    public void userSuccessfullyUpdateShippingSetting()  {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
    }

    @Then("^User should not be able to update shipping setting for seller and validate error message$")
    public void userValidateErrorMsgUpdateSetting(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}