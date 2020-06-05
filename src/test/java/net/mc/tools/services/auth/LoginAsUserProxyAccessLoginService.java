package net.mc.tools.services.auth;



import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.loginAsUserProxyAccessLogin.loginAsUserProxyAccessLoginRequest.LoginAsUserProxyAccessLoginRequestModel;

public class LoginAsUserProxyAccessLoginService extends ApiHelper
{
    public static Response ProxyLoginRequest(LoginAsUserProxyAccessLoginRequestModel loginAsUserProxyAccessLoginRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(loginAsUserProxyAccessLoginRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = authWithToken(token).body(gson().toJson(loginAsUserProxyAccessLoginRequestModel)).post("user/proxy");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());

        return response;
    }

}
