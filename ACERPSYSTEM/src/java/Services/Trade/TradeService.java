/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Trade;

import Bean.Trade.TradeBean;
import Utilites.UserService;
import java.util.List;

/**
 *
 * @author sai
 */
public class TradeService {

    UserService objsql;

    public TradeService(String file,String id) throws Exception {
        objsql = new UserService(file,id);
    }

    public Integer get_Bill_no() throws Exception {
        return objsql.get_int("select max(BILL_NO) from Trade_master");
    }

    public List get_TCtg() throws Exception {
        return objsql.getLists("select * from item_Ctg where trash=0");
    }

    public void Save(TradeBean objBean, Integer f) throws Exception {
        List lt;
        String T_Type = "";
        Integer tr_no1 = 0;
        String mygrid[] = objBean.getMygrid();
        if (f == 1) {
            objsql.update("update Trade_Master set Book_Name='" + objBean.getBook_No() + "',Ac_id=" + objBean.getAccount_No() + ",Bill_Date=TO_DATE('" + objBean.getBill_Date() + "','YYYY-MM-DD'),Party_Bill_Date=TO_DATE('" + objBean.getParty_Bill_Date() + "','YYYY-MM-DD'),Party_Bill_No=" + objBean.getParty_Sr_Bill_No() + ",Total_Qty=" + objBean.getTotal_Qty() + ",Total_Tax=" + objBean.getTotal_Tax_Amount() + ",Total_Gross=" + objBean.getTotal_Gross_Amount() + ",Bill_Remark='" + objBean.getBill_Remarks() + "',Total_Amount=" + objBean.getTotal_Bill_Amount() + ",Due_Days=" + objBean.getDue_Days() + ",Bill_Mode='" + objBean.getBill_Mode() + "',DISCOUNT=" + objBean.getDiscount() + " where Bill_No=" + objBean.getSr_Bill_No() + "");
            objsql.update("delete trade_detail where bill_no=" + objBean.getSr_Bill_No());
            for (int i = 0; i < mygrid.length; i = i + 6) {
                Integer i_code = Integer.parseInt(mygrid[i]);
                Double qty = Double.parseDouble(mygrid[i + 1]);
                Double rate = Double.parseDouble(mygrid[i + 2]);
                Double G_total = Double.parseDouble(mygrid[i + 3]);
                Double t_tax = Double.parseDouble(mygrid[i + 4]);
                Double total = Double.parseDouble(mygrid[i + 5]);
                objsql.persist("insert into TRADE_DETAIL (BILL_NO,ITEM_ID,QTY,RATE,G_TOTAL,T_TAX,TOTAL,TRASH,BOOK_NAME) values(" + objBean.getSr_Bill_No() + "," + i_code + "," + qty + "," + rate + "," + G_total + "," + t_tax + "," + total + ",0,'" + objBean.getBook_No() + "')");
            }
            tr_no1 = objsql.get_int("select tr_id from trade_master where bill_no=" + objBean.getSr_Bill_No());
            lt = objsql.getLists("select * from Currency where tr_id=" + tr_no1);
            if (lt != null) {
                objsql.update("delete from CURRENCY where tr_id=" + tr_no1);
                objsql.update("delete from cash_trade where bill_no='" + objBean.getSr_Bill_No() + "'");
                objsql.update("delete from BILL_WISE_PAYMENT where bill_no='" + objBean.getSr_Bill_No() + "'");
            }
            if (objBean.getBill_Mode().equals("Credit Bill") == false) {
                if (objBean.getBook_No().equals("Purchase Bill") == true || objBean.getBook_No().equals("Sales Return Bill") == true) {
                    T_Type = "Payment";
                } else {
                    T_Type = "Receipt";
                }
                Integer tr_No = objsql.get_int("Select TR_NO from TR_NO");
                objsql.persist("insert into CASH_TRADE (TR_ID,TR_TYPE,CASH_ID,ENTRY_DATE,BILL_NO,AC_ID,TOTAL_AMOUNT,BILL_REMARK,trash) values(" + tr_No + ",'" + T_Type + "',1,TO_DATE('" + objBean.getBill_Date() + "','YYYY-MM-DD')," + objBean.getSr_Bill_No() + "," + objBean.getAccount_No() + "," + objBean.getTotal_Bill_Amount() + ",'Cash Trade','0')");
                objsql.persist("insert into BILL_WISE_PAYMENT (TR_ID,BILL_NO,BILL_DATE,TOTAL_AMOUNT,TRASH) values(" + tr_No + "," + objBean.getSr_Bill_No() + ",TO_DATE('" + objBean.getBill_Date() + "','YYYY-MM-DD')," + objBean.getTotal_Bill_Amount() + ",0)");
                tr_No += 1;
                objsql.update("update TR_NO set tr_no=" + tr_No);
                objsql.persist("insert into CURRENCY(tr_id,Bill_No,Bill_Date,C1000,C500,C100,C50,C20,C10,trash) values(" + tr_no1 + "," + objBean.getSr_Bill_No() + ",TO_DATE('" + objBean.getBill_Date() + "','YYYY-MM-DD')," + objBean.getC_1000() + "," + objBean.getC_500() + "," + objBean.getC_100() + "," + objBean.getC_50() + "," + objBean.getC_20() + "," + objBean.getC_10() + ",0)");
            }
        } else {
            Integer tr_No = objsql.get_int("Select TR_NO from TR_NO");
            objsql.persist("insert into Trade_Master(tr_id,Book_Name,Ac_id,Bill_Date,Bill_No,Party_Bill_Date,Party_Bill_No,Total_Qty,DISCOUNT,Total_Tax,Total_Gross,Bill_Remark,Total_amount,Due_Days,Bill_Mode,trash) values(" + tr_No + ",'" + objBean.getBook_No() + "'," + objBean.getAccount_No() + ",TO_DATE('" + objBean.getBill_Date() + "','YYYY-MM-DD')," + objBean.getSr_Bill_No() + ",TO_DATE('" + objBean.getParty_Bill_Date() + "','YYYY-MM-DD')," + objBean.getParty_Sr_Bill_No() + "," + objBean.getTotal_Qty() + "," + objBean.getDiscount() + "," + objBean.getTotal_Tax_Amount() + "," + objBean.getTotal_Gross_Amount() + ",'" + objBean.getBill_Remarks() + "'," + objBean.getTotal_Bill_Amount() + "," + objBean.getDue_Days() + ",'" + objBean.getBill_Mode() + "',0)");
            tr_No += 1;
            objsql.update("update TR_NO set tr_no=" + tr_No);
            for (int i = 0; i < mygrid.length; i = i + 6) {
                Integer i_code = Integer.parseInt(mygrid[i]);
                Double qty = Double.parseDouble(mygrid[i + 1]);
                Double rate = Double.parseDouble(mygrid[i + 2]);
                Double G_total = Double.parseDouble(mygrid[i + 3]);
                Double t_tax = Double.parseDouble(mygrid[i + 4]);
                Double total = Double.parseDouble(mygrid[i + 5]);
                objsql.persist("insert into TRADE_DETAIL (BILL_NO,ITEM_ID,QTY,RATE,G_TOTAL,T_TAX,TOTAL,TRASH,BOOK_NAME) values(" + objBean.getSr_Bill_No() + "," + i_code + "," + qty + "," + rate + "," + G_total + "," + t_tax + "," + total + ",0,'" + objBean.getBook_No() + "')");
            }
            if (objBean.getBill_Mode().equals("Credit Bill") == false) {
                if (objBean.getBook_No().equals("Purchase Bill") == true || objBean.getBook_No().equals("Sales Return Bill") == true) {
                    T_Type = "Payment";
                } else {
                    T_Type = "Receipt";
                }
                objsql.persist("insert into CASH_TRADE (TR_ID,TR_TYPE,CASH_ID,ENTRY_DATE,BILL_NO,AC_ID,TOTAL_AMOUNT,BILL_REMARK,trash) values(" + tr_No + ",'" + T_Type + "',1,TO_DATE('" + objBean.getBill_Date() + "','YYYY-MM-DD')," + objBean.getSr_Bill_No() + "," + objBean.getAccount_No() + "," + objBean.getTotal_Bill_Amount() + ",'Cash Trade','0')");
                objsql.persist("insert into CURRENCY(tr_id,Bill_No,Bill_Date,C1000,C500,C100,C50,C20,C10,trash) values(" + tr_No + "," + objBean.getSr_Bill_No() + ",TO_DATE('" + objBean.getBill_Date() + "','YYYY-MM-DD')," + objBean.getC_1000() + "," + objBean.getC_500() + "," + objBean.getC_100() + "," + objBean.getC_50() + "," + objBean.getC_20() + "," + objBean.getC_10() + ",0)");
                tr_No += 1;
                objsql.update("update TR_NO set tr_no=" + tr_No);
            }
        }
        objsql.persist("DECLARE BEGIN DELETE FROM ITEM_sTOCK; OPITEM; TRITEM; notifyit; END;");
    }

