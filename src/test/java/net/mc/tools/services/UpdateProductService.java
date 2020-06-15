package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.updateProductBySellerAndVendor.updateProductRequest.UpdateProductRequestModel;

public class UpdateProductService extends ApiHelper
{
    public static Response UpdateProductRequest(UpdateProductRequestModel updateProductRequestModel , String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateProductRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = productWithToken(token).body(gson().toJson(updateProductRequestModel)).put("product");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }

}
