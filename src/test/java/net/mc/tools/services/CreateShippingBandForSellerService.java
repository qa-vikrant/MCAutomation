package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.CreateShippingBandForSellerRequestModel;

import java.util.List;

public class CreateShippingBandForSellerService extends ApiHelper
{

    public static Response CreateShippingBandRequest(List<CreateShippingBandForSellerRequestModel> createShippingBandForSellerRequestModelList, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(createShippingBandForSellerRequestModelList.get(0))+" Token Message is : ( "+token+")");
        Response response;
        response = authWithToken(token).body(gson().toJson(createShippingBandForSellerRequestModelList.get(0))).post("user/shipping-band");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }


}
