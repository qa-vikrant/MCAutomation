package net.mc.tools.models.createandRemoveAssociation.CreateandRemoveAssociationResponse;

public class CreateandRemoveAssociationErrorResponse
{
    private String data;

    private String status;

    private String error;

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getData ()
    {
        return data;
    }

    public void setData (String data)
    {
        this.data = data;
    }

    public String getStatus ()
    {
        return status;
    }

    public void setStatus (String status)
    {
        this.status = status;
    }

}
