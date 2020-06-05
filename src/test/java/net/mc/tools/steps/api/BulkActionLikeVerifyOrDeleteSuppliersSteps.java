package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.bulkActionLikeVerifyOrDeleteSuppliers.bulkActionLikeVerifyOrDeleteSuppliersRequest.BulkActionLikeVerifyOrDeleteSuppliersRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.BulkActionLikeVerifyOrDeleteSuppliersService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class BulkActionLikeVerifyOrDeleteSuppliersSteps
{
    private Response jsonResponse;
    private BulkActionLikeVerifyOrDeleteSuppliersRequestModel bulkActionLikeVerifyOrDeleteSuppliersRequestModel;
    private String[] vendorId;
    private ResponseCommonForAll responseCommonForAll;


    @And("^user enters that vendor details he wants to verify$")
    public void userEntersThatVendorDetailsHeWantsToVerify(List<String> vendorIdList)
    {
     vendorId=new String[vendorIdList.size()];
     for (int i=0;i<vendorId.length;i++)
     {
         vendorId[i]=vendorIdList.get(i);
     }
    }

    @And("^user enters other details for verify suppliers in Bulk$")
    public void userEntersOtherDetailsForVerifySuppliersInBulk(List<BulkActionLikeVerifyOrDeleteSuppliersRequestModel> bulkActionLikeVerifyOrDeleteSuppliersRequestModelList)
    {
        this.bulkActionLikeVerifyOrDeleteSuppliersRequestModel=bulkActionLikeVerifyOrDeleteSuppliersRequestModelList.get(0);
        if (!vendorId[0].equals(""))
        {
            this.bulkActionLikeVerifyOrDeleteSuppliersRequestModel.setIds(vendorId);
        }
        vendorId=null;
    }

    @And("^user make requests to verify suppliers in Bulk$")
    public void userMakeRequestsToVerifySuppliersInBulk()
    {
       jsonResponse= BulkActionLikeVerifyOrDeleteSuppliersService.BulkActionLikeVerifyOrDeleteSuppliersRequest(bulkActionLikeVerifyOrDeleteSuppliersRequestModel,LoginSteps.token);
    }

    @And("^user make request to verify suppliers in Bulk with Incorrect/blank token field in form of without login credentials$")
    public void userMakeRequestsToVerifySuppliersInBulkwithinvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse= BulkActionLikeVerifyOrDeleteSuppliersService.BulkActionLikeVerifyOrDeleteSuppliersRequest(bulkActionLikeVerifyOrDeleteSuppliersRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^user should be able to verify suppliers in Bulk$")
    public void userShouldBeAbleToVerifySuppliersInBulk()
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals("true",responseCommonForAll.getData());
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
    }

    @And("^user enters that vendor details he wants to delete$")
    public void userEntersThatVendorDetailsHeWantsToDelete(List<String> vendorIdList)
    {
        vendorId=new String[vendorIdList.size()];
        for (int i=0;i<vendorId.length;i++)
        {
            vendorId[i]=vendorIdList.get(i);
        }

    }

    @And("^user enters other details for delete suppliers in Bulk$")
    public void userEntersOtherDetailsForDeleteSuppliersInBulk(List<BulkActionLikeVerifyOrDeleteSuppliersRequestModel> bulkActionLikeVerifyOrDeleteSuppliersRequestModelList)
    {
        this.bulkActionLikeVerifyOrDeleteSuppliersRequestModel=bulkActionLikeVerifyOrDeleteSuppliersRequestModelList.get(0);

        if (!vendorId[0].equals(""))
        {
            this.bulkActionLikeVerifyOrDeleteSuppliersRequestModel.setIds(vendorId);
        }
        vendorId=null;
    }

    @And("^user make requests to delete suppliers in Bulk$")
    public void userMakeRequestsToDeleteSuppliersInBulk()
    {
        jsonResponse= BulkActionLikeVerifyOrDeleteSuppliersService.BulkActionLikeVerifyOrDeleteSuppliersRequest(bulkActionLikeVerifyOrDeleteSuppliersRequestModel,LoginSteps.token);
    }

    @And("^user make request to delete suppliers in Bulk with Incorrect/blank token field in form of without login credentials$")
    public void userMakeRequestsTodeleteSuppliersInBulkwithinvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse= BulkActionLikeVerifyOrDeleteSuppliersService.BulkActionLikeVerifyOrDeleteSuppliersRequest(bulkActionLikeVerifyOrDeleteSuppliersRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^user should be able to delete suppliers in Bulk$")
    public void userShouldBeAbleToDeleteSuppliersInBulk()
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals("true",responseCommonForAll.getData());
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
    }

    @Then("^user should not be able to verify suppliers in Bulk and user should get validation error message$")
    public void userShould_Not_BeAbleToverifySuppliersInBulk(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

    @Then("^user should not be able to delete suppliers in Bulk and user should get validation error message$")
    public void userShould_Not_BeAbleToDeleteSuppliersInBulk(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }

}
