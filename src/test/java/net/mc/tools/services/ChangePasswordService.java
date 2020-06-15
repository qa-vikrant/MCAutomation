package net.mc.tools.services;


import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.change_Password.request.ChangePasswordRequest;

public class ChangePasswordService extends ApiHelper
{

    public static Response Change_Password_Request_with_Token(ChangePasswordRequest changePasswordRequest, String token)
     {
         System.out.println("Json Data Before hitting api  is "+gson().toJson(changePasswordRequest)+" Token Message is : ( "+token+")");
         Response response;
         response=authWithToken(token).body(gson().toJson(changePasswordRequest)).put("user/password");
         System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
         return response;

      }

}
