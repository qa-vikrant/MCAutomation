
package net.mc.tools.models.updateUserSetting.updateUserSettingResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Products {

    @SerializedName("max")
    @Expose
    private Integer max;
    @SerializedName("used")
    @Expose
    private Integer used;

    public Integer getMax() {
        return max;
    }

    public void setMax(Integer max) {
        this.max = max;
    }

    public Integer getUsed() {
        return used;
    }

    public void setUsed(Integer used) {
        this.used = used;
    }

}
