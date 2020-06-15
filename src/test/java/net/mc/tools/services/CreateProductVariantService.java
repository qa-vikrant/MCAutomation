package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.productVariant.createProductVariantRequest.CreateProductVariantRequestModel;

public class CreateProductVariantService extends ApiHelper
{
    public static Response CreateProductVariantRequest(CreateProductVariantRequestModel createProductVariantRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(createProductVariantRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = productWithToken(token).body(gson().toJson(createProductVariantRequestModel)).post("/product/variant");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }
}
