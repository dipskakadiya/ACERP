/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.All_Company;
import Utilites.AdminService;
import java.util.List;

/**
 *
 * @author sai
 */
public class All_CompanyService {

    AdminService objsql;

    public All_CompanyService(String file) throws Exception {
        objsql = new AdminService(file);
    }

    public List get_data() throws Exception {
        return objsql.getLists("select * from Company_Detail");
    }
}
