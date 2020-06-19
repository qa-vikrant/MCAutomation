
package net.mc.tools.models.updateUserSetting.updateUserSettingResponse;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Data {

    @SerializedName("plan")
    @Expose
    private Plan plan;
    @SerializedName("products")
    @Expose
    private Products products;
    @SerializedName("vendors")
    @Expose
    private Vendors vendors;
    @SerializedName("email")
    @Expose
    private Email email;
    @SerializedName("roles")
    @Expose
    private Roles roles;
    @SerializedName("services")
    @Expose
    private Services services;
    @SerializedName("setting")
    @Expose
    private Setting setting;
    @SerializedName("paymentTerms")
    @Expose
    private PaymentTerms paymentTerms;
    @SerializedName("shipping")
    @Expose
    private Shipping shipping;
    @SerializedName("style")
    @Expose
    private Style style;
    @SerializedName("register")
    @Expose
    private Register register;
    @SerializedName("generalInfo")
    @Expose
    private GeneralInfo generalInfo;
    @SerializedName("dueDays")
    @Expose
    private Integer dueDays;
    @SerializedName("mirrorUser")
    @Expose
    private String mirrorUser;
    @SerializedName("trialDays")
    @Expose
    private Integer trialDays;
    @SerializedName("isOtp")
    @Expose
    private Boolean isOtp;
    @SerializedName("firstlogin")
    @Expose
    private Boolean firstlogin;
    @SerializedName("isFirstProduct")
    @Expose
    private Boolean isFirstProduct;
    @SerializedName("isFirstOrder")
    @Expose
    private Boolean isFirstOrder;
    @SerializedName("isFirstInvite")
    @Expose
    private Boolean isFirstInvite;
    @SerializedName("isFirstVendor")
    @Expose
    private Boolean isFirstVendor;
    @SerializedName("isFirstApproval")
    @Expose
    private Boolean isFirstApproval;
    @SerializedName("isFirstPublish")
    @Expose
    private Boolean isFirstPublish;
    @SerializedName("isGeneralSetup")
    @Expose
    private Boolean isGeneralSetup;
    @SerializedName("isGlobalShipping")
    @Expose
    private Boolean isGlobalShipping;
    @SerializedName("isDiscount")
    @Expose
    private Boolean isDiscount;
    @SerializedName("isCustomCharge")
    @Expose
    private Boolean isCustomCharge;
    @SerializedName("isMarkup")
    @Expose
    private Boolean isMarkup;
    @SerializedName("isOrderConnect")
    @Expose
    private Boolean isOrderConnect;
    @SerializedName("isVendorChatEnabled")
    @Expose
    private Boolean isVendorChatEnabled;
    @SerializedName("isWebhookUpdated")
    @Expose
    private Boolean isWebhookUpdated;
    @SerializedName("isDomainActive")
    @Expose
    private Boolean isDomainActive;
    @SerializedName("isHideMcInfo")
    @Expose
    private Boolean isHideMcInfo;
    @SerializedName("isReadOnly")
    @Expose
    private Boolean isReadOnly;
    @SerializedName("isDeleted")
    @Expose
    private Boolean isDeleted;
    @SerializedName("isHideVendorContact")
    @Expose
    private Boolean isHideVendorContact;
    @SerializedName("isNewShopifyProduct")
    @Expose
    private Boolean isNewShopifyProduct;
    @SerializedName("productApproval")
    @Expose
    private String productApproval;
    @SerializedName("isRequiredPermission")
    @Expose
    private Boolean isRequiredPermission;
    @SerializedName("isProductSync")
    @Expose
    private Boolean isProductSync;
    @SerializedName("isCarrierService")
    @Expose
    private Boolean isCarrierService;
    @SerializedName("isInactive")
    @Expose
    private Boolean isInactive;
    @SerializedName("setupProgress")
    @Expose
    private String setupProgress;
    @SerializedName("_id")
    @Expose
    private String id;
    @SerializedName("address")
    @Expose
    private String address;
    @SerializedName("brandName")
    @Expose
    private String brandName;
    @SerializedName("city")
    @Expose
    private String city;
    @SerializedName("country")
    @Expose
    private String country;
    @SerializedName("firstName")
    @Expose
    private String firstName;
    @SerializedName("lastName")
    @Expose
    private String lastName;
    @SerializedName("moneyFormat")
    @Expose
    private String moneyFormat;
    @SerializedName("payment")
    @Expose
    private Boolean payment;
    @SerializedName("phoneNumber")
    @Expose
    private Object phoneNumber;
    @SerializedName("pinCode")
    @Expose
    private String pinCode;
    @SerializedName("shop")
    @Expose
    private String shop;
    @SerializedName("shopifyAccessToken")
    @Expose
    private String shopifyAccessToken;
    @SerializedName("userLevel")
    @Expose
    private String userLevel;
    @SerializedName("planId")
    @Expose
    private String planId;
    @SerializedName("volume")
    @Expose
    private List<Object> volume = null;
    @SerializedName("createdAt")
    @Expose
    private String createdAt;
    @SerializedName("updatedAt")
    @Expose
    private String updatedAt;
    @SerializedName("__v")
    @Expose
    private Integer v;
    @SerializedName("commission")
    @Expose
    private Integer commission;
    @SerializedName("commissionType")
    @Expose
    private String commissionType;
    @SerializedName("isReturn")
    @Expose
    private Boolean isReturn;
    @SerializedName("returnPeriod")
    @Expose
    private Integer returnPeriod;
    @SerializedName("chargeId")
    @Expose
    private String chargeId;
    @SerializedName("additionalStoreInfo")
    @Expose
    private AdditionalStoreInfo additionalStoreInfo;
    @SerializedName("emailSign")
    @Expose
    private String emailSign;
    @SerializedName("footerText")
    @Expose
    private String footerText;
    @SerializedName("loginText")
    @Expose
    private String loginText;
    @SerializedName("logo")
    @Expose
    private String logo;
    @SerializedName("contactEmail")
    @Expose
    private String contactEmail;

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    public Vendors getVendors() {
        return vendors;
    }

    public void setVendors(Vendors vendors) {
        this.vendors = vendors;
    }

    public Email getEmail() {
        return email;
    }

    public void setEmail(Email email) {
        this.email = email;
    }

    public Roles getRoles() {
        return roles;
    }

    public void setRoles(Roles roles) {
        this.roles = roles;
    }

    public Services getServices() {
        return services;
    }

    public void setServices(Services services) {
        this.services = services;
    }

    public Setting getSetting() {
        return setting;
    }

    public void setSetting(Setting setting) {
        this.setting = setting;
    }

    public PaymentTerms getPaymentTerms() {
        return paymentTerms;
    }

    public void setPaymentTerms(PaymentTerms paymentTerms) {
        this.paymentTerms = paymentTerms;
    }

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }

    public Style getStyle() {
        return style;
    }

    public void setStyle(Style style) {
        this.style = style;
    }

    public Register getRegister() {
        return register;
    }

    public void setRegister(Register register) {
        this.register = register;
    }

    public GeneralInfo getGeneralInfo() {
        return generalInfo;
    }

    public void setGeneralInfo(GeneralInfo generalInfo) {
        this.generalInfo = generalInfo;
    }

    public Integer getDueDays() {
        return dueDays;
    }

    public void setDueDays(Integer dueDays) {
        this.dueDays = dueDays;
    }

    public String getMirrorUser() {
        return mirrorUser;
    }

    public void setMirrorUser(String mirrorUser) {
        this.mirrorUser = mirrorUser;
    }

    public Integer getTrialDays() {
        return trialDays;
    }

    public void setTrialDays(Integer trialDays) {
        this.trialDays = trialDays;
    }

    public Boolean getIsOtp() {
        return isOtp;
    }

    public void setIsOtp(Boolean isOtp) {
        this.isOtp = isOtp;
    }

    public Boolean getFirstlogin() {
        return firstlogin;
    }

    public void setFirstlogin(Boolean firstlogin) {
        this.firstlogin = firstlogin;
    }

    public Boolean getIsFirstProduct() {
        return isFirstProduct;
    }

    public void setIsFirstProduct(Boolean isFirstProduct) {
        this.isFirstProduct = isFirstProduct;
    }

    public Boolean getIsFirstOrder() {
        return isFirstOrder;
    }

    public void setIsFirstOrder(Boolean isFirstOrder) {
        this.isFirstOrder = isFirstOrder;
    }

    public Boolean getIsFirstInvite() {
        return isFirstInvite;
    }

    public void setIsFirstInvite(Boolean isFirstInvite) {
        this.isFirstInvite = isFirstInvite;
    }

    public Boolean getIsFirstVendor() {
        return isFirstVendor;
    }

    public void setIsFirstVendor(Boolean isFirstVendor) {
        this.isFirstVendor = isFirstVendor;
    }

    public Boolean getIsFirstApproval() {
        return isFirstApproval;
    }

    public void setIsFirstApproval(Boolean isFirstApproval) {
        this.isFirstApproval = isFirstApproval;
    }

    public Boolean getIsFirstPublish() {
        return isFirstPublish;
    }

    public void setIsFirstPublish(Boolean isFirstPublish) {
        this.isFirstPublish = isFirstPublish;
    }

    public Boolean getIsGeneralSetup() {
        return isGeneralSetup;
    }

    public void setIsGeneralSetup(Boolean isGeneralSetup) {
        this.isGeneralSetup = isGeneralSetup;
    }

    public Boolean getIsGlobalShipping() {
        return isGlobalShipping;
    }

    public void setIsGlobalShipping(Boolean isGlobalShipping) {
        this.isGlobalShipping = isGlobalShipping;
    }

    public Boolean getIsDiscount() {
        return isDiscount;
    }

    public void setIsDiscount(Boolean isDiscount) {
        this.isDiscount = isDiscount;
    }

    public Boolean getIsCustomCharge() {
        return isCustomCharge;
    }

    public void setIsCustomCharge(Boolean isCustomCharge) {
        this.isCustomCharge = isCustomCharge;
    }

    public Boolean getIsMarkup() {
        return isMarkup;
    }

    public void setIsMarkup(Boolean isMarkup) {
        this.isMarkup = isMarkup;
    }

    public Boolean getIsOrderConnect() {
        return isOrderConnect;
    }

    public void setIsOrderConnect(Boolean isOrderConnect) {
        this.isOrderConnect = isOrderConnect;
    }

    public Boolean getIsVendorChatEnabled() {
        return isVendorChatEnabled;
    }

    public void setIsVendorChatEnabled(Boolean isVendorChatEnabled) {
        this.isVendorChatEnabled = isVendorChatEnabled;
    }

    public Boolean getIsWebhookUpdated() {
        return isWebhookUpdated;
    }

    public void setIsWebhookUpdated(Boolean isWebhookUpdated) {
        this.isWebhookUpdated = isWebhookUpdated;
    }

    public Boolean getIsDomainActive() {
        return isDomainActive;
    }

    public void setIsDomainActive(Boolean isDomainActive) {
        this.isDomainActive = isDomainActive;
    }

    public Boolean getIsHideMcInfo() {
        return isHideMcInfo;
    }

    public void setIsHideMcInfo(Boolean isHideMcInfo) {
        this.isHideMcInfo = isHideMcInfo;
    }

    public Boolean getIsReadOnly() {
        return isReadOnly;
    }

    public void setIsReadOnly(Boolean isReadOnly) {
        this.isReadOnly = isReadOnly;
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Boolean getIsHideVendorContact() {
        return isHideVendorContact;
    }

    public void setIsHideVendorContact(Boolean isHideVendorContact) {
        this.isHideVendorContact = isHideVendorContact;
    }

    public Boolean getIsNewShopifyProduct() {
        return isNewShopifyProduct;
    }

    public void setIsNewShopifyProduct(Boolean isNewShopifyProduct) {
        this.isNewShopifyProduct = isNewShopifyProduct;
    }

    public String getProductApproval() {
        return productApproval;
    }

    public void setProductApproval(String productApproval) {
        this.productApproval = productApproval;
    }

    public Boolean getIsRequiredPermission() {
        return isRequiredPermission;
    }

    public void setIsRequiredPermission(Boolean isRequiredPermission) {
        this.isRequiredPermission = isRequiredPermission;
    }

    public Boolean getIsProductSync() {
        return isProductSync;
    }

    public void setIsProductSync(Boolean isProductSync) {
        this.isProductSync = isProductSync;
    }

    public Boolean getIsCarrierService() {
        return isCarrierService;
    }

    public void setIsCarrierService(Boolean isCarrierService) {
        this.isCarrierService = isCarrierService;
    }

    public Boolean getIsInactive() {
        return isInactive;
    }

    public void setIsInactive(Boolean isInactive) {
        this.isInactive = isInactive;
    }

    public String getSetupProgress() {
        return setupProgress;
    }

    public void setSetupProgress(String setupProgress) {
        this.setupProgress = setupProgress;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMoneyFormat() {
        return moneyFormat;
    }

    public void setMoneyFormat(String moneyFormat) {
        this.moneyFormat = moneyFormat;
    }

    public Boolean getPayment() {
        return payment;
    }

    public void setPayment(Boolean payment) {
        this.payment = payment;
    }

    public Object getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Object phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPinCode() {
        return pinCode;
    }

    public void setPinCode(String pinCode) {
        this.pinCode = pinCode;
    }

    public String getShop() {
        return shop;
    }

    public void setShop(String shop) {
        this.shop = shop;
    }

    public String getShopifyAccessToken() {
        return shopifyAccessToken;
    }

    public void setShopifyAccessToken(String shopifyAccessToken) {
        this.shopifyAccessToken = shopifyAccessToken;
    }

    public String getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(String userLevel) {
        this.userLevel = userLevel;
    }

    public String getPlanId() {
        return planId;
    }

    public void setPlanId(String planId) {
        this.planId = planId;
    }

    public List<Object> getVolume() {
        return volume;
    }

    public void setVolume(List<Object> volume) {
        this.volume = volume;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Integer getV() {
        return v;
    }

    public void setV(Integer v) {
        this.v = v;
    }

    public Integer getCommission() {
        return commission;
    }

    public void setCommission(Integer commission) {
        this.commission = commission;
    }

    public String getCommissionType() {
        return commissionType;
    }

    public void setCommissionType(String commissionType) {
        this.commissionType = commissionType;
    }

    public Boolean getIsReturn() {
        return isReturn;
    }

    public void setIsReturn(Boolean isReturn) {
        this.isReturn = isReturn;
    }

    public Integer getReturnPeriod() {
        return returnPeriod;
    }

    public void setReturnPeriod(Integer returnPeriod) {
        this.returnPeriod = returnPeriod;
    }

    public String getChargeId() {
        return chargeId;
    }

    public void setChargeId(String chargeId) {
        this.chargeId = chargeId;
    }

    public AdditionalStoreInfo getAdditionalStoreInfo() {
        return additionalStoreInfo;
    }

    public void setAdditionalStoreInfo(AdditionalStoreInfo additionalStoreInfo) {
        this.additionalStoreInfo = additionalStoreInfo;
    }

    public String getEmailSign() {
        return emailSign;
    }

    public void setEmailSign(String emailSign) {
        this.emailSign = emailSign;
    }

    public String getFooterText() {
        return footerText;
    }

    public void setFooterText(String footerText) {
        this.footerText = footerText;
    }

    public String getLoginText() {
        return loginText;
    }

    public void setLoginText(String loginText) {
        this.loginText = loginText;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

}
