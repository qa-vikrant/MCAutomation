package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.bulkActionLikeVerifyOrDeleteSuppliers.bulkActionLikeVerifyOrDeleteSuppliersRequest.BulkActionLikeVerifyOrDeleteSuppliersRequestModel;

public class BulkActionLikeVerifyOrDeleteSuppliersService extends ApiHelper
{
    public static Response BulkActionLikeVerifyOrDeleteSuppliersRequest(BulkActionLikeVerifyOrDeleteSuppliersRequestModel bulkActionLikeVerifyOrDeleteSuppliersRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(bulkActionLikeVerifyOrDeleteSuppliersRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response=authWithToken(token).body(gson().toJson(bulkActionLikeVerifyOrDeleteSuppliersRequestModel)).put("user/bulk-action");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;

    }
}
