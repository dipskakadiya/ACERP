/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Login;

import Bean.Login.LoginBean;
import Utilites.AdminService;
import java.util.List;

/**
 *
 * @author sai
 */
public class LoginService {

    AdminService objsql;

    public LoginService(String file) throws Exception {
        objsql = new AdminService(file);
    }

    public List IsLogin(LoginBean objbean) throws Exception {
        List lt = null;
        Integer flag;
        if (objbean.getUser_Type().equals("Admin") || objbean.getUser_Type().equals("Super Admin")) {
            /* Check user id for Admin */
            lt = objsql.getLists("select * from Admin_login where ADMIN_ID='" + objbean.getUsername() + "'");
            flag = lt.size();
            if (flag > 0) {
                /* Check password for Admin */
                lt = objsql.getLists("select a.*,b.IMAGE,c.COM_NAME,trunc((a.START_DATE+a.DAYS)-SYSDATE) dt from Admin_login a,Admin_Detail b,COMPANY_DETAIL c where a.ADMIN_ID='" + objbean.getUsername() + "' AND a.PASSWORD='" + objbean.getPassword() + "' and a.USER_COUNT=b.USER_COUNT and a.USER_COUNT=c.ADMIN_ID");
            }
        } else {
            /* Check user id for user */
            lt = objsql.getLists("select * from user_login where user_ID='" + objbean.getUsername() + "'");
            flag = lt.size();
            if (flag > 0) {
                /* Check password for user */
                lt = objsql.getLists("select a.*,b.IMAGE,c.COM_NAME,d.ADMIN_ID Admin_name from user_login a,USR_DETAIL b,COMPANY_DETAIL c,ADMIN_LOGIN d where a.user_ID='" + objbean.getUsername() + "' AND a.PASSWORD='" + objbean.getPassword() + "' and a.USER_COUNT=b.USER_COUNT and a.ADMIN_ID=c.ADMIN_ID and a.ADMIN_ID=d.USER_COUNT");
            }
        }
        return lt;
    }

    public Integer Isblock(LoginBean objbean) throws Exception {
        Integer lt = null;
        if (objbean.getUser_Type().equals("Admin") || objbean.getUser_Type().equals("Super Admin")) {
            /* Check Admin is block/unblock */
            lt = objsql.get_int("select block_unblock from Admin_login where ADMIN_ID='" + objbean.getUsername() + "' AND PASSWORD='" + objbean.getPassword() + "'");
        } else {
            /* Check user is block/unblock */
            lt = objsql.get_int("select block_unblock from user_login where user_ID='" + objbean.getUsername() + "' AND PASSWORD='" + objbean.getPassword() + "'");
        }
        return lt;
    }

    public void flagupdate(LoginBean objbean) throws Exception {
        if (objbean.getUser_Type().equals("Admin") || objbean.getUser_Type().equals("Super Admin")) {
            /* Check Admin is block/unblock */
            objsql.update("update Admin_login set LOGIN_FLAG=1 where ADMIN_ID='" + objbean.getUsername() + "' AND PASSWORD='" + objbean.getPassword() + "'");
        } else {
            /* Check user is block/unblock */
           // objsql.update("update user_login set LOGIN_FLAG=1 where ADMIN_ID='" + objbean.getUsername() + "' AND PASSWORD='" + objbean.getPassword() + "'");
        }
    }
    
    
    public void Logout(Object Ucount, Object Utype) throws Exception {
        if (Utype.equals("S_Admin") == true || Utype.equals("Admin") == true) {
            objsql.update("update ADMIN_LOGIN set LOGIN_FLAG=0 where USER_COUNT="+Ucount);
        } 
    }

}
