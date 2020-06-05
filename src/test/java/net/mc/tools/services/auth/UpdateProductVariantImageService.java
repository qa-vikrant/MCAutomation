package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.productVariant.updateProductVariantImageRequest.UpdateProductVariantImageRequestModel;

public class UpdateProductVariantImageService extends ApiHelper
{

    public static Response UpdateProductVariantImageRequest(UpdateProductVariantImageRequestModel updateProductVariantImageRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updateProductVariantImageRequestModel)+" Token Message is : ( "+token+")");
        response = productWithToken(token).body(gson().toJson(updateProductVariantImageRequestModel)).put("/product/variant/image");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }
}
