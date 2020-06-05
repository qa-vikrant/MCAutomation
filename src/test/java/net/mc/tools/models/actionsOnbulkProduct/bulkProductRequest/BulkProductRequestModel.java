package net.mc.tools.models.actionsOnbulkProduct.bulkProductRequest;

public class BulkProductRequestModel
{
    private String all;

    private String reason;

    private String deleteFromShopify;

    private String[] ids;

    private String key;

    public String getAll ()
    {
        return all;
    }

    public void setAll (String all)
    {
        this.all = all;
    }

    public String getReason ()
    {
        return reason;
    }

    public void setReason (String reason)
    {
        this.reason = reason;
    }

    public String getDeleteFromShopify ()
    {
        return deleteFromShopify;
    }

    public void setDeleteFromShopify (String deleteFromShopify)
    {
        this.deleteFromShopify = deleteFromShopify;
    }

    public String[] getIds ()
    {
        return ids;
    }

    public void setIds (String[] ids)
    {
        this.ids = ids;
    }

    public String getKey ()
    {
        return key;
    }

    public void setKey (String key)
    {
        this.key = key;
    }

}
