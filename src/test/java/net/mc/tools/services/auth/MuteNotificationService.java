package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.muteNotification.request.MuteNotificationRequestModel;
import net.mc.tools.models.muteNotification.request.MuteNotificationRequestModel2;

public class MuteNotificationService extends ApiHelper
{
    public static Response muteNotificationRequest(MuteNotificationRequestModel muteNotificationRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(muteNotificationRequestModel)+" Token Message is : ( "+token+")");
        response = emailWithToken(token).body(gson().toJson(muteNotificationRequestModel)).post("email/mute-notification");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }

    public static Response muteNotificationRequest2(MuteNotificationRequestModel2 muteNotificationRequestModel2, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(muteNotificationRequestModel2)+" Token Message is : ( "+token+")");
        response = emailWithToken(token).body(gson().toJson(muteNotificationRequestModel2)).post("email/mute-notification");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }
}
