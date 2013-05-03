/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Help;

import Bean.Help.HelpBean;
import Utilites.AdminService;

/**
 *
 * @author KRISHNA
 */
public class HelpService {

    AdminService objsql;

    public HelpService(String file) throws Exception {
        objsql = new AdminService(file);
    }

    public void Send(HelpBean objbean, Object user_id) throws Exception {
        Integer rid = objsql.get_int("select max(REQ_ID) from REQ_HELP");
        rid += 1;
        objsql.persist("insert into req_help(REQ_ID,user_id,req_date,question,read)values("+rid+",'" + user_id + "',SYSDATE,'" + objbean.getQuestion() + "',0) ");
    }
}
