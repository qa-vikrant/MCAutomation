package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.mc.tools.models.approveSellerChangesOfProduct.approveSellerChangesOfProductRequest.ApproveSellerChangesOfProductRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.services.auth.ApproveSellerChangesOfProductService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class ApproveSellerChangesOfProductSteps
{

    private Response jsonResponse;
    private ApproveSellerChangesOfProductRequestModel approveSellerChangesOfProductRequestModel;
    private ResponseCommonForAll responseCommonForAll;

    @And("^user enters the productId and selelrId for approve seller changes of a product$")
    public void userEntersTheProductIdAndSelelrIdForApproveSellerChangesOfAProduct(List<ApproveSellerChangesOfProductRequestModel> approveSellerChangesOfProductRequestModelList)
    {
        this.approveSellerChangesOfProductRequestModel=approveSellerChangesOfProductRequestModelList.get(0);

    }

    @And("^user make a request to approve seller changes of a product$")
    public void userMakeARequestToApproveSellerChangesOfAProduct()
    {
        jsonResponse= ApproveSellerChangesOfProductService.ApproveSellerChangesOfProductRequest(approveSellerChangesOfProductRequestModel,LoginSteps.token);
    }

    @Then("^user should be able to approve seller changes of a product$")
    public void userShouldBeAbleToApproveSellerChangesOfAProduct()
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
        Assert.assertTrue(responseCommonForAll.getData().equals(approveSellerChangesOfProductRequestModel.getId()));
        approveSellerChangesOfProductRequestModel=null;
        jsonResponse=null;
        responseCommonForAll=null;
    }


}
