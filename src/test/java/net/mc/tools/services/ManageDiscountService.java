package net.mc.tools.services;

import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.manageDiscount.request.ManageDiscountRequestModel;

public class ManageDiscountService extends ApiHelper
{
    public static Response ManageDiscountRequest(ManageDiscountRequestModel manageDiscountRequestModel, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(manageDiscountRequestModel)+" Token Message is : ( "+token+")");

        response = authWithToken(token).body(gson().toJson(manageDiscountRequestModel)).post("user/discount");

        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());

        return response;
    }



}
