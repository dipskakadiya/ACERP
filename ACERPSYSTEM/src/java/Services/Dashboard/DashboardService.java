
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Dashboard;

import Utilites.UserService;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author sai
 */
public class DashboardService {

    UserService objsql;
    

    public DashboardService(String file,String id) throws Exception {
        objsql = new UserService(file,id);
    }

    public List Purchase_chart() throws Exception {
        return objsql.getLists("select floor(sum(TOTAL_AMOUNT))total,to_char( Bill_date, 'MON' ) Bill_date from trade_master where BOOK_NAME='Purchase Bill' group by to_char( Bill_date, 'MON' )");
    }

    public List Sales_chart() throws Exception {
        return objsql.getLists("select floor(sum(TOTAL_AMOUNT))total,to_char( Bill_date, 'MON' ) Bill_date from trade_master where BOOK_NAME='Sales Bill' group by to_char( Bill_date, 'MON' )");
    }

    public List Top_Ac() throws Exception {
        return objsql.getLists("select floor(sum(TOTAL_AMOUNT)) total,Ac_name  from top_Ac WHERE ROWNUM <= 5 group by ac_name ");
    }

    public List All_item() throws Exception {
        return objsql.getLists("select sum(qty) total, Item_name from item_Sales WHERE ROWNUM <= 5 group by item_name");
    }

    public void due_insert(Object Admin_id) throws Exception {
        List l, l2;
        l = objsql.getLists("SELECT * FROM trade_master where trunc(SYSDATE-bill_date)=due_days and bill_mode='Credit Bill' and trash=0");
        if (l != null) {
            HashMap h = null;
            HashMap h2 = null;
            for (Integer i = 0; i < l.size(); i++) {
                h = (HashMap) l.get(i);
                l2 = objsql.getLists("SELECT * FROM Ac_master where Ac_id=" + h.get("Ac_id") + " and trash=0");
                if (l2 != null) {
                    h2 = (HashMap) l2.get(0);
                    String message = h2.get("Ac_name") + " payment Due is over please recive payment Rs:-" + h.get("TOTAL_AMOUNT");
                     objsql.persist("insert into NOTIFICATION (N_ID,N_DATE,MESSAGE,READ) values(null,SYSDATE,'" + message + "',0)");
                    String msg = "Please+pay+your+due+payment+Rs:+" + h.get("TOTAL_AMOUNT") + "FROM:+Dipesh";
                    objsql.sendsms(h2.get("CONTECT_NO"), msg);
                   
                }
            }
        }
    }
}
