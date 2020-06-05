package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.approveSelectedChangesOfProduct.approveSelectedChangesOfProductRequest.ApproveSelectedChangesOfProductRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.ApproveSelectedChangesOfProductService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class ApproveSelectedChangesOfProductSteps
{
    private Response jsonResponse;
    private ApproveSelectedChangesOfProductRequestModel approveSelectedChangesOfProductRequestModel;
    private ResponseCommonForAll responseCommonForAll;
    private String[] keys;

    @Then("^user enter the selected fields to approval$")
    public void user_enter_the_selected_fields_to_approval(List<String> keysList) throws Exception
    {
      keys=new String[keysList.size()];
      for(int i=0;i<keys.length;i++)
      {
       keys[i]=keysList.get(i);
      }
    }

    @Then("^user enter product id and seller id for selected changes of a product$")
    public void user_enter_product_id_and_seller_id_for_selected_changes_of_a_product(List<ApproveSelectedChangesOfProductRequestModel> approveSelectedChangesOfProductRequestModelList) throws Exception
    {
       this.approveSelectedChangesOfProductRequestModel=approveSelectedChangesOfProductRequestModelList.get(0);
    }

    @When("^user make request to selected changes of a product$")
    public void user_make_request_to_selected_changes_of_a_product() throws Exception
    {
        approveSelectedChangesOfProductRequestModel.setKeys(keys);
        jsonResponse= ApproveSelectedChangesOfProductService.ApproveSelectedChangesOfProductRequest(approveSelectedChangesOfProductRequestModel,LoginSteps.token);
    }


    @When("^user make a request to approve selected Changes of a product with Incorrect/blank token field in form of without login credentials$")
    public void user_make_request_to_selected_changes_of_a_product_with_invalid_token(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        approveSelectedChangesOfProductRequestModel.setKeys(keys);
        jsonResponse= ApproveSelectedChangesOfProductService.ApproveSelectedChangesOfProductRequest(approveSelectedChangesOfProductRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }



    @Then("^user should be able to selected changes of a product$")
    public void user_should_be_able_to_selected_changes_of_a_product() throws Exception
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals(approveSelectedChangesOfProductRequestModel.getId(),responseCommonForAll.getData());
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
        jsonResponse=null;
        responseCommonForAll=null;
        approveSelectedChangesOfProductRequestModel=null;
    }

    @Then("^user should not be able to selected changes of a product and user should get validation error message$")
    public void user_should_not_be_able_to_selected_changes_of_a_product(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

}
