package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.updateProductApprovalSettings.request.UpdateProductApprovalRequestModel;

public class UpdateProductApprovalService extends ApiHelper
{

    public static Response UpdateProductApprovalRequest(UpdateProductApprovalRequestModel updateProductApprovalRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateProductApprovalRequestModel)+" Token Message is : ( "+token+")");

        response = authWithToken(token).body(gson().toJson(updateProductApprovalRequestModel)).put("user/setting/product");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());

        return response;
    }


}
