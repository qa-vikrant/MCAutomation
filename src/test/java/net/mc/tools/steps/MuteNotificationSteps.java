package net.mc.tools.steps;

import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.mc.tools.helpers.HelperClass;
import net.mc.tools.models.muteNotification.request.MuteNotificationRequestModel;
import net.mc.tools.models.muteNotification.request.MuteNotificationRequestModel2;
import net.mc.tools.models.responseForAllModel.ResponseCommonForAll;
import net.mc.tools.services.MuteNotificationService;
import org.junit.Assert;

import java.util.List;

import static net.mc.tools.services.RegisterSupplierBySelfService.gson;

public class MuteNotificationSteps
{

    private Response jsonResponse;
    private ResponseCommonForAll responseCommonForAll;
    private MuteNotificationRequestModel muteNotificationRequestModel;
    private MuteNotificationRequestModel2 muteNotificationRequestModel2;
    private String[] label;



    @When("^user enter reset information$")
    public void user_enter_reset_information(List<MuteNotificationRequestModel> muteNotificationRequestModelList)
    {
        this.muteNotificationRequestModel=muteNotificationRequestModelList.get(0);
    }
    @When("^user enter label information that needs to be muted$")
    public void userEnterLabel_Information(List<String> labelInfoList)
    {
        label=new String[labelInfoList.size()];
        for(int i=0;i<label.length;i++)
        {
           label[i]=labelInfoList.get(i);
        }

    }
    @When("^user make a request to mute Email notificaiton for their respective label$")
    public void user_request_to_mute_email_notification()
    {
        muteNotificationRequestModel.setLabel(label);
        jsonResponse = MuteNotificationService.muteNotificationRequest(muteNotificationRequestModel,LoginSteps.token);
        muteNotificationRequestModel=null;
    }




    @When("^user enter label information and reset information that needs to be muted$")
    public void user_enter_Label_And_reset_information(List<MuteNotificationRequestModel2> muteNotificationRequestModel2List)
    {
        muteNotificationRequestModel2=muteNotificationRequestModel2List.get(0);
    }
    @When("^user make a request to mute Email notificaiton for their respective single label$")
    public void user_request_to_mute_email_notification_for_Single_Label()
    {
        jsonResponse = MuteNotificationService.muteNotificationRequest2(muteNotificationRequestModel2,LoginSteps.token);
        muteNotificationRequestModel2=null;
    }
//    @When("^user make a request to Un-mute Email notificaiton$")
//    public void user_request_to_Un_mute_email_notification_for_Single_Label(List<MuteNotificationRequestModel2> muteNotificationRequestModel2List)
//    {
//        muteNotificationRequestModel2=muteNotificationRequestModel2List.get(0);
//        jsonResponse = MuteNotificationService.muteNotificationRequest2(muteNotificationRequestModel2,LoginSteps.token);
//    }




    @When("^user make a request to Un-mute Email notificaiton$")
    public void user_request_to_Un_mute_email_notification()
    {
        muteNotificationRequestModel.setLabel(label);
        jsonResponse = MuteNotificationService.muteNotificationRequest(muteNotificationRequestModel,LoginSteps.token);
    }



    @Then("^user should be able to mute Email notificaiton$")
    public void muteNotificaitonWithSuccess()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
        jsonResponse=null;
        responseCommonForAll=null;


    }

    @Then("^user should be able to Un-mute Email notificaiton$")
    public void UnmuteNotificaitonWithSuccess()
    {
        Assert.assertTrue(jsonResponse.getStatusCode() == 200);
        responseCommonForAll = gson().fromJson(jsonResponse.body().prettyPrint(), ResponseCommonForAll.class);
        Assert.assertEquals("ok" , responseCommonForAll.getStatus());
        Assert.assertEquals("true", responseCommonForAll.getData());
        jsonResponse=null;
        responseCommonForAll=null;
        muteNotificationRequestModel=null;
    }

    @Then("^user should not be able to mute Email notificaiton for their respective label and user should get validation error message$")
    public void muteNotificaitonWithSuccessError(List<String> errorMessage)
    {
        HelperClass.ErrorValidationPage(jsonResponse,errorMessage);
    }
}
