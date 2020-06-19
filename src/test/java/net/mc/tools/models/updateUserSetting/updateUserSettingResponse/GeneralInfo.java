
package net.mc.tools.models.updateUserSetting.updateUserSettingResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class GeneralInfo {

    @SerializedName("brandDescription")
    @Expose
    private String brandDescription;
    @SerializedName("isVendorOnboarding")
    @Expose
    private Boolean isVendorOnboarding;

    public String getBrandDescription() {
        return brandDescription;
    }

    public void setBrandDescription(String brandDescription) {
        this.brandDescription = brandDescription;
    }

    public Boolean getIsVendorOnboarding() {
        return isVendorOnboarding;
    }

    public void setIsVendorOnboarding(Boolean isVendorOnboarding) {
        this.isVendorOnboarding = isVendorOnboarding;
    }

}
