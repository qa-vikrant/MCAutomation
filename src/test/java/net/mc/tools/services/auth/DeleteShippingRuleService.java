package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.DeleteShippingRuleRequestModel;

public class DeleteShippingRuleService extends ApiHelper
{



    public static Response deleteShippingRuleReq(DeleteShippingRuleRequestModel deleteShippingRuleRequestModel, String token)
    {
        Response response;

        System.out.println(" Json Data Before Hitting API : "+gson().toJson(deleteShippingRuleRequestModel)+" Token Message is : ("+token+")");

        response = authWithToken(token).body(gson().toJson(deleteShippingRuleRequestModel)).delete("user/shipping-rule");

        return response;
    }




}
