package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.CreateShippingOfferRequestModel;

public class CreateShippingOfferService extends ApiHelper
{

    public static Response creteShippingOffer(CreateShippingOfferRequestModel createShippingOfferRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(createShippingOfferRequestModel)+" Token Message is : ( "+token+")");
        response = authWithToken(token).body(gson().toJson(createShippingOfferRequestModel)).post("user/shipping-offer");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }



}
