/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.Register;

public class RegisterBean {

    private String User_Name;
    private String Password;
    private String Email_Id;
    private Double Contect_No;

    public Double getContect_No() {
        return Contect_No;
    }

    public void setContect_No(Double Contect_No) {
        this.Contect_No = Contect_No;
    }

    public String getEmail_Id() {
        return Email_Id;
    }

    public void setEmail_Id(String Email_Id) {
        this.Email_Id = Email_Id;
    }

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
}
