/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Bank;

import Bean.Bank.BankBean;
import Utilites.UserService;
import java.util.List;

/**
 *
 * @author KRISHNA
 */
public class BankService {

    UserService objsql;

    public BankService(String file, String id) throws Exception {
        objsql = new UserService(file, id);
    }

    public Integer Save(BankBean objbean, Integer f) throws Exception {
        if (f == 1) {
            objsql.update("update bank_Trade set Bill_No='" + objbean.getSr_Bill_No() + "',TR_TYPE='" + objbean.getT_Type() + "',BANK_name=" + objbean.getBank_Name() + ",ENTRY_DATE=TO_DATE('" + objbean.getEntry_Date() + "','YYYY-MM-DD'),AC_ID=" + objbean.getAccount_No() + ",TOTAL_AMOUNT=" + objbean.getTotal_Amount() + ",BILL_REMARK='" + objbean.getBill_Remarks() + "',CHK_NO=" + objbean.getCheck_No() + ",CHK_DATE=TO_DATE('" + objbean.getCheck_Date() + "','YYYY-MM-DD'),PARTY_BANK_Name=" + objbean.getParty_Bank_No() + " where tr_id=" + objbean.getTr_id());
            objsql.update("delete from BILL_WISE_PAYMENT where tr_id=" + objbean.getTr_id());
            objsql.persist("insert into BILL_WISE_PAYMENT (Tr_id,BILL_NO,Bill_Date,TOTAL_AMOUNT,TRASH) values (" + objbean.getTr_id() + "," + objbean.getSr_Bill_No() + ",TO_DATE('" + objbean.getEntry_Date() + "','YYYY-MM-DD')," + objbean.getTotal_Amount() + ",0)");
            return 0;
        } else {
            Integer tr_No = objsql.get_int("Select TR_NO from TR_NO");
            objsql.persist("insert into bank_Trade(tr_id,TR_TYPE,BANK_Name,ENTRY_DATE,BILL_NO,AC_ID,TOTAL_AMOUNT,BILL_REMARK,CHK_NO,CHK_DATE,PARTY_BANK_NAME,trash)values(" + tr_No + ",'" + objbean.getT_Type() + "'," + objbean.getBank_Name() + ",TO_DATE('" + objbean.getEntry_Date() + "','YYYY-MM-DD'),'" + objbean.getSr_Bill_No() + "'," + objbean.getAccount_No() + "," + objbean.getTotal_Amount() + ",'" + objbean.getBill_Remarks() + "'," + objbean.getCheck_No() + ",TO_DATE('" + objbean.getCheck_Date() + "','YYYY-MM-DD')," + objbean.getParty_Bank_No() + ",0)");
            objsql.persist("insert into BILL_WISE_PAYMENT (Tr_id,BILL_NO,Bill_Date,TOTAL_AMOUNT,TRASH) values (" + tr_No + "," + objbean.getSr_Bill_No() + ",TO_DATE('" + objbean.getEntry_Date() + "','YYYY-MM-DD')," + objbean.getTotal_Amount() + ",0)");
            tr_No += 1;
            objsql.update("update TR_NO set tr_no=" + tr_No);
            return tr_No - 1;
        }

    }

    public List get_data() throws Exception {
        return objsql.getLists("select * from bank_Trade where trash=0");
    }

    public List get_ABank() throws Exception {
        return objsql.getLists("select Ac_id,Ac_name from Ac_master where trash=0 and Head_id=2");
    }

    public void delete(Integer id) throws Exception {
        objsql.update("update bank_trade set trash=1 where tr_id=" + id);
        objsql.update("update BILL_WISE_PAYMENT set trash=1 where tr_id=" + id);
    }

    public List export() throws Exception {
        return objsql.getLists("select a.TR_TYPE,a.ENTRY_DATE,a.BILL_NO,b.Ac_name,a.TOTAL_AMOUNT,a.CHK_NO,a.CHK_DATE,c.BANK_NAME from Bank_trade a,ac_master b,bank_master c where a.ac_id=b.Ac_id and a.PARTY_BANK_NAME=c.bank_id and a.Trash=0");

    }
}
