
package net.mc.tools.models.fetchListOfProducts.fetchListOfProductsResponse;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class MarkUp {

    @SerializedName("price")
    @Expose
    private Integer price;
    @SerializedName("type")
    @Expose
    private String type;

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
