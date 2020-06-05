package net.mc.tools.models.change_Password.request;

public class ChangePasswordRequest
{
    private String password;

    private String newPassword;

    private String token;

    public String getPassword ()
    {
        return password;
    }

    public void setPassword (String password)
    {
        this.password = password;
    }

    public String getNewPassword ()
    {
        return newPassword;
    }

    public void setNewPassword (String newPassword)
    {
        this.newPassword = newPassword;
    }

    public String getToken ()
    {
        return token;
    }

    public void setToken (String token)
    {
        this.token = token;
    }

}
