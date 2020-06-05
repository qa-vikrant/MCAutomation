
package net.mc.tools.models.resendOtpEmail.resendOtpEmailResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Shipping {

    @SerializedName("amount")
    @Expose
    private Integer amount;
    @SerializedName("type")
    @Expose
    private String type;

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
