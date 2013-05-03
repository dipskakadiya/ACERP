/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.User_Detail;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author KRISHNA
 */
public class UserDetailBean {

    private Integer User_Count;
    private String F_Name;
    private String L_Name;
    private String Gender;
    private String DOB;
    private String Join_Date;
    private String R_Address;
    private Integer Pincode;
    private Double Contact_no;
    private String Contry;
    private String State;
    private String City;
    private String Email;
    private String Desig;
    private String Imagealt;
    MultipartFile Image;

    public String getImagealt() {
        return Imagealt;
    }

    public void setImagealt(String Imagealt) {
        this.Imagealt = Imagealt;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public Double getContact_no() {
        return Contact_no;
    }

    public void setContact_no(Double Contact_no) {
        this.Contact_no = Contact_no;
    }

    public String getContry() {
        return Contry;
    }

    public void setContry(String Contry) {
        this.Contry = Contry;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getDesig() {
        return Desig;
    }

    public void setDesig(String Desig) {
        this.Desig = Desig;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getF_Name() {
        return F_Name;
    }

    public void setF_Name(String F_Name) {
        this.F_Name = F_Name;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public MultipartFile getImage() {
        return Image;
    }

    public void setImage(MultipartFile Image) {
        this.Image = Image;
    }

    public String getJoin_Date() {
        return Join_Date;
    }

    public void setJoin_Date(String Join_Date) {
        this.Join_Date = Join_Date;
    }

    public String getL_Name() {
        return L_Name;
    }

    public void setL_Name(String L_Name) {
        this.L_Name = L_Name;
    }

    public Integer getPincode() {
        return Pincode;
    }

    public void setPincode(Integer Pincode) {
        this.Pincode = Pincode;
    }

    public String getR_Address() {
        return R_Address;
    }

    public void setR_Address(String R_Address) {
        this.R_Address = R_Address;
    }

    public String getState() {
        return State;
    }

    public void setState(String State) {
        this.State = State;
    }

    public Integer getUser_Count() {
        return User_Count;
    }

    public void setUser_Count(Integer User_Count) {
        this.User_Count = User_Count;
    }

}
