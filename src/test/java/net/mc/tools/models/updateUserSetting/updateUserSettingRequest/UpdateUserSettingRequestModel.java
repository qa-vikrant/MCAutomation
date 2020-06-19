package net.mc.tools.models.updateUserSetting.updateUserSettingRequest;

public class UpdateUserSettingRequestModel {

    private  Boolean isAcceptOrder;

    private String id;

    public Boolean getIsAcceptOrder ()
    {
        return isAcceptOrder;
    }

    public void setIsAcceptOrder (Boolean isAcceptOrder)
    {
        this.isAcceptOrder = isAcceptOrder;
    }

    public String getId ()
    {
        return id;
    }

    public void setId (String id)
    {
        this.id = id;
    }
}
