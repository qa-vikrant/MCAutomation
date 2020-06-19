package net.mc.tools.models.updateTermsSetting.request;

public class UpdateTermsSettingForSellerRequestModel {

    private Boolean isReturn;

    private Integer returnPeriod;

    private PaymentTerms paymentTerms;

    public Boolean getIsReturn ()
    {
        return isReturn;
    }

    public void setIsReturn (Boolean isReturn)
    {
        this.isReturn = isReturn;
    }

    public Integer getReturnPeriod ()
    {
        return returnPeriod;
    }

    public void setReturnPeriod (Integer returnPeriod)
    {
        this.returnPeriod = returnPeriod;
    }

    public PaymentTerms getPaymentTerms ()
    {
        return paymentTerms;
    }

    public void setPaymentTerms (PaymentTerms paymentTerms)
    {
        this.paymentTerms = paymentTerms;
    }
}
