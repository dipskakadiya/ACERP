/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Chang_Password;

import Bean.Chang_Password.Chang_PasswordBean;
import Utilites.AdminService;
import java.util.List;

/**
 *
 * @author KRISHNA
 */
public class Chang_PasswordService {

    AdminService objsql;

    public Chang_PasswordService(String file) throws Exception {
        objsql = new AdminService(file);
    }

    public List Save(Chang_PasswordBean objbean, Object u_id, Object type, Object pwd) throws Exception {
        List lt = null;
        if (type.toString().equals("S_Admin") || type.toString().equals("Admin")) {
            lt = objsql.getLists("select * from Admin_Login where Admin_id='" + u_id + "' AND Password='" + pwd + "'");
            if (lt.size() > 0) {
                objsql.update("update admin_login set Password='" + objbean.getNew_Password() + "' where Admin_id='" + u_id + "'");
            }
        } else if (type.toString().equals("User")) {
            lt = objsql.getLists("select * from User_Login where User_id='" + u_id + "' AND Password='" + pwd + "'");
            if (lt.size() > 0) {
                objsql.update("update User_login set Password='" + objbean.getNew_Password() + "' where User_id='" + u_id + "'");
            }
        }
        return lt;
}

}
