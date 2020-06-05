package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.models.updateOrderLineAcceptOrReject.updateOrderLineAcceptOrRejectRequest.UpdateOrderLineAcceptOrRejectRequest;
import net.mc.tools.models.updateOrderLineAcceptOrReject.updateOrderLineAcceptOrRejectResponse.UpdateOrderLineAcceptOrRejectResponse;
import net.mc.tools.services.auth.UpdateOrderLineAcceptOrRejectService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.auth.UpdateOrderLineAcceptOrRejectService.gson;

public class UpdateOrderLineAcceptOrRejectSteps
{
    private static Response jsonResponse;
    private static UpdateOrderLineAcceptOrRejectResponse updateOrderLineAcceptOrRejectResponse;
    private static List<UpdateOrderLineAcceptOrRejectRequest> updateOrderLineAcceptOrRejectRequestList;

    @When("^User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a accept$")
    public void user_enters_order_lineitem_id_order_id_and_isAccept_details_of_new_order_and_user_request_to_update_order_line_as_a_accept(List<UpdateOrderLineAcceptOrRejectRequest> updateOrderLineAcceptOrRejectRequestList) throws Exception
    {
     jsonResponse= UpdateOrderLineAcceptOrRejectService.updateOrderLineAcceptOrRejectRequest(updateOrderLineAcceptOrRejectRequestList,LoginSteps.token);
    }

    @When("^User enters order details of new order and user request to update order line as a accept$")
    public void User_enters_order_details_of_new_order_and_user_request_to_update_order_line_as_a_accept(List<UpdateOrderLineAcceptOrRejectRequest> updateOrderLineAcceptOrRejectRequestList) throws Exception
    {
        this.updateOrderLineAcceptOrRejectRequestList=updateOrderLineAcceptOrRejectRequestList;
    }

    @When("^user make a request to update order line item as a accept or reject with Incorrect/blank token field in form of without login credentials$")
    public void user_make_a_request_to_update_order_line_item_as_a_accept_or_reject_with_Incorrectblank_token_field_in_form_ofwithout_login_credentials(List<TokenMessageRequestModel> tokenMessageRequestModelList) throws Exception
    {
        jsonResponse= UpdateOrderLineAcceptOrRejectService.updateOrderLineAcceptOrRejectRequest(updateOrderLineAcceptOrRejectRequestList,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^user should be able update order line as a accept$")
    public void user_should_be_able_update_order_line_as_a_accept() throws Exception
    {
     Assert.assertTrue(jsonResponse.statusCode()==200);
         updateOrderLineAcceptOrRejectResponse=gson().fromJson(jsonResponse.body().prettyPrint(),UpdateOrderLineAcceptOrRejectResponse.class);
         Assert.assertEquals("accepted",updateOrderLineAcceptOrRejectResponse.getData());
         Assert.assertEquals("ok",updateOrderLineAcceptOrRejectResponse.getStatus());
         jsonResponse=null;
    }


    @When("^User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a reject$")
    public void user_enters_order_lineitem_id_order_id_and_isAccept_details_of_new_order_and_user_request_to_update_order_line_as_a_reject(List<UpdateOrderLineAcceptOrRejectRequest> updateOrderLineAcceptOrRejectRequestList) throws Exception
    {
        jsonResponse= UpdateOrderLineAcceptOrRejectService.updateOrderLineAcceptOrRejectRequest(updateOrderLineAcceptOrRejectRequestList,LoginSteps.token);
    }

    @Then("^user should be able update order line as a reject$")
    public void user_should_be_able_update_order_line_as_a_reject() throws Exception
    {
            Assert.assertTrue(jsonResponse.statusCode()==200);
            updateOrderLineAcceptOrRejectResponse=gson().fromJson(jsonResponse.body().prettyPrint(),UpdateOrderLineAcceptOrRejectResponse.class);
            Assert.assertEquals("rejected",updateOrderLineAcceptOrRejectResponse.getData());
            Assert.assertEquals("ok",updateOrderLineAcceptOrRejectResponse.getStatus());
            jsonResponse=null;
    }


    @Then("^user should be able update order line as a reject with blank isAccept field$")
    public void user_should_be_able_update_order_line_as_a_reject_with_blank_isAccept_field() throws Exception
    {
            Assert.assertTrue(jsonResponse.statusCode()==200);
            updateOrderLineAcceptOrRejectResponse=gson().fromJson(jsonResponse.body().prettyPrint(),UpdateOrderLineAcceptOrRejectResponse.class);
            Assert.assertEquals("partial",updateOrderLineAcceptOrRejectResponse.getData());
            Assert.assertEquals("ok",updateOrderLineAcceptOrRejectResponse.getStatus());
            jsonResponse=null;
    }


    @Then("^user should not be able to update order line as a reject and user should get a validation message$")
    public void user_should_not_be_able_to_update_order_line_as_a_reject_and_user_should_get_a_validation_message(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
