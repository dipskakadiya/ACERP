/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.Send_Mail;

/**
 *
 * @author KRISHNA
 */
public class Send_MailBean {

    private String Subject;
    private String Message;
    private String User_Name[];
    private String Email_id;

    public String getEmail_id() {
        return Email_id;
    }

    public void setEmail_id(String Email_id) {
        this.Email_id = Email_id;
    }
    
    public String[] getUser_Name() {
        return User_Name;
    }

    public void setUser_Name(String[] User_Name) {
        this.User_Name = User_Name;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String Subject) {
        this.Subject = Subject;
    }
}
