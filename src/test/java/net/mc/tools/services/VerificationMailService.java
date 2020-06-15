package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.verificationMail.verificationMailRequest.ResendVerificationMailRequestModel;
import net.mc.tools.models.verificationMail.verificationMailRequest.VerifyEmailRequestModel;

public class VerificationMailService extends ApiHelper
{
    public static Response verifyEmailRequest(VerifyEmailRequestModel verifyEmailRequestModels)
    {
        Response verifyEmailResponse;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(verifyEmailRequestModels));

        verifyEmailResponse = auth().body(gson().toJson(verifyEmailRequestModels)).put("user/verify-email");

        System.out.println("Json Data After hitting api  is "+verifyEmailResponse.body().prettyPrint());
        return verifyEmailResponse;
    }

    public static Response resendVerificationEmailRequest(ResendVerificationMailRequestModel verifyEmailRequestModels)
    {
        Response resendVerificationEmailResponse;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(verifyEmailRequestModels));

        resendVerificationEmailResponse = auth().body(gson().toJson(verifyEmailRequestModels)).put("user/resend-email");

        System.out.println("Json Data After hitting api  is "+resendVerificationEmailResponse.body().prettyPrint());
        return resendVerificationEmailResponse;
    }
}
