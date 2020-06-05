package net.mc.tools.models.bulkActionLikeVerifyOrDeleteSuppliers.bulkActionLikeVerifyOrDeleteSuppliersRequest;

public class BulkActionLikeVerifyOrDeleteSuppliersRequestModel
{
    private Boolean all;

    private String reason;

    private String sellerId;

    private Boolean  deleteFromShopify;

    private String[] ids;

    private String key;

    private Boolean isSystemAdmin;

    public Boolean getIsSystemAdmin ()
    {
        return isSystemAdmin;
    }

    public void setIsSystemAdmin (Boolean isSystemAdmin)
    {
        this.isSystemAdmin = isSystemAdmin;
    }


    public Boolean getAll ()
    {
        return all;
    }

    public void setAll (Boolean all)
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

    public String getSellerId ()
    {
        return sellerId;
    }

    public void setSellerId (String sellerId)
    {
        this.sellerId = sellerId;
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
