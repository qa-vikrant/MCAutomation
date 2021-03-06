package net.mc.tools.services;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.removeUserToken.request.RemoveUserTokenStepsRequestModel;

import java.util.List;

public class RemoveUserTokenService extends ApiHelper
{
    public static Gson gson;

    public static Response removeUserToken(List<RemoveUserTokenStepsRequestModel> loginRequest, String Token) {
        Response loginUserResponse;

        loginUserResponse = authWithToken(Token).body(gson().toJson(loginRequest.get(0))).delete("user/logout");

        return loginUserResponse;
    }

    //Specify all one time default Gson config
    public static Gson gson() {
        GsonBuilder gsonBuilder = new GsonBuilder();
        gson = gson(gsonBuilder);
        return gson;
    }

    //Custom Gson config to override Default Gson  configuration
    public static Gson gson(GsonBuilder gsonBuilder) {
        gson = gsonBuilder.create();
        return gson;
    }
}
