package net.mc.tools.services;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.CreateShippingRuleForSellerRequestModel;

import java.util.List;

public class CreateShippingRuleForSellerService extends ApiHelper
{
    public static Response CreateShippingRuleRequest(CreateShippingRuleForSellerRequestModel createShippingRuleForSellerRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(createShippingRuleForSellerRequestModel)+" Token Message is : ( "+token+")");
        response = authWithToken(token).body(gson().toJson(createShippingRuleForSellerRequestModel)).post("user/shipping-rule");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }
}
