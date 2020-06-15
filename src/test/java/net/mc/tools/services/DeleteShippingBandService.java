package net.mc.tools.services;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.DeleteShippingBandRequestModel;

public class DeleteShippingBandService extends ApiHelper {

    public static Gson gson;

    public static Response deleteShippingBandRequest(DeleteShippingBandRequestModel deleteShippingBandRequestModel, String token)
    {
        Response response;

        System.out.println(" Json Data Before Hitting API : "+gson().toJson(deleteShippingBandRequestModel)+" Token Message is : ("+token+")");
        response = authWithToken(token).body(gson().toJson(deleteShippingBandRequestModel)).delete("user/shipping-band");

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
