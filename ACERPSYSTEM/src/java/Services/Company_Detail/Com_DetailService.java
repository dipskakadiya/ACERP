/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Company_Detail;

import Bean.Company_Detail.Com_DetailBean;
import Utilites.AdminService;
import java.util.List;

/**
 *
 * @author KRISHNA
 */
public class Com_DetailService {

    AdminService objsql;

    public Com_DetailService(String file) throws Exception {
        objsql = new AdminService(file);
    }

    public List get_data(Object A_id) throws Exception {
       return objsql.getLists("select * from company_detail where ADMIN_ID="+A_id);
       //return null;
    }

    public void Save(Com_DetailBean objbean) throws Exception {
        objsql.persist("update company_detail set Com_Name='" + objbean.getCom_Name() + "',C_Address='" + objbean.getC_Address() + "',Area='" + objbean.getArea() + "',Pincode=" + objbean.getPincode() + ",C_name='" + objbean.getContry() + "',S_name='" + objbean.getState() + "',Ci_name='" + objbean.getCity() + "',Email_id='" + objbean.getCom_Email() + "',contact_No=" + objbean.getMobile_No() + ",Phone_No=" + objbean.getPhone_No() + ",Year_Start_Date=TO_DATE('"+objbean.getYear_Start_Date()+"','YYYY-MM-DD'),Year_End_Date=TO_DATE('"+objbean.getYear_End_Date()+"','YYYY-MM-DD') where com_id="+objbean.getCom_id());
    }
}
