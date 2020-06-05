package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.approveSelectedChangesOfProduct.approveSelectedChangesOfProductRequest.ApproveSelectedChangesOfProductRequestModel;

public class ApproveSelectedChangesOfProductService extends ApiHelper
{
    public static Response ApproveSelectedChangesOfProductRequest(ApproveSelectedChangesOfProductRequestModel approveSelectedChangesOfProductRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(approveSelectedChangesOfProductRequestModel)+" Token Message is : ( "+token+")");
        response = productWithToken(token).body(gson().toJson(approveSelectedChangesOfProductRequestModel)).put("product/approve-selected");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }
}
