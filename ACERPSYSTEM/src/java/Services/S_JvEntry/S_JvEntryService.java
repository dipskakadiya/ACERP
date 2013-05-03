/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.S_JvEntry;

import java.util.List;
import Bean.S_JvEntry.S_JvEntryBean;
import Utilites.UserService;

/**
 *
 * @author Krishna
 */
public class S_JvEntryService {

    UserService objsql;

    public S_JvEntryService(String file,String id) throws Exception {
        objsql = new UserService(file,id);

    }

    public void Save(S_JvEntryBean objbean, Integer f) throws Exception {
        if (f == 1) {
            objsql.persist("update jventry_master set Entry_Date=TO_DATE('" + objbean.getEntry_Date() + "','YYYY-MM-DD'),Dr_Ac=" + objbean.getDebit_Ac() + ",Cr_Ac=" + objbean.getCredit_Ac() + ",Total_Amount=" + objbean.getTotal_Amount() + ",Dr_Desc='" + objbean.getDebit_Description() + "',Cr_Desc='" + objbean.getCredit_Description() + "' where Bill_No=" + objbean.getSr_Bill_No());
        } else {
            Integer tr_No = objsql.get_int("Select TR_NO from TR_NO");
            objsql.persist("insert into jventry_master(tr_id,Entry_Date,Bill_No,dr_ac,Cr_Ac,Total_Amount,Dr_Desc,Cr_Desc,trash)values(" + tr_No + ",TO_DATE('" + objbean.getEntry_Date() + "','YYYY-MM-DD')," + objbean.getSr_Bill_No() + "," + objbean.getDebit_Ac() + "," + objbean.getCredit_Ac() + "," + objbean.getTotal_Amount() + ",'" + objbean.getDebit_Description() + "','" + objbean.getCredit_Description() + "',0)");
            tr_No += 1;
            objsql.update("update TR_NO set tr_no=" + tr_No);
        }
    }

    public Integer get_Bno() throws Exception {
        return objsql.get_int("select max(BILL_NO) from JVENTRY_MASTER");
    }

    public List get_data() throws Exception {
        return objsql.getLists("select * from jventry_master where trash=0");
    }

    public void delete(Integer id) throws Exception {
        objsql.persist("update jventry_master set trash=1 where Bill_No=" + id);

    }
    
    public List export() throws Exception {
        return objsql.getLists("select B.BILL_NO,B.ENTRY_DATE,(select A.Ac_Name from Ac_Master A where A.Ac_id=B.DR_AC) DR_AC,(select A.Ac_Name from Ac_Master A where A.Ac_id=B.CR_AC) CR_AC,TOTAL_AMOUNT from JVENTRY_MASTER B where B.trash=0");
    }
}
