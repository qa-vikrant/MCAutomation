package net.mc.tools.models.shipping.request;

public class UpdateShippingOfferRequestModel
{

    private String price;

    private String isCumulative;

    private String priceType;

    private String description;

    private String _id;

    private String userId;

    public String getPrice ()
    {
        return price;
    }

    public void setPrice (String price)
    {
        this.price = price;
    }

    public String getIsCumulative ()
    {
        return isCumulative;
    }

    public void setIsCumulative (String isCumulative)
    {
        this.isCumulative = isCumulative;
    }

    public String getPriceType ()
    {
        return priceType;
    }

    public void setPriceType (String priceType)
    {
        this.priceType = priceType;
    }

    public String getDescription ()
    {
        return description;
    }

    public void setDescription (String description)
    {
        this.description = description;
    }

    public String get_id ()
    {
        return _id;
    }

    public void set_id (String _id)
    {
        this._id = _id;
    }

    public String getUserId ()
    {
        return userId;
    }

    public void setUserId (String userId)
    {
        this.userId = userId;
    }
}
