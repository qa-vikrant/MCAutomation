package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.bulkActionLikeDeleteSellers.bulkActionLikeDeleteSellersRequest.BulkActionLikeDeleteSellersRequestModel;

public class BulkActionLikeDeleteSellersService extends ApiHelper
{
    public static Response BulkActionLikeDeleteSellersRequest(BulkActionLikeDeleteSellersRequestModel bulkActionLikeDeleteSellersRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(bulkActionLikeDeleteSellersRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = authWithToken(token).body(gson().toJson(bulkActionLikeDeleteSellersRequestModel)).put("/user/bulk-action-seller");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        System.out.println("getContentType"+response.getContentType()+"getTime"+response.getTime());
        return response;
    }
}
