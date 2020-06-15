package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.login.request.LoginRequestModel;
import net.mc.tools.models.orders.request.CreateFulfillmentRequestModel;

import java.util.List;

public class CreateFulfillmentService extends ApiHelper
{
    public static Response requestWithToken(List<CreateFulfillmentRequestModel> createFulfillmentRequestModels, String token)
    {
        Response response;

        response = orderWithToken(token).body(gson().toJson(createFulfillmentRequestModels.get(0))).post("order/webhook/vendor/fulfill");

        return response;
    }

    public static Response requestForLoginToken(List<LoginRequestModel> loginRequestModels) {
        Response response;

        response = auth().body(gson().toJson(loginRequestModels.get(0))).post("user/login");

        return response;
    }


}
