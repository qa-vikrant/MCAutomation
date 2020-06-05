package net.mc.tools.models.bulkActionLikeDeleteSellers.bulkActionLikeDeleteSellersRequest;

public class BulkActionLikeDeleteSellersRequestModel
{
    private Boolean all;



    private String reason;

    private Boolean deleteFromShopify;

    private String[] ids;

    private String key;

    public Boolean getAll ()
    {
        return all;
    }

    public void setAll (Boolean all)
    {
        this.all = all;
    }


    private Boolean isSystemAdmin;

    public Boolean getIsSystemAdmin ()
    {
        return isSystemAdmin;
    }

    public void setIsSystemAdmin (Boolean isSystemAdmin)
    {
        this.isSystemAdmin = isSystemAdmin;
    }

    public String getReason ()
    {
        return reason;
    }

    public void setReason (String reason)
    {
        this.reason = reason;
    }

    public Boolean getDeleteFromShopify ()
    {
        return deleteFromShopify;
    }

    public void setDeleteFromShopify (Boolean deleteFromShopify)
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
