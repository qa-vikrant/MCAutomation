package net.mc.tools.helpers;

import com.jayway.restassured.response.Response;
import net.mc.tools.models.responseForAllModel.ErrorResponseCommonForAll;
import net.mc.tools.services.RegisterSupplierBySelfService;
import org.junit.Assert;

import java.text.DateFormatSymbols;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class HelperClass
{
    private static ErrorResponseCommonForAll errorResponseCommonForAll;
    private static int i=0;
    private static Calendar calendar;
    private static Date timestamp;
    private int AM_PM;
    private static String AM_To_PM;


    public static void ErrorValidationPage(Response jsonResponse, List<String> errorMessage)
    {
        jsonResponse.body().prettyPrint();
        System.out.println("**********************Expected error message is --("+ errorMessage.get(i)+")*************************");
        try
        {
            {
                if (jsonResponse.getStatusCode() >= 400)
                {
                    errorResponseCommonForAll = RegisterSupplierBySelfService.gson().fromJson(jsonResponse.body().prettyPrint(), ErrorResponseCommonForAll.class);
                    Assert.assertEquals("error", errorResponseCommonForAll.getStatus());
                    Assert.assertTrue(errorResponseCommonForAll.getData() == null);
                    if(errorMessage.get(i).equalsIgnoreCase(errorResponseCommonForAll.getError()))
                    {
                        Assert.assertEquals(errorMessage.get(i), errorResponseCommonForAll.getError());
                    }
                    else
                    {
                        System.out.println("********************Expected error message--(" + errorMessage.get(i) + ")is not match with actual error message --(" + errorResponseCommonForAll.getError() + ") and Logged a bug for this defect************************* ");
                        Assert.assertEquals(errorMessage.get(i), errorResponseCommonForAll.getError());
                    }

                } else
                    {
                    System.out.println("********************Expected error message--(" + errorMessage.get(i) + ")is not found and Logged a bug for this defect************************* ");
                    Assert.assertTrue(jsonResponse.getStatusCode() >= 400);
                    }
            }
        }
        catch (Exception error)
        {
            error.printStackTrace();
            System.out.println("********************Expected error message--("+ errorMessage.get(i)+")is not found and Logged a bug for this defect************************* ");
        }
        finally
        {
            i++;
            if (errorMessage.size()==i)
            {
                i=0;
                System.out.println(" i's value, has now been updated as  ----("+i+")");
                errorResponseCommonForAll=null;
            }

        }
    }


    public static String getApiHitTime()
    {
         AM_TO_PM_Calulator();
        String date3=" ( API hitting timing is : "+calendar.get(Calendar.DATE)+" "+new DateFormatSymbols().getMonths()[calendar.get(Calendar.MONTH)]+","+calendar.get(Calendar.YEAR)+","+calendar.get(Calendar.HOUR_OF_DAY)+":"+calendar.get(Calendar.MINUTE)+" "+AM_To_PM+" IST,"+new DateFormatSymbols().getWeekdays()[calendar.get(Calendar.DAY_OF_WEEK)]+")";
        calendar=null;
        timestamp=null;
        return date3;
    }

    public static String getUpdatedTime()
    {
        AM_TO_PM_Calulator();
        String date3="Updated:"+calendar.get(Calendar.DATE)+""+new DateFormatSymbols().getMonths()[calendar.get(Calendar.MONTH)]+","+calendar.get(Calendar.YEAR)+","+calendar.get(Calendar.HOUR_OF_DAY)+":"+calendar.get(Calendar.MINUTE)+""+AM_To_PM;
        calendar=null;
        timestamp=null;
        return date3;
    }

    public static void main(String[] args)
    {
        System.out.println(getUpdatedTime());
        System.out.println(getApiHitTime());

    }

    public static String AM_TO_PM_Calulator()
    {
        calendar=Calendar.getInstance();
        timestamp= calendar.getTime();
        int AM_PM=calendar.get(Calendar.AM_PM);
        if (AM_PM==0)
        {
            AM_To_PM="AM";
        }
        else
        {
            AM_To_PM="PM";
        }
        return AM_To_PM;
    }




}
