package net.mc.tools.services;

import com.google.gson.Gson;
import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.passwordReset.request.PasswordResetRequestModel;
import net.mc.tools.models.passwordReset.request.TokenGenerateRequestModel;

public class PasswordResetService extends ApiHelper
{

    public static Gson gson;

    public static Response GenerateTokenRequest(TokenGenerateRequestModel tokenGenerateRequestModel)
    {
        Response generateTokenResponse;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(tokenGenerateRequestModel));

        generateTokenResponse = auth().body(gson().toJson(tokenGenerateRequestModel)).put("user/password-token");

        System.out.println("Json Data After hitting api  is "+generateTokenResponse.body().prettyPrint());
        return generateTokenResponse;
    }

    public static Response PasswordResetRequest(PasswordResetRequestModel passwordResetRequestModel)
    {
        Response passwordResetResponse;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(passwordResetRequestModel));

        passwordResetResponse = auth().body(gson().toJson(passwordResetRequestModel)).put("user/reset-password");

        System.out.println("Json Data After hitting api  is "+passwordResetResponse.body().prettyPrint());
        return passwordResetResponse;
    }




}
