package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.addPaypalDetails.request.AddPaypalDetailsRequestModel;

public class AddPaypalDetailsService extends ApiHelper
{

    public static Response AddPaypalDetailsRequest(AddPaypalDetailsRequestModel addPaypalDetailsRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(addPaypalDetailsRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = authWithToken(token).body(gson().toJson(addPaypalDetailsRequestModel)).post("user/paypal");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }


}
