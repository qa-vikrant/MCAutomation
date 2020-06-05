package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.registerSupplier.request.Brand;
import net.mc.tools.models.registerSupplier.request.RegisterSupplierRequestModel;
import net.mc.tools.models.registerSupplier.response.RegisterSupplierResponseModel;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.RegisterSupplierService;
import net.mc.tools.utilities.RandomGenerator;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.auth.RegisterService.gson;

public class RegisterSupplierSteps
{
    private Response jsonResponse;
    private RegisterSupplierRequestModel registerSupplierRequestModel;
    private Brand brand=new Brand();
    private RegisterSupplierResponseModel registerSupplierResponseModel;
    private final Long vendorLastDigit=Long.parseLong(RandomGenerator.randomInteger(6));




    @When("^user enters details of new vendor")
    public void userEnterDetails(List<RegisterSupplierRequestModel> registerSupplierRequestModelList)
    {
        this.registerSupplierRequestModel=registerSupplierRequestModelList.get(0);

        if (registerSupplierRequestModel.getEmail().equals("vikrant.singh+"))
        {
            registerSupplierRequestModel.setEmail(registerSupplierRequestModel.getEmail()+vendorLastDigit+"@successive.tech");
        }

        if (registerSupplierRequestModel.getIsVendor().equals(false))
        {
            registerSupplierRequestModel.setIsVendor(null);
        }

        if (registerSupplierRequestModel.getBrandName().equals("Testing"))
        {
            registerSupplierRequestModel.setBrandName("vikrant"+vendorLastDigit);
            brand.setSlug(registerSupplierRequestModel.getBrandName());
        }
        else
        {
            brand.setSlug(registerSupplierRequestModel.getBrandName()+vendorLastDigit);
        }
    }

    @When("^user make a request to register supplier")
    public void user_make_a_request_to_register_supplier()
    {
        registerSupplierRequestModel.setBrand(brand);
        jsonResponse = RegisterSupplierService.registerSupplier(registerSupplierRequestModel, LoginSteps.token);

    }

    @When("^user make a request to register new supplier with incorrect/blank token field in form of without login credentials")
    public void user_make_a_request_to_register_supplier_with_Invalid_Token(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        registerSupplierRequestModel.setBrand(brand);
        jsonResponse = RegisterSupplierService.registerSupplier(registerSupplierRequestModel, tokenMessageRequestModelList.get(0).gettoken());

    }

    @Then("^new vendor should be registered successfully into the system$")
    public void userShouldBeRegister()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        registerSupplierResponseModel = gson().fromJson(jsonResponse.body().prettyPrint(), RegisterSupplierResponseModel.class);
        Assert.assertEquals("ok" , registerSupplierResponseModel.getStatus());
        Assert.assertTrue(registerSupplierResponseModel.getData().getOtp().equals(registerSupplierRequestModel.getPassword()));
    }


    @Then("^user should not be able to register new supplier and user should get validation error message$")
    public void userShouldNotBeRegister(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}