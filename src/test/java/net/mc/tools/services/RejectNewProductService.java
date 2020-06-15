package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.rejectNewProduct.rejectNewProductRequest.RejectNewProductRequestModel;

public class RejectNewProductService extends ApiHelper
{
    public static Response RejectNewProductRequest(RejectNewProductRequestModel rejectNewProductRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(rejectNewProductRequestModel)+" Token Message is : ( "+token+")");
        response = productWithToken(token).body(gson().toJson(rejectNewProductRequestModel)).put("product/reject");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }
}
