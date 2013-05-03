/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Report;

import Bean.Report.ReportBean;
import Utilites.UserService;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author sai
 */
public class ReportService {

    UserService objsql;

    public ReportService(String file,String id) throws Exception {
        objsql = new UserService(file,id);
    }

    public List get_Ledger(ReportBean objBean) throws Exception {
        String query = "DECLARE BEGIN DELETE FROM LEDGER; LEDGERAC; LEDGERBK; LEDGERTR; LEDGERCS; LEDGERJV; END;";
        objsql.persist(query);
        return objsql.getLists("SELECT * FROM LEDGER WHERE aC_ID=" + objBean.getAccount_No() + " ORDER by tr_id");
    }

    public List get_ItStock() throws Exception {
        objsql.persist("DECLARE BEGIN DELETE FROM ITEM_sTOCK; OPITEM; TRITEM; END;");
        String Query = "SELECT DISTINCT A.item_id,C.ITEM_NAME,";
        Query += "(SELECT SUM(B.QTY) FROM ITEM_STOCK B WHERE B.DESCRIPTION='OPENING STOCK' AND A.ITEM_ID=B.ITEM_ID)OP_STOCK,";
        Query += "(SELECT SUM(B.QTY) FROM ITEM_STOCK B WHERE B.DESCRIPTION='Purchase Bill' AND A.ITEM_ID=B.ITEM_ID) PURCHASE,";
        Query += "(SELECT SUM(B.QTY) FROM ITEM_STOCK B WHERE B.DESCRIPTION='Sales Bill' AND A.ITEM_ID=B.ITEM_ID) SALES,";
        Query += "(SELECT SUM(B.QTY) FROM ITEM_STOCK B WHERE B.DESCRIPTION='Purchase Return Bill' AND A.ITEM_ID=B.ITEM_ID) PURCHASE_RTN,";
        Query += "(SELECT SUM(B.QTY) FROM ITEM_STOCK B WHERE B.DESCRIPTION='Sales Return Bill' AND A.ITEM_ID=B.ITEM_ID) SALES_RTN,";
        Query += "FNIMSTOCK(A.ITEM_ID) STOCK,";
        Query += "FNITVAL(A.ITEM_ID) ItemValues ";
        Query += "FROM ITEM_STOCK A,ITEM_MASTER C WHERE A.ITEM_ID=C.ITEM_ID";
        return objsql.getLists(Query);
    }
    
    public List get_ItStDt(String id,String ty) throws Exception {
        return objsql.getLists("select * from ITEM_STOCK where item_id="+id+" and DESCRIPTION='"+ty+"'");
    }

    public List getAllreports() {
        return objsql.getLists("select R_id,R_NAME from REPORTS");
    }

    public void Create_rpt(ReportBean objBean) throws Exception {
        String fields = "";
        String Alies = "";
        Integer GetFields[] = objBean.getField();
        for (int i = 0; i < GetFields.length; i++) {
            if (GetFields[i] == 1) {
                fields += "Ac_name,";
                Alies += "Account Name,";
            } else if (GetFields[i] == 2) {
                fields += "Head_name,";
                Alies += "Head Account Name,";
            } else if (GetFields[i] == 3) {
                fields += "C_Address,";
                Alies += "Address,";
            } else if (GetFields[i] == 4) {
                fields += "Ci_name,";
                Alies += "City,";
            } else if (GetFields[i] == 5) {
                fields += "pincode,";
                Alies += "Pincode,";
            } else if (GetFields[i] == 6) {
                fields += "S_name,";
                Alies += "State,";
            } else if (GetFields[i] == 7) {
                fields += "C_name,";
                Alies += "Country,";
            } else if (GetFields[i] == 8) {
                fields += "R_Address,";
                Alies += "Resi. Address,";
            } else if (GetFields[i] == 9) {
                fields += "Contact_no,";
                Alies += "Contact No,";
            } else if (GetFields[i] == 10) {
                fields += "Email_id,";
                Alies += "Email Id,";
            } else if (GetFields[i] == 11) {
                fields += "Bill_no,";
                Alies += "Bill No,";
            } else if (GetFields[i] == 12) {
                fields += "bill_date,";
                Alies += "Bill Date,";
            } else if (GetFields[i] == 13) {
                fields += "Ac_Amount,type,";
                Alies += "Amount,Type,";
            } else if (GetFields[i] == 14) {
                fields += "R_Amount,";
                Alies += "Account Amount,";
            } else if (GetFields[i] == 15) {
                fields += "Item_name,";
                Alies += "Item  Name,";
            } else if (GetFields[i] == 16) {
                fields += "Ctg_name,";
                Alies += "Category Name,";
            } else if (GetFields[i] == 17) {
                fields += "SALES_RATE,";
                Alies += "Sales Rate,";
            } else if (GetFields[i] == 18) {
                fields += "REORDER_LEVEL,";
                Alies += "Reorder Level,";
            } else if (GetFields[i] == 19) {
                fields += "Bill_no,";
                Alies += "Bill No,";
            } else if (GetFields[i] == 20) {
                fields += "Bill_Date,";
                Alies += "Bill Date,";
            } else if (GetFields[i] == 21) {
                fields += "Qty,";
                Alies += "Qty,";
            } else if (GetFields[i] == 22) {
                fields += "Stock,";
                Alies += "Stock,";
            }
        }
        if (objBean.getR_Type().equals("AcCri") == true) {
            objBean.setR_Type("CrAccount");
        } else {
            objBean.setR_Type("CrItem");
        }
        fields = fields.substring(0, fields.length() - 1);
        Alies = Alies.substring(0, Alies.length() - 1);
        Integer r_no = objsql.get_int("select max(R_ID)+1 from REPORTS");
        objsql.persist("insert into REPORTS values(" + r_no + ",'" + objBean.getR_Name() + "','" + fields + "','" + objBean.getR_Type() + "','" + Alies + "')");
        String Cri[] = objBean.getCri();
        String val[] = objBean.getVal();
        if (Cri != null) {
            for (int i = 0; i < Cri.length; i++) {
                objsql.persist("insert into REPORTS_CRI values(" + r_no + ",'" + Cri[i] + "','" + val[i] + "')");
            }
        }
    }

