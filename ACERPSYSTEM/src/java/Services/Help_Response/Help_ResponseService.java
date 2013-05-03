/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Help_Response;

import Utilites.AdminService;
import java.util.List;

/**
 *
 * @author sai
 */
public class Help_ResponseService {

    AdminService objsql;

    public Help_ResponseService(String file) throws Exception {
        objsql = new AdminService(file);
    }

   public List get_data() throws Exception {
        return objsql.getLists("select * from Req_Help where read=0");
    }
}
