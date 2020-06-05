
package net.mc.tools.models.fetchListOfProducts.fetchListOfProductsResponse;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class FetchListOfProductsResponseModel {

    @SerializedName("count")
    @Expose
    private Integer count;
    @SerializedName("products")
    @Expose
    private List<Product> products = null;
    @SerializedName("status")
    @Expose
    private String status;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
