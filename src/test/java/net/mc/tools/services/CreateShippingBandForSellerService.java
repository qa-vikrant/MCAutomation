package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.CreateShippingBandForSellerRequestModel;

import java.util.List;

public class CreateShippingBandForSellerService extends ApiHelper
{

    public static Response CreateShippingBandRequest(CreateShippingBandForSellerRequestModel createShippingBandForSellerRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(createShippingBandForSellerRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = authWithToken(token).body(gson().toJson(createShippingBandForSellerRequestModel)).post("user/shipping-band");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }


}
