package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.registerSupplierBySelf.registerSupplierBySelfRequest.RegisterSupplierBySelfRequestModel;

public class RegisterSupplierBySelfService extends ApiHelper
{

    public static Response RegisterSupplierBySelfRequest(RegisterSupplierBySelfRequestModel registerSupplierBySelfRequestModel)
    {
        Response createUserResponse;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(registerSupplierBySelfRequestModel));

        createUserResponse = auth().body(gson().toJson(registerSupplierBySelfRequestModel)).post("user/register");

        System.out.println("Json Data After hitting api  is "+createUserResponse.body().prettyPrint());
        return createUserResponse;
     }



}
