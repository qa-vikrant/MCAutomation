package net.mc.tools.services.auth;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.registerSelfSeller.registerSelfSellerRequest.RegisterSelfSellerRequestModel;


import java.util.List;

public class RegisterSelfSellerService extends ApiHelper
{

    public static Response createNewSeller(List<RegisterSelfSellerRequestModel> registerSelfSellerRequestModels) {
        Response createUserResponse;

        createUserResponse = auth().body(gson().toJson(registerSelfSellerRequestModels.get(0))).post("user/seller");

        return createUserResponse;
    }

}
