/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Block;

import Utilites.AdminService;
import java.util.List;

/**
 *
 * @author sai
 */
public class BlockService {

    AdminService objsql;

    public BlockService(String file) throws Exception {
        objsql = new AdminService(file);
    }

    public void Block(Integer id) throws Exception {
        Integer fblock = objsql.get_int("select block_unblock from Admin_login where user_count=" + id);
        if (fblock == 0) {
            /* if block the unblock*/
            fblock = 1;
        } else {
            /* if unblock the block*/
            fblock = 0;
        }
        /* change flag in database */
        objsql.persist("update Admin_Login set Block_unblock=" + fblock + " where user_count=" + id);
        objsql.persist("update user_Login set Block_unblock=" + fblock + " where Admin_id=" + id);
    }

    public List get_data() throws Exception {
        return objsql.getLists("select * from Admin_Login a, Admin_detail b where a.USER_COUNT=b.USER_COUNT and a.USER_TYPE='Admin' ");
    }
    
    public void Drop(String u_id) throws Exception {
        objsql.persist("DROP USER "+u_id+" CASCADE");
        objsql.update("delete from Admin_login where ADMIN_ID='"+u_id+"' ");
    }
}
