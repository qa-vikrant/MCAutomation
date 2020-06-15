package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.bulkInvite.request.BulkInviteByDataRequestModel;

public class BulkInviteByDataService extends ApiHelper
{



    public static Response bulkInviteByData(BulkInviteByDataRequestModel bulkInviteByDataRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(bulkInviteByDataRequestModel)+" Token Message is : ( "+token+")");
        response = bulkWithToken(token).body(gson().toJson(bulkInviteByDataRequestModel)).post("bulk/invite/vendor");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }



}
