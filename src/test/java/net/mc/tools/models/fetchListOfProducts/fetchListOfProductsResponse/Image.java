
package net.mc.tools.models.fetchListOfProducts.fetchListOfProductsResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Image {

    @SerializedName("url")
    @Expose
    private String url;
    @SerializedName("imageUrl")
    @Expose
    private String imageUrl;
    @SerializedName("position")
    @Expose
    private Integer position;
    @SerializedName("shopifyImageId")
    @Expose
    private Long shopifyImageId;
    @SerializedName("imageId")
    @Expose
    private Object imageId;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Long getShopifyImageId() {
        return shopifyImageId;
    }

    public void setShopifyImageId(Long shopifyImageId)
    {
        this.shopifyImageId = shopifyImageId;
    }

    public Object getImageId() {
        return imageId;
    }

    public void setImageId(Object imageId) {
        this.imageId = imageId;
    }

}
