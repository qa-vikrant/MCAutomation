package net.mc.tools.services.auth;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.registerSupplier.request.RegisterSupplierRequestModel;


public class RegisterSupplierService extends ApiHelper
{
 public static Gson gson;

    public static Response registerSupplier(RegisterSupplierRequestModel registerSupplierRequestModel, String token) {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(registerSupplierRequestModel)+" Token Message is : ( "+token+")");
        response = authWithToken(token).body(gson().toJson(registerSupplierRequestModel)).post("user/register-supplier");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }



}
