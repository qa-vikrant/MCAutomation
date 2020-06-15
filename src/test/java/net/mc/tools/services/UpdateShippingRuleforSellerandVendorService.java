package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.UpdateShippingRuleforSellerandVendorRequestModel;

public class UpdateShippingRuleforSellerandVendorService extends ApiHelper
{

    public static Response UpdateShippingRuleRequest(UpdateShippingRuleforSellerandVendorRequestModel updateShippingRuleforSellerandVendorRequestModelList, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateShippingRuleforSellerandVendorRequestModelList)+" Token Message is : ( "+token+")");
        Response response;
        response = authWithToken(token).body(gson().toJson(updateShippingRuleforSellerandVendorRequestModelList)).put("user/shipping-rule");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;

    }


}
