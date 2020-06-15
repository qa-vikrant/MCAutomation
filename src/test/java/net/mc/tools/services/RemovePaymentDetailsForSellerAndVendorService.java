package net.mc.tools.services;

import com.google.gson.Gson;
import com.jayway.restassured.response.Response;
import net.mc.tools.helpers.ApiHelper;
import net.mc.tools.models.removePaymentDetailsForSellerAndVendor.RemovePaymentDetailsForSellerAndVendorRequest.RemovePaymentDetailsForSellerAndVendorRequest;

public class RemovePaymentDetailsForSellerAndVendorService extends ApiHelper
{
    public static Gson gson;

    public static Response RemovePaymentDetailsWithTokenRequest(RemovePaymentDetailsForSellerAndVendorRequest removePaymentDetailsForSellerAndVendorRequest, String token)
    {
        Response response;
        System.out.println("Json Data Before hitting api  is "+gson().toJson(removePaymentDetailsForSellerAndVendorRequest)+" Token Message is : ( "+token+")");

        response = authWithToken(token).body(gson().toJson(removePaymentDetailsForSellerAndVendorRequest)).put("user/payment-disconnect");

        System.out.println("Json Data After hitting api  is "+response.body().prettyPrint());
        return response;
    }


}
