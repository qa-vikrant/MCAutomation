package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.ManageShippingDetailsRequestModel;

public class ManageShippingDetailsService extends ApiHelper
{

    public static Response ManageShippingDetailsRequest(ManageShippingDetailsRequestModel manageShippingDetailsRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(manageShippingDetailsRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = authWithToken(token).body(gson().toJson(manageShippingDetailsRequestModel)).put("user/shipping");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }



}
