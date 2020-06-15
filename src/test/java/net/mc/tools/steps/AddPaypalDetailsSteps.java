package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.addPaypalDetails.request.AddPaypalDetailsRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.services.AddPaypalDetailsService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class AddPaypalDetailsSteps
{

    private Response jsonResponse;
    private AddPaypalDetailsRequestModel addPaypalDetailsRequestModel;
    private ResponseCommonForAll responseCommonForAll;



    @When("^user enters paypal details for seller or vendor$")
    public void userAddPaypalDetails(List<AddPaypalDetailsRequestModel> addPaypalDetailsRequestModelList)
    {
        this.addPaypalDetailsRequestModel=addPaypalDetailsRequestModelList.get(0);
        jsonResponse = AddPaypalDetailsService.AddPaypalDetailsRequest(addPaypalDetailsRequestModel,LoginSteps.token);
    }

    @Then("^user should be able to add paypal details for any seller or vendor$")
    public void paypalDetailsShouldBeAdd()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());

    }


    @Then("^user should not be able to add paypal details for any seller or vendor$")
    public void paypalDetailsShouldNotBeAdd(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
