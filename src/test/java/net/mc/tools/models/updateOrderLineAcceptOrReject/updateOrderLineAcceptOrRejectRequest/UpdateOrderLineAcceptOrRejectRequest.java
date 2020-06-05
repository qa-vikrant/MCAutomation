package net.mc.tools.models.updateOrderLineAcceptOrReject.updateOrderLineAcceptOrRejectRequest;

public class UpdateOrderLineAcceptOrRejectRequest
{
    private String lineItemId;
    private String orderId;
    private Boolean isAccept;

    public Boolean getAccept() {
        return isAccept;
    }

    public String getLineItemId() {
        return lineItemId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setAccept(Boolean accept) {
        isAccept = accept;
    }

    public void setLineItemId(String lineItemId) {
        this.lineItemId = lineItemId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
}
