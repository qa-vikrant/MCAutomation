package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.DeleteShippingRuleRequestModel;

public class DeleteShippingRuleService extends ApiHelper
{
    public static Response deleteShippingRuleRequest(DeleteShippingRuleRequestModel deleteShippingRuleRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(deleteShippingRuleRequestModel)+" Token Message is : ( "+token+")");
        response = authWithToken(token).body(gson().toJson(deleteShippingRuleRequestModel)).delete("user/shipping-rule");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }




}
