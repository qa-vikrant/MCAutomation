package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.orders.request.CountListOfOrdersRequestModel;

import java.util.List;

public class CountListOfOrdersService extends ApiHelper
{

    public static Response requestWithToken(List<CountListOfOrdersRequestModel> countListOfOrdersRequestModels, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(countListOfOrdersRequestModels.get(0))+" Token Message is : ( "+token+")");
        Response response;
        response = orderWithToken(token).body(gson().toJson(countListOfOrdersRequestModels.get(0))).get("order/count");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }



}
