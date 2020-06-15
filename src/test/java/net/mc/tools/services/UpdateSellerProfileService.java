package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.updateSellerProfile.updateSellerProfileRequest.UpdateSellerProfileRequestModel;

public class UpdateSellerProfileService extends ApiHelper
{
    public static Response UpdateSellerProfileRequest(UpdateSellerProfileRequestModel updateSellerProfileRequestModel,String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateSellerProfileRequestModel)+" Token Message is : ( "+token+")");
        response=authWithToken(token).body(gson().toJson(updateSellerProfileRequestModel)).put("user/profile");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        System.out.println("getContentType"+response.getContentType()+"getTime"+response.getTime());
        return response;
    }
}
