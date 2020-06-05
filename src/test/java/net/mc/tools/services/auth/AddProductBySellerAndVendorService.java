package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.addProduct.request.AddProductRequestModel;

public class AddProductBySellerAndVendorService extends ApiHelper
{


    public static Response AddProductRequest(AddProductRequestModel addProductRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(addProductRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = productWithToken(token).body(gson().toJson(addProductRequestModel)).post("product");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }


}
