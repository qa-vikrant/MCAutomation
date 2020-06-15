package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.commission.request.CommissionRequestModel;

import java.util.List;

public class CommissionService extends ApiHelper
{

    public static Response requestWithToken(List<CommissionRequestModel> commissionRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(commissionRequestModel.get(0))+" Token Message is : ( "+token+")");
        response = authWithToken(token).body(gson().toJson(commissionRequestModel.get(0))).put("user/default-commission");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }



}
