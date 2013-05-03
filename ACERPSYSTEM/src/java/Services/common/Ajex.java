/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.common;

import Utilites.AdminService;
import Utilites.UserService;
import java.util.HashMap;
import java.util.List;
import javax.management.Query;

/**
 *
 * @author sai
 */
public class Ajex {

    UserService objsql;
    AdminService objAdmin;

    public Ajex(String file,String id) throws Exception {
        objsql = new UserService(file,id);
        objAdmin = new AdminService(file);
    }

    public List get_Contry() throws Exception {
        return objsql.getLists("select * from COUNTRY");
    }

    public List get_State() throws Exception {
        return objsql.getLists("select S_name,C_name from State a,Country b where a.C_id=b.c_id");
    }

    public List get_City() throws Exception {
        return objsql.getLists("select Ci_name,S_name from City a,State b where a.S_id=b.S_id");
    }

    public List get_Bill(Integer AC_ID, String TTrade) throws Exception {
        return objsql.getLists("SELECT BILL_NO,GETbILL(bILL_NO) as Amount FROM TRADE_MASTER WHERE TRASH=0 AND aC_ID=" + AC_ID + "and BOOK_NAME in (" + TTrade + ")");
    }

    public List get_PBank(Integer Ac_id) throws Exception {
        return objsql.getLists("select b.bank_id,b.BANK_NAME from USER_BANK a,bank_master b where a.trash=0 and a.bank_id=b.bank_id and a.Ac_id=" + Ac_id);
    }

    public List get_Item(Integer Ctg_id) throws Exception {
        String query = "DECLARE BEGIN DELETE FROM ITEM_STOCK; OPITEM; TRITEM; END;";
        objsql.persist(query);
        return objsql.getLists("select A.Item_id,A.Item_name,A.SALES_RATE,A.PIMAGE,FNIMSTOCK(A.ITEM_ID) STOCK,(select sum(B.tax_per) from ITEM_TAX B where B.ITEM_ID=A.ITEM_ID) TAX from Item_master A where A.trash=0 and A.Ctg_Id=" + Ctg_id);
    }

    public List get_AcAmount(Integer Ac_id) throws Exception {
        String query = "DECLARE BEGIN DELETE FROM LEDGER; LEDGERAC; LEDGERBK; LEDGERTR; LEDGERCS; LEDGERJV; END;";
        objsql.persist(query);
        return objsql.getLists("select FNLDGAMT(" + Ac_id + ") as AcAmount,limit from Ac_master where Ac_ID=" + Ac_id);
    }

    public List get_Ac() throws Exception {
        return objsql.getLists("select Ac_id,Ac_Name from Ac_master where trash=0");
    }

    public List get_AcHead() throws Exception {
        return objsql.getLists("select Head_id,Ac_Name from Ac_Head");
    }

    public List get_ctgitem() throws Exception {
        return objsql.getLists("select ctg_id,ctg_name from item_ctg");
    }

    public List get_Allitem() throws Exception {
        return objsql.getLists("select item_id, item_name from item_master");
    }

    public List get_Ac_Tarde(Integer HID) throws Exception {
        return objsql.getLists("select Ac_id,Ac_Name from Ac_master where trash=0 and HEAD_ID=" + HID);
    }

    public List get_Ac_BCTarde() throws Exception {
        return objsql.getLists("select Ac_id,Ac_Name from Ac_master where trash=0 and HEAD_ID not in(1,2)");
    }

    public List get_UserName(String uname) throws Exception {
        return objAdmin.getLists("select ADMIN_ID Name from ADMIN_LOGIN where ADMIN_ID='" + uname + "'");
    }

    public List get_ItemAll() throws Exception {
        return objsql.getLists("select item_id,item_name,pimage from item_master");
    }
    
    public List get_itag() throws Exception {
        return objsql.getLists("select a.*,b.item_name from ITEM_TAG a, item_master b where a.text=b.item_id");
    }

    public Integer Save_itag(String height, String width, String top, String left, String id, String text) throws Exception {
        Integer pid = null;
        if (id.equals("new")) {
            pid = objsql.get_int("select max(id) from ITEM_TAG");
            pid += 1;
            objsql.persist("insert into ITEM_TAG values(" + pid + "," + text + "," + top + "," + left + "," + height + "," + width + ")");
        }else
        {
            objsql.update("update ITEM_TAG set TEXT="+text+",TOP="+top+",LEFT="+left+",HEIGHT="+height+",WIDTH="+width+" where id="+id);
            pid=Integer.parseInt(id);
        }
        return pid;
    }
    
    public void Delete_itag(String id) throws Exception {
        objsql.update("delete from ITEM_TAG where id="+id);
    }
}
