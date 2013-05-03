/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.Contact;

/**
 *
 * @author KRISHNA
 */
public class ContactBean {

    private String Name;
    private String Company;
    private String Email;
    private Double Phone;
    private String Message;

    public String getCompany() {
        return Company;
    }

    public void setCompany(String Company) {
        this.Company = Company;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public Double getPhone() {
        return Phone;
    }

    public void setPhone(Double Phone) {
        this.Phone = Phone;
    }
}
