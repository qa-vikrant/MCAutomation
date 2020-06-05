package net.mc.tools.models.updateProductBySellerAndVendor.updateProductResponse;

public class SellerID
{
    private String sellerId;

    private String shopifyProductId;

    public String getSellerId ()
    {
        return sellerId;
    }

    public void setSellerId (String sellerId)
    {
        this.sellerId = sellerId;
    }

    public String getShopifyProductId ()
    {
        return shopifyProductId;
    }

    public void setShopifyProductId (String shopifyProductId)
    {
        this.shopifyProductId = shopifyProductId;
    }
}
