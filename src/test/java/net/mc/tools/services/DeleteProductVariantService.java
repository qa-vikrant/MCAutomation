package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.productVariant.deleteProductVariantRequest.DeleteProductVariantRequestModel;

public class DeleteProductVariantService extends ApiHelper
{
    public static Response deleteProductVariantRequest(DeleteProductVariantRequestModel deleteProductVariantRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(deleteProductVariantRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = productWithToken(token).body(gson().toJson(deleteProductVariantRequestModel)).delete("product/variant");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }

}
