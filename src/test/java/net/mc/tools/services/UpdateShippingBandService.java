package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.UpdateShippingBandRequestModel;

public class UpdateShippingBandService extends ApiHelper
{
   public static Response UpdateShippingBandRequest(UpdateShippingBandRequestModel updateShippingBandRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateShippingBandRequestModel)+" Token Message is : ( "+token+")");
        response = authWithToken(token).body(gson().toJson(updateShippingBandRequestModel)).put("user/shipping-band");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }

}
