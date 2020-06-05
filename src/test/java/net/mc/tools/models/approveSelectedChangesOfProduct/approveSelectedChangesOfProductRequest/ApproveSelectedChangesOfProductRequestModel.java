package net.mc.tools.models.approveSelectedChangesOfProduct.approveSelectedChangesOfProductRequest;

public class ApproveSelectedChangesOfProductRequestModel
{
    private String seller;

    private String[] keys;

    private String id;

    public String getSeller ()
    {
        return seller;
    }

    public void setSeller (String seller)
    {
        this.seller = seller;
    }

    public String[] getKeys ()
    {
        return keys;
    }

    public void setKeys (String[] keys)
    {
        this.keys = keys;
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
