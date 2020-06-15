package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.actionsOnbulkProduct.bulkProductRequest.BulkProductRequestModel;
import net.mc.tools.models.approveAllChangesOfProduct.approveAllChangesOfProductRequest.ApproveAllChangesOfProductRequestModel;

public class ApproveAllChangesOfProductService extends ApiHelper
{
    public static Response ApproveAllChangesOfProductRequest(ApproveAllChangesOfProductRequestModel approveAllChangesOfProductRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(approveAllChangesOfProductRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = productWithToken(token).body(gson().toJson(approveAllChangesOfProductRequestModel)).put("product/approve-all");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        System.out.println("getContentType"+response.getContentType()+"getTime"+response.getTime());
        return response;
    }
}
