package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.loginSellerFromShopify.loginSellerFromShopifyRequest.LoginSellerFromShopifyRequestModel;

public class LoginSellerFromShopifyService extends ApiHelper
{
    public static Response LoginSellerFromShopifyRequest(LoginSellerFromShopifyRequestModel loginSellerFromShopifyRequestModel)
    {
        Response response;

        System.out.println(" Json Data Before Hitting API : "+gson().toJson(loginSellerFromShopifyRequestModel));

        response = auth().body(gson().toJson(loginSellerFromShopifyRequestModel)).post("user/shopify-login");

        return response;
    }
}
