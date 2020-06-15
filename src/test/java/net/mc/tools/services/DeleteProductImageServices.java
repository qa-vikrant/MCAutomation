package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.deleteProductImage.deleteProductImageRequestModel.DeleteProductImageRequest;

public class DeleteProductImageServices extends ApiHelper
{

    public static Response deleteProductImageRequest(DeleteProductImageRequest deleteProductImageRequest, String token) {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(deleteProductImageRequest)+" Token Message is : ( "+token+")");

        response = productWithToken(token).body(gson().toJson(deleteProductImageRequest)).delete("product/image");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());

        return response;
    }


}
