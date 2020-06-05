
package net.mc.tools.models.fetchListOfProducts.fetchListOfProductsResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Variant {

    @SerializedName("markUp")
    @Expose
    private MarkUp markUp;
    @SerializedName("sellerDiscount")
    @Expose
    private SellerDiscount sellerDiscount;
    @SerializedName("vendorDiscount")
    @Expose
    private VendorDiscount vendorDiscount;
    @SerializedName("option1")
    @Expose
    private String option1;
    @SerializedName("option2")
    @Expose
    private String option2;
    @SerializedName("option3")
    @Expose
    private String option3;
    @SerializedName("fulfillmentService")
    @Expose
    private String fulfillmentService;
    @SerializedName("inventoryManagement")
    @Expose
    private String inventoryManagement;
    @SerializedName("inventoryPolicy")
    @Expose
    private String inventoryPolicy;
    @SerializedName("isShipping")
    @Expose
    private Boolean isShipping;
    @SerializedName("isTaxable")
    @Expose
    private Boolean isTaxable;
    @SerializedName("weightUnit")
    @Expose
    private String weightUnit;
    @SerializedName("markUpAmount")
    @Expose
    private Integer markUpAmount;
    @SerializedName("customCharge")
    @Expose
    private Integer customCharge;
    @SerializedName("position")
    @Expose
    private Integer position;
    @SerializedName("option1Val")
    @Expose
    private String option1Val;
    @SerializedName("option2Val")
    @Expose
    private String option2Val;
    @SerializedName("option3Val")
    @Expose
    private String option3Val;
    @SerializedName("price")
    @Expose
    private Integer price;
    @SerializedName("sku")
    @Expose
    private String sku;
    @SerializedName("barcode")
    @Expose
    private String barcode;
    @SerializedName("comparePrice")
    @Expose
    private Integer comparePrice;
    @SerializedName("grams")
    @Expose
    private Integer grams;
    @SerializedName("inventoryQuantity")
    @Expose
    private Integer inventoryQuantity;
    @SerializedName("weight")
    @Expose
    private Integer weight;
    @SerializedName("inventoryItemId")
    @Expose
    private Long inventoryItemId;
    @SerializedName("shopifyVariantId")
    @Expose
    private Long shopifyVariantId;
    @SerializedName("shopifyImageId")
    @Expose
    private Object shopifyImageId;
    @SerializedName("priceWithMarkup")
    @Expose
    private Integer priceWithMarkup;
    @SerializedName("markUpRule")
    @Expose
    private String markUpRule;
    @SerializedName("discountAmount")
    @Expose
    private Integer discountAmount;
    @SerializedName("discountRule")
    @Expose
    private String discountRule;

    public MarkUp getMarkUp() {
        return markUp;
    }

    public void setMarkUp(MarkUp markUp) {
        this.markUp = markUp;
    }

    public SellerDiscount getSellerDiscount() {
        return sellerDiscount;
    }

    public void setSellerDiscount(SellerDiscount sellerDiscount) {
        this.sellerDiscount = sellerDiscount;
    }

    public VendorDiscount getVendorDiscount() {
        return vendorDiscount;
    }

    public void setVendorDiscount(VendorDiscount vendorDiscount) {
        this.vendorDiscount = vendorDiscount;
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getFulfillmentService() {
        return fulfillmentService;
    }

    public void setFulfillmentService(String fulfillmentService) {
        this.fulfillmentService = fulfillmentService;
    }

    public String getInventoryManagement() {
        return inventoryManagement;
    }

    public void setInventoryManagement(String inventoryManagement) {
        this.inventoryManagement = inventoryManagement;
    }

    public String getInventoryPolicy() {
        return inventoryPolicy;
    }

    public void setInventoryPolicy(String inventoryPolicy) {
        this.inventoryPolicy = inventoryPolicy;
    }

    public Boolean getIsShipping() {
        return isShipping;
    }

    public void setIsShipping(Boolean isShipping) {
        this.isShipping = isShipping;
    }

    public Boolean getIsTaxable() {
        return isTaxable;
    }

    public void setIsTaxable(Boolean isTaxable) {
        this.isTaxable = isTaxable;
    }

    public String getWeightUnit() {
        return weightUnit;
    }

    public void setWeightUnit(String weightUnit) {
        this.weightUnit = weightUnit;
    }

    public Integer getMarkUpAmount() {
        return markUpAmount;
    }

    public void setMarkUpAmount(Integer markUpAmount) {
        this.markUpAmount = markUpAmount;
    }

    public Integer getCustomCharge() {
        return customCharge;
    }

    public void setCustomCharge(Integer customCharge) {
        this.customCharge = customCharge;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public String getOption1Val() {
        return option1Val;
    }

    public void setOption1Val(String option1Val) {
        this.option1Val = option1Val;
    }

    public String getOption2Val() {
        return option2Val;
    }

    public void setOption2Val(String option2Val) {
        this.option2Val = option2Val;
    }

    public String getOption3Val() {
        return option3Val;
    }

    public void setOption3Val(String option3Val) {
        this.option3Val = option3Val;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public Integer getComparePrice() {
        return comparePrice;
    }

    public void setComparePrice(Integer comparePrice) {
        this.comparePrice = comparePrice;
    }

    public Integer getGrams() {
        return grams;
    }

    public void setGrams(Integer grams) {
        this.grams = grams;
    }

    public Integer getInventoryQuantity() {
        return inventoryQuantity;
    }

    public void setInventoryQuantity(Integer inventoryQuantity) {
        this.inventoryQuantity = inventoryQuantity;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Long getInventoryItemId() {
        return inventoryItemId;
    }

    public void setInventoryItemId(Long inventoryItemId) {
        this.inventoryItemId = inventoryItemId;
    }

    public Long getShopifyVariantId() {
        return shopifyVariantId;
    }

    public void setShopifyVariantId(Long shopifyVariantId) {
        this.shopifyVariantId = shopifyVariantId;
    }

    public Object getShopifyImageId() {
        return shopifyImageId;
    }

    public void setShopifyImageId(Object shopifyImageId) {
        this.shopifyImageId = shopifyImageId;
    }

    public Integer getPriceWithMarkup() {
        return priceWithMarkup;
    }

    public void setPriceWithMarkup(Integer priceWithMarkup) {
        this.priceWithMarkup = priceWithMarkup;
    }

    public String getMarkUpRule() {
        return markUpRule;
    }

    public void setMarkUpRule(String markUpRule) {
        this.markUpRule = markUpRule;
    }

    public Integer getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(Integer discountAmount) {
        this.discountAmount = discountAmount;
    }

    public String getDiscountRule() {
        return discountRule;
    }

    public void setDiscountRule(String discountRule) {
        this.discountRule = discountRule;
    }

}
