package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.fetchListOfProducts.fetchListOfProductsRequest.FetchListOfProductsRequestModel;

public class FetchListOfProductsService extends ApiHelper
{
    private static String params;
    public static Response FetchListOfProductRequestWithToken(FetchListOfProductsRequestModel fetchListOfProductsRequestModel, String token)
    {
        Response response;
        params="?"+"userId="+fetchListOfProductsRequestModel.getUserId();
        System.out.println("Json Data Before hitting api  is "+gson().toJson(fetchListOfProductsRequestModel)+" : params is : "+params+" Token Message is : ( "+token+")");

        response = productWithToken(token).get("product"+params);

        System.out.println("Json Data After hitting api  is : "+response.body().prettyPrint()+" :    getContentType    : "+response.getContentType()+" :  getTime : "+response.getTime());
        return response;
    }


}
