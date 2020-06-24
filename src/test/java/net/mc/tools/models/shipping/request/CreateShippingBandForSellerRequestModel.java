package net.mc.tools.models.shipping.request;

public class CreateShippingBandForSellerRequestModel {

    private Integer price;

    private Boolean isUpdateAllowed;

    private String name;

    private String priceType;

    private String description;

    public Integer getPrice ()
    {
        return price;
    }

    public void setPrice (Integer price)
    {
        this.price = price;
    }

    public Boolean getIsUpdateAllowed ()
    {
        return isUpdateAllowed;
    }

    public void setIsUpdateAllowed (Boolean isUpdateAllowed)
    {
        this.isUpdateAllowed = isUpdateAllowed;
    }

    public String getName ()
    {
        return name;
    }

    public void setName (String name)
    {
        this.name = name;
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
}
