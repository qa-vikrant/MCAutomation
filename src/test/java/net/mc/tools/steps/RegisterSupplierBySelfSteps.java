package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.registerSupplierBySelf.registerSupplierBySelfRequest.RegisterSupplierBySelfRequestModel;
import net.mc.tools.models.registerSupplierBySelf.registerSupplierBySelfResponse.RegisterSupplierBySelfResponseModel;
import net.mc.tools.services.RegisterSupplierBySelfService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class RegisterSupplierBySelfSteps
{
    private Response jsonResponse;
    private RegisterSupplierBySelfRequestModel registerSupplierBySelfRequestModel;
    private RegisterSupplierBySelfResponseModel registerSupplierBySelfResponseModel;
    public static String emailID,token;

    @When("^User enters the emaliId and password field for registration$")
    public void new_user_enters_the_emaliId_and_password_field_for_registration(List<RegisterSupplierBySelfRequestModel> registerSupplierBySelfRequestModelList) throws Exception
    {
        this.registerSupplierBySelfRequestModel = registerSupplierBySelfRequestModelList.get(0);
        if (registerSupplierBySelfRequestModel.getEmail().equals("vikrant.singh+"))
        {
            registerSupplierBySelfRequestModel.setEmail(registerSupplierBySelfRequestModelList.get(0).getEmail()+RandomGenerator.randomInteger(6)+"@successive.tech");
        }

    }

    @When("^User make a request to get register into the system$")
    public void user_make_a_request_to_get_register_into_the_system() throws Exception
    {
        jsonResponse= RegisterSupplierBySelfService.RegisterSupplierBySelfRequest(registerSupplierBySelfRequestModel);
        emailID=registerSupplierBySelfRequestModel.getEmail();
    }

    @Then("^User should be able to registered successfully into the system$")
    public void userShouldBeRegisteredSuccessfullyIntoTheSystem()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        registerSupplierBySelfResponseModel= gson().fromJson(jsonResponse.body().prettyPrint(),RegisterSupplierBySelfResponseModel.class);
        Assert.assertEquals("ok", registerSupplierBySelfResponseModel.getStatus());
        Assert.assertTrue(registerSupplierBySelfResponseModel.getData().getToken()!= null);
        token=registerSupplierBySelfResponseModel.getData().getToken();
        jsonResponse=null;
        registerSupplierBySelfResponseModel=null;
        registerSupplierBySelfRequestModel=null;
    }



    @Then("^User should not be able to register on marketcube app and user should get validation error message$")
    public void the_user_will_not_be_able_to_register_on_marketcube_app_and_the_user_should_get_a_validation_message(List<String> errorMessage) throws Exception
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }


















}
