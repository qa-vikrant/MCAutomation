package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.orders.request.UpdateOrderRequestModel;

public class UpdateOrderService extends ApiHelper
{

    public static Response UpdateOrderRequest(UpdateOrderRequestModel updateOrderRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateOrderRequestModel)+" Token Message is : ( "+token+")");

        response = orderWithToken(token).body(gson().toJson(updateOrderRequestModel)).put("order");

        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());

        return response;
    }


}
