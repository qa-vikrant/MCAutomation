package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.commission.request.CommissionRequestModel;

public class CommissionService extends ApiHelper
{

    public static Response commissionChangeRequest(CommissionRequestModel commissionRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(commissionRequestModel)+" Token Message is : ( "+token+")");
        response = authWithToken(token).body(gson().toJson(commissionRequestModel)).put("user/default-commission");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }



}