    public List getFields(String id) throws Exception {
        return objsql.getLists("select ALIES,FIELDS from reports where r_id=" + id);
    }

    public void delete(String id) throws Exception {
        objsql.update("delete from REPORTS where r_id=" + id);
    }

    public List RunReport(String id) throws Exception {
        List Rpt = objsql.getLists("select * from REPORTS where R_id=" + id);
        List Rpt_Detail = objsql.getLists("select * from REPORTS_CRI where R_id=" + id);
        HashMap hm = null;
        String Cri = "";
        if (Rpt_Detail != null) {
            Cri = " where ";
            for (int i = 0; i < Rpt_Detail.size(); i++) {
                hm = (HashMap) Rpt_Detail.get(i);
                if (hm.get("CRI_NAME").equals("R_Amount") == true) {
                    Cri += hm.get("CRI_NAME") + "=" + hm.get("VALUE") + " and ";
                } else if (hm.get("CRI_NAME").equals("Bill_Date") == true) {
                    Cri += hm.get("CRI_NAME") + "=TO_DATE('" + hm.get("VALUE") + "','YYYY-MM-DD') and ";
                } else {
                    Cri += hm.get("CRI_NAME") + "='" + hm.get("VALUE") + "' and ";
                }
            }
        }
        Cri = Cri.substring(0, Cri.length() - 5);
        if (Rpt != null) {
            hm = (HashMap) Rpt.get(0);
            return objsql.getLists("select distinct " + hm.get("FIELDS") + " from " + hm.get("R_TYPE") + Cri);
        }
        return null;
    }

    public List exportITstAll() throws Exception {
        objsql.persist("DECLARE BEGIN DELETE FROM ITEM_sTOCK; OPITEM; TRITEM; END;");
        String Query = "SELECT DISTINCT C.ITEM_NAME,";
        Query += "(SELECT SUM(B.QTY) FROM ITEM_STOCK B WHERE B.DESCRIPTION='OPENING STOCK' AND A.ITEM_ID=B.ITEM_ID)OP_STOCK,";
        Query += "(SELECT SUM(B.QTY) FROM ITEM_STOCK B WHERE B.DESCRIPTION='Purchase Bill' AND A.ITEM_ID=B.ITEM_ID) PURCHASE,";
        Query += "(SELECT SUM(B.QTY) FROM ITEM_STOCK B WHERE B.DESCRIPTION='Sales Bill' AND A.ITEM_ID=B.ITEM_ID) SALES,";
        Query += "(SELECT SUM(B.QTY) FROM ITEM_STOCK B WHERE B.DESCRIPTION='Purchase Return Bill' AND A.ITEM_ID=B.ITEM_ID) PURCHASE_RTN,";
        Query += "(SELECT SUM(B.QTY) FROM ITEM_STOCK B WHERE B.DESCRIPTION='Sales Return Bill' AND A.ITEM_ID=B.ITEM_ID) SALES_RTN,";
        Query += "FNIMSTOCK(A.ITEM_ID) STOCK,";
        Query += "FNITVAL(A.ITEM_ID) ItemValues ";
        Query += "FROM ITEM_STOCK A,ITEM_MASTER C WHERE A.ITEM_ID=C.ITEM_ID";
        return objsql.getLists(Query);
    }

    public List exportLedger(ReportBean objBean) throws Exception {
        String query = "DECLARE BEGIN DELETE FROM LEDGER; LEDGERAC; LEDGERBK; LEDGERTR; LEDGERCS; LEDGERJV; END;";
        objsql.persist(query);
        return objsql.getLists("SELECT BILL_NO,BILL_DATE,PERTICULER,AC_AMOUNT,type FROM LEDGER WHERE aC_ID=" + objBean.getAccount_No() + " ORDER by tr_id");
        
    }
}
