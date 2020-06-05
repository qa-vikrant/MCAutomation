package net.mc.tools.models.updateSellerProfile.updateSellerProfileRequest;

public class UpdateSellerProfileRequestModel
{
    private Boolean isProfile;

    private String brandName;

    private String editedBy;

    private String email;

    public Boolean getIsProfile() {
        return isProfile;
    }

    public void setIsProfile(Boolean isProfile) {
        this.isProfile = isProfile;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getEditedBy() {
        return editedBy;
    }

    public void setEditedBy(String editedBy) {
        this.editedBy = editedBy;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;

    }
}
