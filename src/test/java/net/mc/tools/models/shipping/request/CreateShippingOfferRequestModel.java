package net.mc.tools.models.shipping.request;

public class CreateShippingOfferRequestModel
{
    private String condition;

    private ProductQuantity productQuantity;

    private String[] productIds;

    private String[] destinationCodes;

    private String price;

    private String isCumulative;

    private String priceType;

    private String shippingBandId;

    private String description;

    private OrderValue orderValue;

    private ProductPrice productPrice;

    public String getCondition ()
    {
        return condition;
    }

    public void setCondition (String condition)
    {
        this.condition = condition;
    }

    public ProductQuantity getProductQuantity ()
    {
        return productQuantity;
    }

    public void setProductQuantity (ProductQuantity productQuantity)
    {
        this.productQuantity = productQuantity;
    }

    public String[] getProductIds ()
    {
        return productIds;
    }

    public void setProductIds (String[] productIds)
    {
        this.productIds = productIds;
    }

    public String[] getDestinationCodes ()
    {
        return destinationCodes;
    }

    public void setDestinationCodes (String[] destinationCodes)
    {
        this.destinationCodes = destinationCodes;
    }

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

    public String getShippingBandId ()
    {
        return shippingBandId;
    }

    public void setShippingBandId (String shippingBandId)
    {
        this.shippingBandId = shippingBandId;
    }

    public String getDescription ()
    {
        return description;
    }

    public void setDescription (String description)
    {
        this.description = description;
    }

    public OrderValue getOrderValue ()
    {
        return orderValue;
    }

    public void setOrderValue (OrderValue orderValue)
    {
        this.orderValue = orderValue;
    }

    public ProductPrice getProductPrice ()
    {
        return productPrice;
    }

    public void setProductPrice (ProductPrice productPrice)
    {
        this.productPrice = productPrice;
    }
}
