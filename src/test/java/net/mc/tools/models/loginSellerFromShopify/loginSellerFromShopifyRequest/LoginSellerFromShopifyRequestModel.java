package net.mc.tools.models.loginSellerFromShopify.loginSellerFromShopifyRequest;

public class LoginSellerFromShopifyRequestModel
{
    private String shopifyAccessToken;

    private String _id;

    public String getShopifyAccessToken ()
    {
        return shopifyAccessToken;
    }

    public void setShopifyAccessToken (String shopifyAccessToken)
    {
        this.shopifyAccessToken = shopifyAccessToken;
    }

    public String get_id ()
    {
        return _id;
    }

    public void set_id (String _id)
    {
        this._id = _id;
    }
}
