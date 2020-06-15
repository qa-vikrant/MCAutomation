package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.productVariant.UpdateProductVariantRequest.UpdateProductVariantRequestModel;

public class UpdateProductVariantService extends ApiHelper
{
    public static Response UpdateProductVariantRequest(UpdateProductVariantRequestModel updateProductVariantRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateProductVariantRequestModel)+" Token Message is : ( "+token+")");
        response = productWithToken(token).body(gson().toJson(updateProductVariantRequestModel)).put("/product/variant");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }
}
