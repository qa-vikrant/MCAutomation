
package net.mc.tools.models.updateUserSetting.updateUserSettingResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Password {

    @SerializedName("bcrypt")
    @Expose
    private String bcrypt;

    public String getBcrypt() {
        return bcrypt;
    }

    public void setBcrypt(String bcrypt) {
        this.bcrypt = bcrypt;
    }

}
