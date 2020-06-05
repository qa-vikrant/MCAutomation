package net.mc.tools.models.shipping.request;

public class ManageShippingDetailsRequestModel
{
        private String amount;

        private String isFreeForCustomer;

        private String[] vendorIds;

        private String term;

        private String type;

        private String allowVendor;

        private ShippingPerVendor shippingPerVendor;

        public String getAmount ()
        {
            return amount;
        }

        public void setAmount (String amount)
        {
            this.amount = amount;
        }

        public String getIsFreeForCustomer ()
        {
            return isFreeForCustomer;
        }

        public void setIsFreeForCustomer (String isFreeForCustomer)
        {
            this.isFreeForCustomer = isFreeForCustomer;
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
