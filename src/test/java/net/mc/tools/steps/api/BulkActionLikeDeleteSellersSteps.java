package net.mc.tools.steps.api;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.bulkActionLikeDeleteSellers.bulkActionLikeDeleteSellersRequest.BulkActionLikeDeleteSellersRequestModel;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.models.token.TokenMessageRequestModel;
import net.mc.tools.services.auth.BulkActionLikeDeleteSellersService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.helpers.ApiHelper.gson;

public class BulkActionLikeDeleteSellersSteps
{
    private Response jsonResponse;
    private BulkActionLikeDeleteSellersRequestModel bulkActionLikeDeleteSellersRequestModel;
    private ResponseCommonForAll responseCommonForAll;
    private String[] ids;

    @And("^user enters that seller details he wants to delete in Bulk$")
    public void userEntersThatSellerDetailsHeWantsToDeleteInBulk(List<String> idsList)
    {
        ids=new String[idsList.size()];
        for (int i=0;i<ids.length;i++)
        {
           ids[i]=idsList.get(i);
        }
    }

    @And("^user enters other details to delete sellers in Bulk$")
    public void userEntersOtherDetailsToDeleteSellersInBulk(List<BulkActionLikeDeleteSellersRequestModel> bulkActionLikeDeleteSellersRequestModelList)
    {
        this.bulkActionLikeDeleteSellersRequestModel=bulkActionLikeDeleteSellersRequestModelList.get(0);
        if(!ids[0].equals(""))
        {
            this.bulkActionLikeDeleteSellersRequestModel.setIds(ids);
        }
        ids=null;
    }

    @And("^user make requests to delete sellers in Bulk$")
    public void userMakeRequestsToDeleteSellersInBulk()
    {
      jsonResponse= BulkActionLikeDeleteSellersService.BulkActionLikeDeleteSellersRequest(bulkActionLikeDeleteSellersRequestModel,LoginSteps.token);
    }


    @And("^user make request to delete sellers in Bulk with Incorrect/blank token field in form of without login credentials$")
    public void userMakeRequestsToDeleteSellersInBulkwithInvalidToken(List<TokenMessageRequestModel> tokenMessageRequestModelList)
    {
        jsonResponse= BulkActionLikeDeleteSellersService.BulkActionLikeDeleteSellersRequest(bulkActionLikeDeleteSellersRequestModel,tokenMessageRequestModelList.get(0).gettoken());
    }

    @Then("^user should be able to delete sellers in Bulk$")
    public void userShouldBeAbleToDeleteSellersInBulk()
    {
        Assert.assertTrue(jsonResponse.getStatusCode()==200);
        responseCommonForAll=gson().fromJson(jsonResponse.body().prettyPrint(),ResponseCommonForAll.class);
        Assert.assertEquals("true",responseCommonForAll.getData());
        Assert.assertEquals("ok",responseCommonForAll.getStatus());
    }

    @Then("^user should not be able to delete sellers in Bulk and user should get validation error message$")
    public void userShouldNotBeAbleToDeleteSellersInBulk(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
