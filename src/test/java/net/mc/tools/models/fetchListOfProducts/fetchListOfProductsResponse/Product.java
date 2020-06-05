
package net.mc.tools.models.fetchListOfProducts.fetchListOfProductsResponse;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Product {

    @SerializedName("status")
    @Expose
    private String status;
    @SerializedName("approved")
    @Expose
    private Boolean approved;
    @SerializedName("_id")
    @Expose
    private String id;
    @SerializedName("productId")
    @Expose
    private String productId;
    @SerializedName("addedBy")
    @Expose
    private String addedBy;
    @SerializedName("createdAt")
    @Expose
    private String createdAt;
    @SerializedName("description")
    @Expose
    private String description;
    @SerializedName("handle")
    @Expose
    private String handle;
    @SerializedName("images")
    @Expose
    private List<Image> images = null;
    @SerializedName("primaryImageUrl")
    @Expose
    private String primaryImageUrl;
    @SerializedName("title")
    @Expose
    private String title;
    @SerializedName("updatedAt")
    @Expose
    private String updatedAt;
    @SerializedName("variants")
    @Expose
    private List<Variant> variants = null;
    @SerializedName("vendor")
    @Expose
    private String vendor;
    @SerializedName("vendorId")
    @Expose
    private String vendorId;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Boolean getApproved() {
        return approved;
    }

    public void setApproved(Boolean approved) {
        this.approved = approved;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getAddedBy() {
        return addedBy;
    }

    public void setAddedBy(String addedBy) {
        this.addedBy = addedBy;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public String getPrimaryImageUrl() {
        return primaryImageUrl;
    }

    public void setPrimaryImageUrl(String primaryImageUrl) {
        this.primaryImageUrl = primaryImageUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public List<Variant> getVariants() {
        return variants;
    }

    public void setVariants(List<Variant> variants) {
        this.variants = variants;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getVendorId() {
        return vendorId;
    }

    public void setVendorId(String vendorId) {
        this.vendorId = vendorId;
    }

}
