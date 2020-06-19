package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.models.updateMarkupOfProduct.request.AdvancedValues;
import net.mc.tools.models.updateMarkupOfProduct.request.UpdateMarkupRequestModel;
import net.mc.tools.services.UpdateMarkupService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateMarkupSteps
{

    private Response jsonResponse;
    private UpdateMarkupRequestModel updateMarkupRequestModel;
    private ResponseCommonForAll responseCommonForAll;
    private AdvancedValues[] advancedValues;


    @And("^User enters Normal markup details$")
    public void userEntersNormalMarkupDetails(List<UpdateMarkupRequestModel> updateMarkupRequestModelList)
    {
        this.updateMarkupRequestModel=updateMarkupRequestModelList.get(0);
        if(this.updateMarkupRequestModel.getPrice().length()>0)
        {
            this.updateMarkupRequestModel.setPrice(RandomGenerator.randomInteger(2));
        }
        else
        {
            this.updateMarkupRequestModel.setPrice("");
        }

    }

    @And("^User click Advanced markup settings details option$")
    public void UserClickAdvancedMarkupSettingsDetailsOption(List<UpdateMarkupRequestModel> updateMarkupRequestModelList)
    {
        this.updateMarkupRequestModel.setRuleBy(updateMarkupRequestModelList.get(0).getRuleBy());
    }

    @And("^User enters Advanced markup details$")
    public void userEntersAdvancedMarkupSettingsDetails(List<AdvancedValues> advancedValuesList)
    {
        advancedValues=new AdvancedValues[1];
        advancedValues[0]=advancedValuesList.get(0);
        this.updateMarkupRequestModel.setAdvancedValues(advancedValues);
    }


    @And("^User enters Advanced markup type$")
    public void userEntersAdvancedMarkupType(List<String> typeStringList)
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

    @And("^User enters Advanced markup category$")
    public void userEntersAdvancedMarkupCategory(List<String> categoryStringList)
    {
        if(categoryStringList.size()>0)
        {
            for (int i=0;i<3;i++)
            {
                advancedValues[i].setCategory(categoryStringList.get(i));
            }
        }

    }

    @And("^User enters Advanced markup value$")
    public void userEntersAdvancedMarkupValue(List<String> valueStringList)
    {
        if(valueStringList.size()>0)
        {
            for (int i=0;i<3;i++)
            {
                advancedValues[i].setValue(valueStringList.get(i));
            }
        }

    }

    @And("^User enters Advanced markup price$")
    public void userEntersAdvancedMarkupPrice(List<String> priceStringList)
    {
        if(priceStringList.size()>0)
        {
            for (int i=0;i<3;i++)
            {
                advancedValues[i].setPrice(RandomGenerator.randomInteger(2));
            }
        }
        this.updateMarkupRequestModel.setAdvancedValues(advancedValues);
    }


    @And("^User make a request to Update markup settings for user$")
    public void userMakeARequestToUpdateMarkupSettingsForUser()
    {
        jsonResponse=UpdateMarkupService.UpdateMarkupRequest(updateMarkupRequestModel,LoginSteps.token);
    }

    @And("^User make a request to Update markup settings with incorrect/blank token field in form of without login credentials$")
    public void userMakeARequestToUpdateMarkupSettingsForUserWithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse= UpdateMarkupService.UpdateMarkupRequest(updateMarkupRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }


    @Then("^User should be able to update markup settings for user$")
    public void userShouldBeAbleToUpdateMarkupSettingsForUser()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("true", responseCommonForAll.getData());
        Assert.assertEquals("ok", responseCommonForAll.getStatus());
        jsonResponse=null;
        responseCommonForAll=null;
        updateMarkupRequestModel=null;
        advancedValues=null;
    }



    @Then("^User should not be able to update markup settings for user and user should get validation error message$")
    public void userShouldNotBeAbleToUpdateMarkupSettingsForUser(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

}
