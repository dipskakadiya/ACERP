/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.Setting;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author KRISHNA
 */
public class SettingBean {

    private String B_Path;
    private String R_Path;
    private String Add_Bank;
    private String Add_Tax;
    private Integer Bank_id;
    private Integer Tax_id;
    private Integer MAc_Head;
    private String Ac_Head;
    private Integer Head_id;
    private String Btype;
    MultipartFile r_file;

    public String getAc_Head() {
        return Ac_Head;
    }

    public MultipartFile getR_file() {
        return r_file;
    }

    public void setR_file(MultipartFile r_file) {
        this.r_file = r_file;
    }

    public void setAc_Head(String Ac_Head) {
        this.Ac_Head = Ac_Head;
    }

    public String getBtype() {
        return Btype;
    }

    public void setBtype(String Btype) {
        this.Btype = Btype;
    }

    public Integer getHead_id() {
        return Head_id;
    }

    public void setHead_id(Integer Head_id) {
        this.Head_id = Head_id;
    }

    public Integer getMAc_Head() {
        return MAc_Head;
    }

    public void setMAc_Head(Integer MAc_Head) {
        this.MAc_Head = MAc_Head;
    }

    public String getAdd_Bank() {
        return Add_Bank;
    }

    public void setAdd_Bank(String Add_Bank) {
        this.Add_Bank = Add_Bank;
    }

    public String getAdd_Tax() {
        return Add_Tax;
    }

    public void setAdd_Tax(String Add_Tax) {
        this.Add_Tax = Add_Tax;
    }

    public String getB_Path() {
        return B_Path;
    }

    public void setB_Path(String B_Path) {
        this.B_Path = B_Path;
    }

    public Integer getBank_id() {
        return Bank_id;
    }

    public void setBank_id(Integer Bank_id) {
        this.Bank_id = Bank_id;
    }

    public String getR_Path() {
        return R_Path;
    }

    public void setR_Path(String R_Path) {
        this.R_Path = R_Path;
    }

    public Integer getTax_id() {
        return Tax_id;
    }

    public void setTax_id(Integer Tax_id) {
        this.Tax_id = Tax_id;
    }
}
