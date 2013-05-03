/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Request;

import Utilites.AdminService;
import java.util.List;

/**
 *
 * @author KRISHNA
 */
public class RequestService {

    AdminService objsql;

    public RequestService(String file) throws Exception {
        objsql = new AdminService(file);
    }
    public List get_data() throws Exception {
        return objsql.getLists("select * from Contact_Us");
    }
}
