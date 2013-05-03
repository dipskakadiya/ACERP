/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.BlogDisplay;

import Utilites.AdminService;
import java.util.List;

public class BlogDisplayService {

    AdminService objadmin;

    public BlogDisplayService(String file) throws Exception {
        objadmin = new AdminService(file);

    }
    public List Display() throws Exception {
        return objadmin.getLists("select * from BLOG_MASTER order by Blog_Date desc");
    }
}
