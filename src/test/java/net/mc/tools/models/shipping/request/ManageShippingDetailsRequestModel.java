package net.mc.tools.models.shipping.request;

public class ManageShippingDetailsRequestModel
{
    private Integer amount;

    private Boolean isFreeForCustomer;

    private Boolean isHideDescription;

    private String[] vendorIds;

    private String term;

    private String type;

    private String allowVendor;

    private ShippingPerVendor shippingPerVendor;

    public Integer getAmount ()
    {
        return amount;
    }

    public void setAmount (Integer amount)
    {
        this.amount = amount;
    }

    public Boolean getIsFreeForCustomer ()
    {
        return isFreeForCustomer;
    }

    public void setIsFreeForCustomer (Boolean isFreeForCustomer)
    {
        this.isFreeForCustomer = isFreeForCustomer;
    }

    public Boolean getIsHideDescription ()
    {
        return isHideDescription;
    }

    public void setIsHideDescription (Boolean isHideDescription)
    {
        this.isHideDescription = isHideDescription;
    }

    public String[] getVendorIds ()
    {
        return vendorIds;
    }

    public void setVendorIds (String[] vendorIds)
    {
        this.vendorIds = vendorIds;
    }

    public String getTerm ()
    {
        return term;
    }

    public void setTerm (String term)
    {
        this.term = term;
    }

    public String getType ()
    {
        return type;
    }

    public void setType (String type)
    {
        this.type = type;
    }

    public String getAllowVendor ()
    {
        return allowVendor;
    }

    public void setAllowVendor (String allowVendor)
    {
        this.allowVendor = allowVendor;
    }

    public ShippingPerVendor getShippingPerVendor ()
    {
        return shippingPerVendor;
    }

    public void setShippingPerVendor (ShippingPerVendor shippingPerVendor)
    {
        this.shippingPerVendor = shippingPerVendor;
    }


}
