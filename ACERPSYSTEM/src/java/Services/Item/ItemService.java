/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Item;

import Bean.Item.ItemBean;
import Utilites.UserService;
import java.util.List;

/**
 *
 * @author sai
 */
public class ItemService {

    UserService objsql;

    public ItemService(String file,String id) throws Exception {
        objsql = new UserService(file,id);
    }

    public void Ctg_Save(ItemBean objBean, Integer f) throws Exception {
        if (f == 1) {
            objsql.update("Update item_Ctg set Ctg_name='" + objBean.getCtg_Name() + "' where Ctg_id=" + objBean.getCtg_id());
        } else {
            objsql.persist("insert into item_Ctg (Ctg_id,Ctg_name,Trash) values(" + objBean.getCtg_id() + ",'" + objBean.getCtg_Name() + "',0)");
        }
    }

    public void Save(ItemBean objBean, Integer f) throws Exception {
        String image;
        if (objBean.getImage().getOriginalFilename().equals("") == true) {
            image = objBean.getImagealt();
        } else {
            image = objBean.getImage().getOriginalFilename();
        }
        String mygrid[] = objBean.getMygrid();
        if (f == 1) {
            objsql.update("update item_master set ITEM_NAME='" + objBean.getItem_Name() + "',Op_Stock=" + objBean.getOp_Stock() + ",Op_Rate=" + objBean.getOp_Rate() + ",Op_Amount=" + objBean.getOp_Amount() + ",Sales_Rate=" + objBean.getSales_Rate() + ",Item_Mrp=" + objBean.getItem_Mrp() + ",Reorder_Level=" + objBean.getReorder_Level() + ",Tax_Applicable=" + objBean.getTax_Applicable() + ",Label_Print=" + objBean.getLable_Print() + ",Ctg_id=" + objBean.getCtg_id() + ",pimage='"+image+"' where Item_id=" + objBean.getItem_Code());
            objsql.update("delete from ITEM_TAX where ITEM_ID=" + objBean.getItem_Code());
            if (objBean.getTax_Applicable().toString().equals("1") && objBean.getMygrid() != null) {
                for (int i = 0; i < mygrid.length; i = i + 2) {
                    objsql.persist("insert into ITEM_TAX (ITEM_ID,TAX_id,TAX_PER,TRASH)values(" + objBean.getItem_Code() + ",'" + mygrid[i] + "'," + mygrid[i + 1] + ",0)");
                }
            }
        } else {
            Integer tr_No = objsql.get_int("Select TR_NO from TR_NO");
            objsql.persist("insert into item_master(Tr_id,Item_id,ITEM_NAME,Op_Stock,Op_Rate,Op_Amount,Sales_Rate,Item_Mrp,Reorder_Level,Tax_Applicable ,Label_Print,trash,Ctg_id,Pimage) values(" + tr_No + "," + objBean.getItem_Code() + ",'" + objBean.getItem_Name() + "'," + objBean.getOp_Stock() + "," + objBean.getOp_Rate() + "," + objBean.getOp_Amount() + "," + objBean.getSales_Rate() + "," + objBean.getItem_Mrp() + "," + objBean.getReorder_Level() + "," + objBean.getTax_Applicable() + "," + objBean.getLable_Print() + ",0," + objBean.getCtg_id() + ",'"+image+"')");
            tr_No += 1;
            objsql.update("update TR_NO set tr_no=" + tr_No);
            if (objBean.getTax_Applicable().toString().equals("1") && objBean.getMygrid() != null) {
                for (int i = 0; i < mygrid.length; i = i + 2) {
                    objsql.persist("insert into ITEM_TAX (ITEM_ID,TAX_id,TAX_PER,TRASH)values(" + objBean.getItem_Code() + ",'" + mygrid[i] + "'," + mygrid[i + 1] + ",0)");
                }
            }
        }
        objsql.persist("DECLARE BEGIN DELETE FROM ITEM_sTOCK; OPITEM; TRITEM; END;");
    }

    public List get_data() throws Exception {
        return objsql.getLists("select * from item_master where trash=0");
    }

    public List get_TCtg() throws Exception {
        return objsql.getLists("select * from item_Ctg where trash=0");
    }

    public List get_Tax() throws Exception {
        return objsql.getLists("select a.*,b.tax_name from ITEM_TAX a,tax_master b where trash=0 and a.tax_id=b.tax_id");
    }

    public List get_AllTax() throws Exception {
        return objsql.getLists("select * from TAX_master");
    }

    public Integer get_Ctg_id() throws Exception {
        return objsql.get_int("select Max(CTG_ID) from Item_Ctg");
    }

    public Integer getItem_Id() throws Exception {
        return objsql.get_int("select Max(Item_Id) from Item_master");
    }

    public void delete(Integer id) throws Exception {
        objsql.update("update item_master set trash=1 where Item_id=" + id);
    }

    public void delete_Ctg(Integer id) throws Exception {
        objsql.update("update item_Ctg set trash=1 where Ctg_id=" + id);
        objsql.update("update item_master set trash=1 where CTG_ID=" + id);
    }

    public List export() throws Exception {
        return objsql.getLists("select a.ITEM_NAME,b.CTG_NAME,a.OP_STOCK,a.OP_RATE,a.OP_AMOUNT,a.SALES_RATE,a.REORDER_LEVEL from ITEM_MASTER a,ITEM_CTG b where a.ctg_id=b.ctg_id and a.trash=0");
    }
}
