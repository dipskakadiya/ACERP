/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Cash;

import Bean.Cash.CashBean;
import Utilites.UserService;
import java.util.List;

/**
 *
 * @author sai
 */
public class CashService {

    UserService objsql;

    public CashService(String file,String id) throws Exception {
        objsql = new UserService(file,id);
    }

    public Integer Save(CashBean objBean, Integer f) throws Exception {
        if (f == 1) {
            objsql.update("update Cash_Trade set Bill_No=" + objBean.getSr_Bill_No() + ",Tr_Type='" + objBean.getT_Type() + "',Entry_Date=TO_DATE('" + objBean.getEntry_Date() + "','YYYY-MM-DD'),Ac_id=" + objBean.getAccount_No() + ",Total_Amount=" + objBean.getTotal_Amount() + ",Bill_Remark='" + objBean.getBill_Remarks() + "' where tr_id=" + objBean.getTr_id());
            objsql.update("delete from BILL_WISE_PAYMENT where tr_id=" + objBean.getTr_id());
            objsql.persist("insert into BILL_WISE_PAYMENT (Tr_id,BILL_NO,Bill_Date,TOTAL_AMOUNT,TRASH) values (" + objBean.getTr_id() + "," + objBean.getSr_Bill_No() + ",TO_DATE('" + objBean.getEntry_Date() + "','YYYY-MM-DD')," + objBean.getTotal_Amount() + ",0)");
            objsql.update("delete from CURRENCY where tr_id=" + objBean.getTr_id());
            objsql.persist("insert into CURRENCY(tr_id,Bill_No,Bill_Date,C1000,C500,C100,C50,C20,C10,trash) values(" + objBean.getTr_id() + "," + objBean.getSr_Bill_No() + ",TO_DATE('" + objBean.getEntry_Date() + "','YYYY-MM-DD')," + objBean.getC_1000() + "," + objBean.getC_500() + "," + objBean.getC_100() + "," + objBean.getC_50() + "," + objBean.getC_20() + "," + objBean.getC_10() + ",0)");
       return null;
        } else {
            Integer tr_No = objsql.get_int("Select TR_NO from TR_NO");
            objsql.persist("insert into Cash_Trade (tr_id,Tr_Type,cash_id,Entry_Date,Bill_No,Ac_id,Total_Amount,Bill_Remark,trash) values(" + tr_No + ",'" + objBean.getT_Type() + "'," + objBean.getCash_id() + ",TO_DATE('" + objBean.getEntry_Date() + "','YYYY-MM-DD')," + objBean.getSr_Bill_No() + "," + objBean.getAccount_No() + "," + objBean.getTotal_Amount() + ",'" + objBean.getBill_Remarks() + "',0)");
            objsql.persist("insert into BILL_WISE_PAYMENT (Tr_id,BILL_NO,Bill_Date,TOTAL_AMOUNT,TRASH) values (" + tr_No + "," + objBean.getSr_Bill_No() + ",TO_DATE('" + objBean.getEntry_Date() + "','YYYY-MM-DD')," + objBean.getTotal_Amount() + ",0)");
            objsql.persist("insert into CURRENCY(tr_id,Bill_No,Bill_Date,C1000,C500,C100,C50,C20,C10,trash) values(" + tr_No + "," + objBean.getSr_Bill_No() + ",TO_DATE('" + objBean.getEntry_Date() + "','YYYY-MM-DD')," + objBean.getC_1000() + "," + objBean.getC_500() + "," + objBean.getC_100() + "," + objBean.getC_50() + "," + objBean.getC_20() + "," + objBean.getC_10() + ",0)");
            tr_No += 1;
            objsql.update("update TR_NO set tr_no=" + tr_No);
            return tr_No-1;
        }
    }

    public List get_data() throws Exception {
        return objsql.getLists("select * from Cash_trade where trash=0");
    }

    public List get_data1() throws Exception {
        return objsql.getLists("select * from currency");
    }

    public List get_ACash() throws Exception {
        return objsql.getLists("select Ac_id,Ac_name from Ac_master where trash=0 and Head_id=1");
    }

    public void delete(Integer id) throws Exception {
        objsql.update("update Cash_trade set trash=1 where tr_id=" + id);
        objsql.update("update BILL_WISE_PAYMENT set trash=1 where tr_id=" + id);
    }

    public List export() throws Exception {
        return objsql.getLists("select a.TR_TYPE,a.ENTRY_DATE,a.BILL_NO,b.Ac_name,a.TOTAL_AMOUNT from Cash_trade a,ac_master b where a.ac_id=b.Ac_id and a.trash=0");

    }
}
