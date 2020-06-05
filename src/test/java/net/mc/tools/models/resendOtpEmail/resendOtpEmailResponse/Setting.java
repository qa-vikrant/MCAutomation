
package net.mc.tools.models.resendOtpEmail.resendOtpEmailResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Setting {

    @SerializedName("isAcceptOrder")
    @Expose
    private Boolean isAcceptOrder;

    public Boolean getIsAcceptOrder() {
        return isAcceptOrder;
    }

    public void setIsAcceptOrder(Boolean isAcceptOrder) {
        this.isAcceptOrder = isAcceptOrder;
    }

}
