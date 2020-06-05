package net.mc.tools.services.auth;


import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.countListOfProducts.countListOfProductsRequest.CountListOfProductsRequestModel;

import java.util.List;

public class CountListOfProductsService extends ApiHelper
{


    public static Response requestWithToken(List<CountListOfProductsRequestModel> countListOfProductsRequestModelList, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(countListOfProductsRequestModelList)+" Token Message is : ( "+token+")");
        Response response;
        response = productWithToken(token).body(gson().toJson(countListOfProductsRequestModelList.get(0))).get("product/count");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }

}
