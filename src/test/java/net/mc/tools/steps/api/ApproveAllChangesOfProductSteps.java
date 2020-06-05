package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.approveAllChangesOfProduct.approveAllChangesOfProductRequest.ApproveAllChangesOfProductRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.ApproveAllChangesOfProductService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class ApproveAllChangesOfProductSteps
{
    private Response jsonResponse;
    private ApproveAllChangesOfProductRequestModel approveAllChangesOfProductRequestModel;
    private ResponseCommonForAll responseCommonForAll;

    @Given("^user enter product details for approval$")
    public void user_enter_product_details_for_approval(List<ApproveAllChangesOfProductRequestModel> approveAllChangesOfProductRequestModelList) throws Exception
    {
        this.approveAllChangesOfProductRequestModel=approveAllChangesOfProductRequestModelList.get(0);
    }

    @When("^user make request to approve all changes of a product\\.$")
    public void user_make_request_to_approve_all_changes_of_a_product() throws Exception
    {
        jsonResponse= ApproveAllChangesOfProductService.ApproveAllChangesOfProductRequest(approveAllChangesOfProductRequestModel,LoginSteps.token);

    }


    @When("^User make a request to approve all changes of a product with Incorrect/blank token field in form of without login credentials$")
    public void user_make_request_to_approve_all_changes_of_a_product_with_Invalid_token(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        jsonResponse= ApproveAllChangesOfProductService.ApproveAllChangesOfProductRequest(approveAllChangesOfProductRequestModel,tokenMessageRequestModelList.get(0).gettoken());

    }



    @Then("^user should be able to approve all changes of a product\\.$")
    public void user_should_be_able_to_approve_all_changes_of_a_product() throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals(approveAllChangesOfProductRequestModel.getId(),responseCommonForAll.getData());
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
        responseCommonForAll=null;
        approveAllChangesOfProductRequestModel=null;
        jsonResponse=null;
    }


    @Then("^user should not be able to approve all changes of a product and user should get validation error message$")
    public void user_should_not_be_able_to_approve_all_changes_of_a_product(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