    public List get_data() throws Exception {
        return objsql.getLists("select * from Trade_Master where trash=0");
    }

    public List get_data1() throws Exception {
        return objsql.getLists("select * from currency");
    }

    public List get_data2() throws Exception {
        return objsql.getLists("select a.*,b.item_name,(select sum(c.tax_per) from ITEM_TAX c where c.ITEM_ID=a.ITEM_ID) TAX from trade_detail a,item_master b where a.trash=0 and a.item_id=b.item_id");
    }

    public void delete(Integer id) throws Exception {
        objsql.update("update Trade_master set trash=1 where Bill_No=" + id);
        objsql.update("update Trade_detail set trash=1 where Bill_No=" + id);
        objsql.update("update CURRENCY set trash=1 where bill_no=" + id);
    }

    public List export() throws Exception {
        return objsql.getLists("select a.BOOK_NAME,a.BILL_NO,b.Ac_name,a.BILL_DATE,a.TOTAL_QTY,a.DISCOUNT,a.TOTAL_GROSS,a.TOTAL_TAX,a.TOTAL_AMOUNT,a.BILL_MODE from trade_master a,ac_master b where a.Ac_id=b.Ac_id and a.trash=0 ");
    }
    public List export1() throws Exception {
          return objsql.getLists("select a.BILL_NO,b.item_name,a.QTY,a.RATE,a.G_TOTAL,a.T_TAX,a.TOTAL from TRADE_DETAIL a,item_master b where a.item_id=b.item_id");
    }
}
