package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.orders.request.BulkActionsRequestModel;

import java.util.List;

public class BulkActionsService extends ApiHelper
{

    public static Response requestWithToken(List<BulkActionsRequestModel> bulkActionsRequestModelList, String token) {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(bulkActionsRequestModelList.get(0))+" Token Message is : ( "+token+")");
        response = orderWithToken(token).body(gson().toJson(bulkActionsRequestModelList.get(0))).put("order/bulk-action");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }


}
