
package net.mc.tools.models.updateUserSetting.updateUserSettingResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Setting {

    @SerializedName("isAcceptOrder")
    @Expose
    private Boolean isAcceptOrder;
    @SerializedName("isFulfillOrder")
    @Expose
    private Object isFulfillOrder;

    public Boolean getIsAcceptOrder() {
        return isAcceptOrder;
    }

    public void setIsAcceptOrder(Boolean isAcceptOrder) {
        this.isAcceptOrder = isAcceptOrder;
    }

    public Object getIsFulfillOrder() {
        return isFulfillOrder;
    }

    public void setIsFulfillOrder(Object isFulfillOrder) {
        this.isFulfillOrder = isFulfillOrder;
    }

}
