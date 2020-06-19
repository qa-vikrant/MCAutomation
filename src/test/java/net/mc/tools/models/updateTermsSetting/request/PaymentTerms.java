package net.mc.tools.models.updateTermsSetting.request;

public class PaymentTerms {

    private Integer days;

    private String type;

    public Integer getDays ()
    {
        return days;
    }

    public void setDays (Integer days)
    {
        this.days = days;
    }

    public String getType ()
    {
        return type;
    }

    public void setType (String type)
    {
        this.type = type;
    }
}
