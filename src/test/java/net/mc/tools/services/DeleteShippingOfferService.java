package net.mc.tools.services;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.DeleteShippingOfferRequestModel;

public class DeleteShippingOfferService extends ApiHelper {

    public static Gson gson;

    public static Response shippingOfferDeleteReq(DeleteShippingOfferRequestModel deleteShippingOfferRequestModel, String token) {
        Response response;

        System.out.println(" Json Data Before Hitting API : "+gson().toJson(deleteShippingOfferRequestModel)+" Token Message is : ("+token+")");
        response = authWithToken(token).body(gson().toJson(deleteShippingOfferRequestModel)).delete("user/shipping-offer");

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
