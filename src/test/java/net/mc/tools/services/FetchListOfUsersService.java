package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.fetchListOfUsers.FetchListOfUsersRequest.FetchListOfUsersRequestModel;

public class FetchListOfUsersService extends ApiHelper
{

    private static String QueryParams;

    public static Response FetchListOfUsersWithToken(FetchListOfUsersRequestModel fetchListOfUsersRequestModel, String token)
    {
        QueryParams="?userId="+fetchListOfUsersRequestModel.getuserId()+"&userType="+fetchListOfUsersRequestModel.getuserType();

        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(fetchListOfUsersRequestModel)+" Token Message is : ( "+token+")");
        response=authWithToken(token).get("/user"+QueryParams);
        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;

    }

}
