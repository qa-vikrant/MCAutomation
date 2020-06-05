package net.mc.tools.services.auth;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.CreateShippingRuleForSellerRequestModel;

import java.util.List;

public class CreateShippingRuleForSellerService extends ApiHelper
{

    public static Gson gson;

    public static Response req(CreateShippingRuleForSellerRequestModel createShippingRuleForSellerRequestModel, String token)
    {
        Response response;
        System.out.println(gson().toJson(createShippingRuleForSellerRequestModel));
        response = authWithToken(token).body(gson().toJson(createShippingRuleForSellerRequestModel)).post("user/shipping-rule");

        return response;
    }

    //Specify all one time default Gson config
    public static Gson gson() {
        GsonBuilder gsonBuilder = new GsonBuilder();
        gson = gson(gsonBuilder);
        return gson;
    }

    //Custom Gson config to override Default Gson  configuration
    public static Gson gson(GsonBuilder gsonBuilder) {
        gson = gsonBuilder.create();
        return gson;
    }


}
