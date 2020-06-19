
package net.mc.tools.models.updateUserSetting.updateUserSettingResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Vendors {

    @SerializedName("max")
    @Expose
    private Integer max;
    @SerializedName("associated")
    @Expose
    private Integer associated;

    public Integer getMax() {
        return max;
    }

    public void setMax(Integer max) {
        this.max = max;
    }

    public Integer getAssociated() {
        return associated;
    }

    public void setAssociated(Integer associated) {
        this.associated = associated;
    }

}
