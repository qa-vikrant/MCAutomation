package net.mc.tools.models.updatePlanFeaturesOfSellers.updatePlanFeaturesOfSellersRequest;

public class UpdatePlanFeaturesOfSellersRequestModel
{
    private Boolean isBranding;

    private String maxProducts;

    private String maxVendors;

    private String id;

    public Boolean getIsBranding ()
    {
        return isBranding;
    }

    public void setIsBranding (Boolean isBranding)
    {
        this.isBranding = isBranding;
    }

    public String getMaxProducts ()
    {
        return maxProducts;
    }

    public void setMaxProducts (String maxProducts)
    {
        this.maxProducts = maxProducts;
    }

    public String getMaxVendors ()
    {
        return maxVendors;
    }

    public void setMaxVendors (String maxVendors)
    {
        this.maxVendors = maxVendors;
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
