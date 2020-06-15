package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.countListOfUsers.CountListOfUsersRequest.CountListOfUsersRequest;
import net.mc.tools.models.countListOfUsers.CountListOfUsersRequest.CountListOfUsersRequestModel;

import java.util.List;

public class CountListOfUsersService extends ApiHelper
{
    private static String QueryParams;

    public static Response CountListOfUsersWithToken2(List<CountListOfUsersRequestModel> countListOfUsersRequestModelList, String token)
    {
        Response response;
        response = authWithToken(token).body(gson().toJson(countListOfUsersRequestModelList.get(0))).get("/user/count");
        return response;
    }

     public static Response CountListOfUsersWithToken(CountListOfUsersRequest countListOfUsersList, String token)
    {
        Response response;
        response = authWithToken(token).body(gson().toJson(countListOfUsersList)).get("/user/count");
        return response;
    }


    public static Response CountListOfUsersWithToken1(CountListOfUsersRequest countListOfUsersList, String token)
    {
        Response response;
        QueryParams="?userRole="+countListOfUsersList.getuserRole().getuserRole()+"&filter="+countListOfUsersList.getFilter().getFilter();

        response = authWithToken(token).body(gson().toJson(countListOfUsersList)).get("/user/count"+QueryParams);
        return response;
    }

}
