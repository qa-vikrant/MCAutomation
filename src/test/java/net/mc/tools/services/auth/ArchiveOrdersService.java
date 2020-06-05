package net.mc.tools.services.auth;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.orders.request.ArchiveOrderRequestModel;

import java.util.List;

public class ArchiveOrdersService extends ApiHelper
{

      public static Response requestWithToken(List<ArchiveOrderRequestModel> archiveOrderRequestModels, String token)
      {
          System.out.println("Json Data Before hitting api  is "+gson().toJson(archiveOrderRequestModels.get(0))+" Token Message is : ( "+token+")");
          Response response;
        response = orderWithToken(token).body(gson().toJson(archiveOrderRequestModels.get(0))).delete("order/webhook/seller");
          System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }



}
