/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Blog;

import Bean.Blog.BlogBean;
import Utilites.AdminService;


public class BlogService {

    AdminService objadmin;

    public BlogService(String file) throws Exception {
        objadmin = new AdminService(file);
    }

    public void Save(BlogBean objbean, Object Admin_Id) throws Exception {
        Integer bi=objadmin.get_int("select max(BLOG_ID) from BLOG_MASTER");
        bi+=1;
        objadmin.persist("insert into BLOG_MASTER (BLOG_ID,Blog_Date,Blog_Subject,Image,blog,Bloger)values("+bi+",SYSDATE,'" + objbean.getSubject() + "','" + objbean.getImage() + "','" + objbean.getMessage() + "','" + Admin_Id + "')");
    }
}
