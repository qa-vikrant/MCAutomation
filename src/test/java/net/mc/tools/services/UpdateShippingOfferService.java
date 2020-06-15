package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.UpdateShippingOfferRequestModel;

public class UpdateShippingOfferService extends ApiHelper
{

    public static Response UpdateShippingOfferRequest(UpdateShippingOfferRequestModel updateShippingOfferRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateShippingOfferRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = authWithToken(token).body(gson().toJson(updateShippingOfferRequestModel)).put("user/shipping-offer");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }




}
