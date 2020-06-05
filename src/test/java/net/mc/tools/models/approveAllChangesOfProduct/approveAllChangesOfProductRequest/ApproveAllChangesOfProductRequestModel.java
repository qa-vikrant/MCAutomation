package net.mc.tools.models.approveAllChangesOfProduct.approveAllChangesOfProductRequest;

public class ApproveAllChangesOfProductRequestModel
{
    private String seller;

    private Boolean publish;

    private Boolean isToPublish;

    private String id;

    public String getSeller ()
    {
        return seller;
    }

    public void setSeller (String seller)
    {
        this.seller = seller;
    }

    public Boolean getisToPublish()
    {
        return isToPublish;
    }

    public void setisToPublish(Boolean isToPublish)
    {
        this.isToPublish = isToPublish;
    }


    public Boolean getPublish ()
    {
        return publish;
    }

    public void setPublish (Boolean publish)
    {
        this.publish = publish;
    }
    public String getId ()
    {
        return id;
    }

    public void setId (String id)
    {
        this.id = id;
    }
}
