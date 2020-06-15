package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.actionsOnbulkProduct.bulkProductRequest.BulkProductRequestModel;

public class BulkApproveProductsBySellerService extends ApiHelper
{
    public static Response BulkApproveProductsRequest(BulkProductRequestModel bulkProductRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(bulkProductRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = productWithToken(token).body(gson().toJson(bulkProductRequestModel)).put("product/bulk-approve");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        System.out.println("getContentType"+response.getContentType()+"getTime"+response.getTime());
        return response;
    }
}
