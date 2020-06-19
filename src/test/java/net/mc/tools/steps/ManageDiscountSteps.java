package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.manageDiscount.request.AdvancedValues;
import net.mc.tools.models.manageDiscount.request.ManageDiscountRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.ManageDiscountService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class ManageDiscountSteps
{

    private Response jsonResponse;
    private ManageDiscountRequestModel manageDiscountRequestModel;
    private ResponseCommonForAll responseCommonForAll;
    private AdvancedValues[] advancedValues;



    @And("^User enters Normal discount details$")
    public void userEntersNormalDiscountDetails(List<ManageDiscountRequestModel> manageDiscountRequestModelList)
    {
        this.manageDiscountRequestModel=manageDiscountRequestModelList.get(0);
        if(manageDiscountRequestModelList.get(0).getPrice().length()>0)
        {
            this.manageDiscountRequestModel.setPrice(RandomGenerator.randomInteger(2));
        }
        else
        {
            this.manageDiscountRequestModel.setPrice("");
        }
    }

    @And("^User click Advanced discount settings details option$")
    public void UserClickAdvancedDiscountSettingsDetailsOption(List<ManageDiscountRequestModel> manageDiscountRequestModelList)
    {
        this.manageDiscountRequestModel.setRuleBy(manageDiscountRequestModelList.get(0).getRuleBy());
    }

    @And("^User enters Advanced discount details$")
    public void userEntersAdvancedDiscountSettingsDetails(List<AdvancedValues> advancedValuesList)
    {
        advancedValues=new AdvancedValues[1];
        advancedValues[0]=advancedValuesList.get(0);
        this.manageDiscountRequestModel.setAdvancedValues(advancedValues);
    }


    @And("^User enters Advanced discount type$")
    public void userEntersAdvancedDiscountType(List<String> typeStringList)
    {
        advancedValues=new AdvancedValues[3];
        for (int i=0;i<3;i++)
        {
            advancedValues[i]=new AdvancedValues();
            if(typeStringList.size()>0)
            {
                advancedValues[i].setType(typeStringList.get(i));
            }

        }
    }

    @And("^User enters Advanced discount category$")
    public void userEntersAdvancedDiscountCategory(List<String> categoryStringList)
    {
        if(categoryStringList.size()>0)
        {
            for (int i=0;i<3;i++)
            {
                advancedValues[i].setCategory(categoryStringList.get(i));
            }
        }

    }

    @And("^User enters Advanced discount value$")
    public void userEntersAdvancedDiscountValue(List<String> valueStringList)
    {
        if(valueStringList.size()>0)
        {
            for (int i=0;i<3;i++)
            {
                advancedValues[i].setValue(valueStringList.get(i));
            }
        }

    }

    @And("^User enters Advanced discount price$")
    public void userEntersAdvancedDiscountPrice(List<String> priceStringList)
    {
        if(priceStringList.size()>0)
        {
            for (int i=0;i<3;i++)
            {
                advancedValues[i].setPrice(RandomGenerator.randomInteger(2));
            }
        }

        this.manageDiscountRequestModel.setAdvancedValues(advancedValues);
    }


    @And("^User make a request to Update discount settings for user$")
    public void userMakeARequestToUpdateDiscountSettingsForUser()
    {
        jsonResponse=ManageDiscountService.ManageDiscountRequest(manageDiscountRequestModel,LoginSteps.token);
    }


    @And("^User make a request to Update discount settings with incorrect/blank token field in form of without login credentials$")
    public void userMakeARequestToUpdateDiscountSettingsForUserWithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse=ManageDiscountService.ManageDiscountRequest(manageDiscountRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^User should be able to update discount settings for user$")
    public void userShouldBeAbleToUpdateDiscountSettingsForUser()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("true", responseCommonForAll.getData());
        Assert.assertEquals("ok", responseCommonForAll.getStatus());
        jsonResponse=null;
        responseCommonForAll=null;
        manageDiscountRequestModel=null;
        advancedValues=null;
    }



    @Then("^User should not be able to update discount settings for user and user should get validation error message$")
    public void userShouldNotBeAbleToUpdateDiscountSettingsForUser(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }




}
