package net.mc.tools.services;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.addProduct.request.AddProductRequestModel;
import net.mc.tools.models.updateMarkupOfProduct.request.UpdateMarkupRequestModel;

import java.util.List;

public class UpdateMarkupService extends ApiHelper
{

    public static Response UpdateMarkupRequest(UpdateMarkupRequestModel updateMarkupRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateMarkupRequestModel)+" Token Message is : ( "+token+")");

        response = authWithToken(token).body(gson().toJson(updateMarkupRequestModel)).put("user/markup");

        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }


}
