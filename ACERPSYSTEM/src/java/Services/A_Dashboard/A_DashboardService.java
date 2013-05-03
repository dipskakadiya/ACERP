/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.A_Dashboard;

import Utilites.AdminService;
import java.util.List;

/**
 *
 * @author KRISHNA
 */
public class A_DashboardService {

    AdminService objsql;

    public A_DashboardService(String file) throws Exception {
        objsql = new AdminService(file);
    }

    public List get_dateLo() throws Exception {
        return objsql.getLists("select a.user_count,a.ADMIN_ID,b.IMAGE  from ADMIN_LOGIN a,ADMIN_Detail b where LOGIN_FLAG=1 and a.USER_COUNT=b.USER_COUNT and USER_TYPE='Admin'");
    }

    public List get_dateEx() throws Exception {
        return objsql.getLists("select User_Count,Admin_Id,Start_Date,trunc((START_DATE+DAYS)-SYSDATE) dt from Admin_Login where trunc((START_DATE+DAYS)-SYSDATE)<30 order by User_count ");
    }

    public List get_dateBlg() throws Exception {
        return objsql.getLists("select * from Blog_Master order by Blog_Date desc ");
    }

    public List Payment() throws Exception {
        return objsql.getLists("select floor(sum(AMOUNT))total,to_char( PAYMENT_DATE, 'MON' ) month from PAYMENT  group by to_char( PAYMENT_DATE, 'MON' )");
    }
}
