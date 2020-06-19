package net.mc.tools.models.updateProductApprovalSettings.request;

public class UpdateProductApprovalRequestModel
{

    private Boolean approveAll;

    private Boolean approveSelected;

    private Boolean reviewAll;

    private Boolean isProductSync;

    public Boolean getApproveAll ()
    {
        return approveAll;
    }

    public void setApproveAll (Boolean approveAll)
    {
        this.approveAll = approveAll;
    }

    public Boolean getApproveSelected ()
    {
        return approveSelected;
    }

    public void setApproveSelected (Boolean approveSelected)
    {
        this.approveSelected = approveSelected;
    }

    public Boolean getReviewAll ()
    {
        return reviewAll;
    }

    public void setReviewAll (Boolean reviewAll)
    {
        this.reviewAll = reviewAll;
    }

    public Boolean getIsProductSync ()
    {
        return isProductSync;
    }

    public void setIsProductSync (Boolean isProductSync)
    {
        this.isProductSync = isProductSync;
    }
}
