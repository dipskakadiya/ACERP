/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean.User;

/**
 *
 * @author sai
 */
public class UserBean {
private String User_Name;
private String Password;
private Integer per[];
private Integer User_count;

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getUser_Name() {
        return User_Name;
    }

    public void setUser_Name(String User_Name) {
        this.User_Name = User_Name;
    }

    public Integer getUser_count() {
        return User_count;
    }

    public void setUser_count(Integer User_count) {
        this.User_count = User_count;
    }

    public Integer[] getPer() {
        return per;
    }

    public void setPer(Integer[] per) {
        this.per = per;
    }

}
