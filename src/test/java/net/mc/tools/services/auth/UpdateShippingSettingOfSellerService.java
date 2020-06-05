package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.shipping.request.UpdateShippingSettingRequestModel;

public class UpdateShippingSettingOfSellerService extends ApiHelper
{

    public static Response UpdateShippingSettingOfSellerRequest(UpdateShippingSettingRequestModel updateShippingSettingRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateShippingSettingRequestModel)+" Token Message is : ( "+token+")");
        response = authWithToken(token).body(gson().toJson(updateShippingSettingRequestModel)).put("user/shipping");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }

}
