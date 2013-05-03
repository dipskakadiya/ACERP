/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.common;

import Utilites.AdminService;
import Utilites.UserService;
import java.util.List;

/**
 *
 * @author sai
 */
public class common {

    AdminService objsql;
    UserService objsqlUser;

    public common(String file,String id) throws Exception {
        objsql = new AdminService(file);
        objsqlUser = new UserService(file,id);
    }

    public List get_Ac() throws Exception {
        return objsqlUser.getLists("select Ac_id,Ac_Name from Ac_Master where trash=0");
    }

    public List get_AcTrade() throws Exception {
        return objsqlUser.getLists("select Ac_id,Ac_Name from Ac_Master where trash=0 and head_id in(3,4)");
    }

    public List get_msg(Object user_id) throws Exception {
        return objsql.getLists("select * from send_mail where user_id='" + user_id + "' order by read,mail_id desc");
    }
    
    public List get_notify() throws Exception {
        return objsqlUser.getLists("select distinct to_chAR(N_DATE,'DD/MM/YY') n_date,MESSAGE,read from NOTIFICATION order by read,N_date desc");
    }
    
     public List get_Adnotify() throws Exception {
        return objsql.getLists("select distinct to_chAR(N_DATE,'DD/MM/YY') n_date,MESSAGE,read from NOTIFICATION order by read,N_date desc");
    }

    public List get_per(Object user_id) throws Exception {
        return objsql.getLists("select * from USER_PER where USER_ID=" + user_id + " order by MODUAL");
    }

    public void delete(Integer id) throws Exception {
        objsql.update("delete from send_mail where mail_id=" + id);
    }

    public void Msg_Read() throws Exception {
        objsql.update("update send_mail set READ=1");
    }
    
    public void Ntf_Read() throws Exception {
        objsqlUser.update("update notification set READ=1");
    }

    public void Payment(String User, String Amount) throws Exception {
        Integer id = objsql.get_int("select USER_COUNT from  ADMIN_LOGIN where ADMIN_ID='" + User + "'");
        Integer p_id = objsql.get_int("select max(PAYMENT_ID) from PAYMENT");
        p_id += 1;
        String type;
        Integer day;
        if (Amount.equals("200") == true) {
            type = "Plan A";
            day = 365;
        } else if (Amount.equals("110") == true) {
            type = "Plan B";
            day = 183;
        } else {
            type = "Plan C";
            day = 30;
        }
        objsql.persist("insert into PAYMENT values(" + p_id + "," + id + ",SYSDATE,'" + type + "'," + Amount + ")");
        objsql.update("update ADMIN_LOGIN set DAYS=trunc(((START_DATE+DAYS)-SYSDATE)+" + day + "+1),START_DATE=SYSDATE,demo=1  where USER_COUNT="+id);
    }
}
