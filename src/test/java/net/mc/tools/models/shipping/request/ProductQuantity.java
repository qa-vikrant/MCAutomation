package net.mc.tools.models.shipping.request;

public class ProductQuantity
{
    private String criteria;

    private String value;

    public String getCriteria ()
    {
        return criteria;
    }

    public void setCriteria (String criteria)
    {
        this.criteria = criteria;
    }

    public String getValue ()
    {
        return value;
    }

    public void setValue (String value)
    {
        this.value = value;
    }
}
