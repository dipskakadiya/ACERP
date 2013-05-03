/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean.Login;

/**
 *
 * @author sai
 */
public class LoginBean {
private String User_Type;
private String Username;
private String Password;
private String Remember;

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getRemember() {
        return Remember;
    }

    public void setRemember(String Remember) {
        this.Remember = Remember;
    }

    public String getUser_Type() {
        return User_Type;
    }

    public void setUser_Type(String User_Type) {
        this.User_Type = User_Type;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }
}
