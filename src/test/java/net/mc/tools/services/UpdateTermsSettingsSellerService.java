package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.updateTermsSetting.request.UpdateTermsSettingForSellerRequestModel;

public class UpdateTermsSettingsSellerService extends ApiHelper
{

    public static Response UpdateTermsSettingsSellerRequest(UpdateTermsSettingForSellerRequestModel updateTermsSettingForSellerRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateTermsSettingForSellerRequestModel)+" Token Message is : ( "+token+")");

        response = authWithToken(token).body(gson().toJson(updateTermsSettingForSellerRequestModel)).put("/user/term");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());

        return response;
    }


}
