package net.mc.tools.models.loginAsUserProxyAccessLogin.loginAsUserProxyAccessLoginRequest;

public class LoginAsUserProxyAccessLoginRequestModel
{
    private Boolean onlyRead;

    private String id;

    private String userRole;

    public Boolean getOnlyRead ()
    {
        return onlyRead;
    }

    public void setOnlyRead (Boolean onlyRead)
    {
        this.onlyRead = onlyRead;
    }

    public String getId ()
    {
        return id;
    }

    public void setId (String id)
    {
        this.id = id;
    }

    public String getUserRole ()
    {
        return userRole;
    }

    public void setUserRole (String userRole)
    {
        this.userRole = userRole;
    }
}
