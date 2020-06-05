package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.login.request.LoginRequestModel;

public class LoginService extends ApiHelper
{


    public static Response loginRequest(LoginRequestModel loginRequest)
    {
        Response loginUserResponse;
        System.out.println("json is"+gson().toJson(loginRequest));
        loginUserResponse = auth().body(gson().toJson(loginRequest)).post("user/login");
        return loginUserResponse;
    }



}
