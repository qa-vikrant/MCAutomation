package net.mc.tools.models.orders.request;

public class UpdateOrderRequestModel
{
    private String note;

    private String sellerId;

    private String shopifyOrderId;

    private String id;

    public String getNote ()
    {
        return note;
    }

    public void setNote (String note)
    {
        this.note = note;
    }

    public String getSellerId ()
    {
        return sellerId;
    }

    public void setSellerId (String sellerId)
    {
        this.sellerId = sellerId;
    }

    public String getShopifyOrderId ()
    {
        return shopifyOrderId;
    }

    public void setShopifyOrderId (String shopifyOrderId)
    {
        this.shopifyOrderId = shopifyOrderId;
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
