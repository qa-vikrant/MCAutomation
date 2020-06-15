package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.updateprofileofSupplier.request.UpdateprofileofSupplierRequestModel;

public class UpdateprofileofSupplierService extends ApiHelper
{

    public static Response UpdateprofileRequest(UpdateprofileofSupplierRequestModel updateprofileofSupplierRequestModel, String token)
    {
        Response jsonResponse;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateprofileofSupplierRequestModel)+" Token Message is : ( "+token+")");
        jsonResponse = authWithToken(token).body(gson().toJson(updateprofileofSupplierRequestModel)).put("user/profile");
        System.out.println("Json Data After hitting api  is "+jsonResponse.body().prettyPrint());
        return jsonResponse;
    }


}
