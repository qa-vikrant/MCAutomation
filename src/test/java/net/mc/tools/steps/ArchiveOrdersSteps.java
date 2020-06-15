package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.models.orders.request.ArchiveOrderRequestModel;
import net.mc.tools.models.orders.response.ArchiveOrderResponseModel;
import net.mc.tools.services.ArchiveOrdersService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class ArchiveOrdersSteps {

    private Response response;
    private ArchiveOrderResponseModel archiveOrderResponseModel;

    @When("^User enters details of seller to proceed with archive$")
    public void userEnterIdOfSeller(List<ArchiveOrderRequestModel> archiveOrderRequestModels)
    {
        response = ArchiveOrdersService.requestWithToken(archiveOrderRequestModels,LoginSteps.token);
    }

    @Then("^User should be able to archive all order of given seller$")
    public void userShouldBeAbleToArchiveOrders()  {
        Assert.assertTrue(response.getStatusCode() == 200);
        archiveOrderResponseModel = gson().fromJson(response.body().prettyPrint(), ArchiveOrderResponseModel.class);
        Assert.assertEquals("true", archiveOrderResponseModel.getData());
        Assert.assertEquals("ok", archiveOrderResponseModel.getStatus());
    }
}
