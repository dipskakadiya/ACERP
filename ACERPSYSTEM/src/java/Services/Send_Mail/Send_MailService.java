/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Send_Mail;

import Bean.Send_Mail.Send_MailBean;
import Utilites.AdminService;
import java.util.List;

/**
 *
 * @author KRISHNA
 */
public class Send_MailService {

    AdminService objsql;

    public Send_MailService(String file) throws Exception {
        objsql = new AdminService(file);
    }

    public void Send(Send_MailBean objbean, Object Admin_id,Object User_type) throws Exception {
        String j[] = objbean.getUser_Name();
        for (int i = 0; i < j.length; i++) {
            Integer mid = objsql.get_int("select max(MAIL_ID) from SEND_MAIL");
            mid += 1;
            objsql.persist("insert into send_mail(MAIL_ID,User_id,Mail_Date,sender,Subject,Message,read) values(" + mid + ",'" + j[0] + "',SYSDATE,'" + Admin_id + "','" + objbean.getSubject() + "','" + objbean.getMessage() + "',0)");
        }
    }

    public void SendEmail(Send_MailBean objbean) throws Exception {
        objsql.sendmail(objbean.getEmail_id(),objbean.getSubject() ,objbean.getMessage());
    }
    public List get_data() throws Exception {
        return objsql.getLists("select * from REQ_HELP where read=0");
    }

    public List get_Contect() throws Exception {
        return objsql.getLists("select * from Contact_Us");
    }

    public List get_MR(Object UT, Object UI) throws Exception {
        String str = "\"";
        if (UT.equals("S_Admin") == true) {
            return objsql.getLists("select ADMIN_ID " + str + "user" + str + " from ADMIN_LOGIN where ADMIN_ID not in ('" + UI + "')");
        } else {
            return objsql.getLists("select USER_ID " + str + "user" + str + " from USER_LOGIN where USER_ID not in ('" + UI + "')");
        }
    }

    public List get_Admin(Object ui) throws Exception {
        Integer Ai = objsql.get_int("select ADMIN_ID from USER_LOGIN where USER_ID='" + ui + "'");
        return objsql.getLists("select ADMIN_ID from ADMIN_LOGIN where USER_COUNT=" + Ai);
    }
}
