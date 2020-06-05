package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.resendOtpEmail.resendOtpEmailRequest.ResendOtpEmailRequestModel;

public class ResendOtpEmailService extends ApiHelper
{
    public static Response ResendOtpEmailRequest(ResendOtpEmailRequestModel resendOtpEmailRequestModel,String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(resendOtpEmailRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response=authWithToken(token).body(gson().toJson(resendOtpEmailRequestModel)).put("user/resend-otp");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        System.out.println("getContentType"+response.getContentType()+"getTime"+response.getTime());
        return response;
    }
}
