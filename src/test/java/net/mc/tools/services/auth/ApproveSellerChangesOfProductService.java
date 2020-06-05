package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.approveSellerChangesOfProduct.approveSellerChangesOfProductRequest.ApproveSellerChangesOfProductRequestModel;

import java.util.List;

public class ApproveSellerChangesOfProductService extends ApiHelper
{
    public static Response ApproveSellerChangesOfProductRequest(ApproveSellerChangesOfProductRequestModel approveSellerChangesOfProductRequestModel,String token)
    {
        Response jsonResponse;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(approveSellerChangesOfProductRequestModel)+" Token Message is : ( "+token+")");


        jsonResponse=productWithToken(token).body(gson().toJson(approveSellerChangesOfProductRequestModel)).put("product/approve-seller");
        System.out.println("Json Data After hitting api  is "+jsonResponse.body().prettyPrint());

        return jsonResponse;
    }


}
