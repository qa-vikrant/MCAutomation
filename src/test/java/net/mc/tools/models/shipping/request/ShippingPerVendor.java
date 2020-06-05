package net.mc.tools.models.shipping.request;

public class ShippingPerVendor
{
    private String isAllowed;

    private String[] vendorIds;

    public String getIsAllowed ()
    {
        return isAllowed;
    }

    public void setIsAllowed (String isAllowed)
    {
        this.isAllowed = isAllowed;
    }

    public String[] getVendorIds ()
    {
        return vendorIds;
    }

    public void setVendorIds (String[] vendorIds)
    {
        this.vendorIds = vendorIds;
    }
}
