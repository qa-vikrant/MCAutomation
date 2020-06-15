package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.updateOneTimePasswordReset.updateOneTimePasswordResetRequest.UpdateOneTimePasswordResetRequestModel;

public class UpdateOneTimePasswordResetService extends ApiHelper
{
    public static Response UpdateOneTimePasswordResetRequest(UpdateOneTimePasswordResetRequestModel updateOneTimePasswordResetRequestMode)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateOneTimePasswordResetRequestMode));

        response = auth().body(gson().toJson(updateOneTimePasswordResetRequestMode)).put("/user/otp");

        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }
}
