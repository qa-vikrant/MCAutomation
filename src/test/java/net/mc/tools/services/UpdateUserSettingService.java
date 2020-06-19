package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.updateUserSetting.updateUserSettingRequest.UpdateUserSettingRequestModel;

public class UpdateUserSettingService extends ApiHelper
{



    public static Response UpdateUserSettingRequest(UpdateUserSettingRequestModel updateUserSettingRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateUserSettingRequestModel)+" Token Message is : ( "+token+")");

        response = authWithToken(token).body(gson().toJson(updateUserSettingRequestModel)).put("user/setting");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }




}
