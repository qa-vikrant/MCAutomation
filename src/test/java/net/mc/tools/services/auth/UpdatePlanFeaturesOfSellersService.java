package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.actionsOnbulkProduct.bulkProductRequest.BulkProductRequestModel;
import net.mc.tools.models.updatePlanFeaturesOfSellers.updatePlanFeaturesOfSellersRequest.UpdatePlanFeaturesOfSellersRequestModel;
import net.mc.tools.models.updatePlanFeaturesOfSellers.updatePlanFeaturesOfSellersRequest.UpdatePlanFeaturesOfSellersRequestModelLong;

public class UpdatePlanFeaturesOfSellersService extends ApiHelper
{
    public static Response UpdatePlanFeaturesOfSellersRequest(UpdatePlanFeaturesOfSellersRequestModel updatePlanFeaturesOfSellersRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updatePlanFeaturesOfSellersRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = authWithToken(token).body(gson().toJson(updatePlanFeaturesOfSellersRequestModel)).put("user/plan");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        System.out.println("getContentType"+response.getContentType()+"getTime"+response.getTime());
        return response;
    }

    public static Response UpdatePlanFeaturesOfSellersLongRequest(UpdatePlanFeaturesOfSellersRequestModelLong updatePlanFeaturesOfSellersRequestModel, String token)
    {
        System.out.println("Json Data Before hitting api  is "+gson().toJson(updatePlanFeaturesOfSellersRequestModel)+" Token Message is : ( "+token+")");
        Response response;
        response = authWithToken(token).body(gson().toJson(updatePlanFeaturesOfSellersRequestModel)).put("user/plan");
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        System.out.println("getContentType"+response.getContentType()+"getTime"+response.getTime());
        return response;
    }
}
