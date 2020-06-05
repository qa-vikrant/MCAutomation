
package net.mc.tools.models.resendOtpEmail.resendOtpEmailResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Plan {

    @SerializedName("trial")
    @Expose
    private Integer trial;

    public Integer getTrial() {
        return trial;
    }

    public void setTrial(Integer trial) {
        this.trial = trial;
    }

}
