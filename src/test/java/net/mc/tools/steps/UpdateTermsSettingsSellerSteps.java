package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.models.updateTermsSetting.request.PaymentTerms;
import net.mc.tools.models.updateTermsSetting.request.UpdateTermsSettingForSellerRequestModel;
import net.mc.tools.services.UpdateTermsSettingsSellerService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateTermsSettingsSellerSteps
{

    private Response jsonResponse;
    private UpdateTermsSettingForSellerRequestModel updateTermsSettingForSellerRequestModel;
    private ResponseCommonForAll responseCommonForAll;
    private PaymentTerms paymentTerms;


    @And("^User enters returns policy details$")
    public void UserEntersReturnsPolicyDetails(List<UpdateTermsSettingForSellerRequestModel> updateTermsSettingForSellerRequestModelList)
    {
        this.updateTermsSettingForSellerRequestModel=updateTermsSettingForSellerRequestModelList.get(0);
        if(updateTermsSettingForSellerRequestModelList.get(0).getReturnPeriod()!=null)
        {
            this.updateTermsSettingForSellerRequestModel.setReturnPeriod(HelperClass.RandomNumberGeneratorTwodigit());
        }
        else
        {
            this.updateTermsSettingForSellerRequestModel.setReturnPeriod(00);
        }
    }
    @And("^User enters Payment terms details$")
    public void userEnterPaymentTerms(List<PaymentTerms> paymentTermsList)
    {
        this.paymentTerms=paymentTermsList.get(0);
        if(paymentTermsList.get(0).getDays()!=null)
        {
            this.paymentTerms.setDays(HelperClass.RandomNumberGeneratorOnedigit());
        }
        else
        {
            this.paymentTerms.setDays(00);
        }
    }

    @When("^User make a request to update the terms settings$")
    public void UserMakeARequestToChangeTheTermsSettings()
    {
        updateTermsSettingForSellerRequestModel.setPaymentTerms(paymentTerms);
       jsonResponse=UpdateTermsSettingsSellerService.UpdateTermsSettingsSellerRequest(updateTermsSettingForSellerRequestModel,LoginSteps.token);
    }


    @When("^User make a request to update the terms settings with incorrect/blank token field in form of without login credentials$")
    public void UserMakeARequestToChangeTheTermsSettingsWithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        updateTermsSettingForSellerRequestModel.setPaymentTerms(paymentTerms);
        jsonResponse=UpdateTermsSettingsSellerService.UpdateTermsSettingsSellerRequest(updateTermsSettingForSellerRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^User should be able to update the terms settings$")
    public void userShouldBeAbleToChangeTerms()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok", responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());

    }

    @Then("^User should not be able to update the terms settings and user should get validation error message$")
    public void userShouldNotBeAbleToChangeTerms(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

}
