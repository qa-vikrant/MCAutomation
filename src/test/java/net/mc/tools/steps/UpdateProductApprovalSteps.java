package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.models.updateProductApprovalSettings.request.UpdateProductApprovalRequestModel;
import net.mc.tools.services.UpdateProductApprovalService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class UpdateProductApprovalSteps
{

    private Response jsonResponse;
    private UpdateProductApprovalRequestModel updateProductApprovalRequestModel;
    private ResponseCommonForAll responseCommonForAll;

    @When("^User enters product Approval setting$")
    public void UserEntersProductApprovalSetting(List<UpdateProductApprovalRequestModel> updateProductApprovalRequestModelList)
    {
        this.updateProductApprovalRequestModel=updateProductApprovalRequestModelList.get(0);
        if (updateProductApprovalRequestModelList.get(0).getApproveAll()==null)
        {
            this.updateProductApprovalRequestModel.setApproveAll(null);
        }
        if (updateProductApprovalRequestModelList.get(0).getApproveSelected()==null)
        {
            this.updateProductApprovalRequestModel.setApproveSelected(null);
        }
        if (updateProductApprovalRequestModelList.get(0).getReviewAll()==null)
        {
            this.updateProductApprovalRequestModel.setReviewAll(null);
        }
    }

    @When("^User make a request to update product approval settings$")
    public void UserMakeRequestToUpdateProductApprovalSettings()
    {
        jsonResponse = UpdateProductApprovalService.UpdateProductApprovalRequest(updateProductApprovalRequestModel,LoginSteps.token);
    }

    @When("^User make a request to product approval settings with incorrect/blank token field in form of without login credentials$")
    public void UserMakeRequestToUpdateProductApprovalSettingsWithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse = UpdateProductApprovalService.UpdateProductApprovalRequest(updateProductApprovalRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^User should be able to update product approval settings$")
    public void UserShouldBeAbleToUpdateProductApprovalSettings()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
    }

    @Then("^User should not be able to update product approval settings and user should get validation error message$")
    public void UserShouldNotBeAbleToUpdateProductApprovalSettings(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


}
