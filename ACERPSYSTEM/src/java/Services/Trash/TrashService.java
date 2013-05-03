/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Trash;

import Bean.Trash.TrashBean;
import Utilites.UserService;
import java.util.List;

/**
 *
 * @author sai
 */
public class TrashService {

    UserService objsql;

    public TrashService(String file,String id) throws Exception {
        objsql = new UserService(file,id);
    }

    public List get_data(String tbl_name) throws Exception {
        return objsql.getLists("select * from "+tbl_name+" where Trash=1");
    }

    public void Restore(TrashBean objBean,String tbl_name,String field) throws Exception {
        Integer p[];
        String per = "";
        if (objBean.getTrash() != null) {
            p = objBean.getTrash();
            for (int i = 0; i < p.length; i++) {
                per += p[i] + ",";
            }
            per = per.substring(0, per.length() - 1);
        }
        objsql.update("update "+tbl_name+" set trash=0 where "+field+" in ("+per+")");
    }

    public void Delete(TrashBean objBean,String tbl_name,String field) throws Exception {
        Integer p[];
        String per = "";
        if (objBean.getTrash() != null) {
            p = objBean.getTrash();
            for (int i = 0; i < p.length; i++) {
                per += p[i] + ",";
            }
            per = per.substring(0, per.length() - 1);
        }
        objsql.update("update "+tbl_name+" set trash=2 where "+field+" in ("+per+")");
    }
}
