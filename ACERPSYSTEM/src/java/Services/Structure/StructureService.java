/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Structure;

import Utilites.AdminService;
import java.util.List;
/**
 *
 * @author sai
 */
public class StructureService {
  AdminService objsql;

    public StructureService(String file) throws Exception {
        objsql = new AdminService(file);
    }   
    
    public List get_Admin() throws Exception {
        return objsql.getLists("select A.*,(select Count(B.USER_COUNT) from User_login B where B.Admin_id=A.user_Count)UCount from Admin_login A where User_count!=1");
    }
    
     public List get_User() throws Exception {
        return objsql.getLists("select *  from User_LOGIN");
    }
}
