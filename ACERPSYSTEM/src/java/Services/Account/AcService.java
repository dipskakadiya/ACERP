/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Account;

import Bean.Account.AcBean;
import Utilites.UserService;
import java.util.List;

/**
 *
 * @author sai
 */
public class AcService {

    UserService objsql;

    public AcService(String file,String id) throws Exception {
        objsql = new UserService(file,id);
    }

    public void Save(AcBean objBean, Integer f) throws Exception {
        String mygrid[] = objBean.getMygrid();
        if (f == 1) {
            objsql.update("update Ac_master set Ac_Name='" + objBean.getAc_Name() + "',Head_id=" + objBean.getAc_Head() + ",Op_Bal='" + objBean.getOpening_Bal() + "',Bal_Type='" + objBean.getBal_Type() + "',ref_Person='" + objBean.getCont_Person() + "',C_Address='" + objBean.getBusiness_Address() + "',Pincode=" + objBean.getPincode() + ",R_Address='" + objBean.getResident_Address() + "',C_name='" + objBean.getContry() + "',S_name='" + objBean.getState() + "',Ci_name='" + objBean.getCity() + "',Join_Date=TO_DATE('" + objBean.getJoin_Date() + "','YYYY-MM-DD'),contact_No=" + objBean.getMobile_No() + ",Phone_No=" + objBean.getOffice_No() + ",Email_id='" + objBean.getEmail() + "',Limit=" + objBean.getLimit() + ",Due_Days=" + objBean.getDue_Days() + " where Ac_id=" + objBean.getAc_Code());
            objsql.update("delete from user_bank where Ac_id=" + objBean.getAc_Code());
            if (objBean.getMygrid() != null) {
                for (int i = 0; i < mygrid.length; i = i + 2) {
                    objsql.persist("insert into User_Bank (Ac_id,bank_id,bank_address,trash) values(" + objBean.getAc_Code() + ",'" + mygrid[i] + "','" + mygrid[i + 1] + "',0)");
                }
            }
        } else {
            Integer tr_No = objsql.get_int("Select TR_NO from TR_NO");
            objsql.persist("insert into Ac_master(Tr_id,Ac_id,Ac_Name,Head_Id,Op_Bal,Bal_Type,Ref_Person,C_Address,Pincode,R_Address,C_name,S_name,Ci_name,Join_Date,Contact_No,Phone_No,Email_id,limit,Due_Days,Trash) values(" + tr_No + "," + objBean.getAc_Code() + ",'" + objBean.getAc_Name() + "'," + objBean.getAc_Head() + ",'" + objBean.getOpening_Bal() + "','" + objBean.getBal_Type() + "','" + objBean.getCont_Person() + "','" + objBean.getBusiness_Address() + "'," + objBean.getPincode() + ",'" + objBean.getResident_Address() + "','" + objBean.getContry() + "','" + objBean.getState() + "','" + objBean.getCity() + "',TO_DATE('" + objBean.getJoin_Date() + "','YYYY-MM-DD')," + objBean.getMobile_No() + "," + objBean.getOffice_No() + ",'" + objBean.getEmail() + "'," + objBean.getLimit() + "," + objBean.getDue_Days() + ",0)");
            tr_No += 1;
            objsql.update("update TR_NO set tr_no=" + tr_No);
            if (objBean.getMygrid() != null) {
                for (int i = 0; i < mygrid.length; i = i + 2) {
                    objsql.persist("insert into User_Bank (Ac_id,bank_id,bank_address,trash) values(" + objBean.getAc_Code() + ",'" + mygrid[i] + "','" + mygrid[i + 1] + "',0)");
                }
            }
        }
    }

    public Integer get_Ac_no() throws Exception {
        return objsql.get_int("select max(Ac_id) from ac_master");
    }

    public List get_data() throws Exception {
        return objsql.getLists("select * from ac_master where Trash=0");
    }

    public List get_LtAcHead() throws Exception {
        return objsql.getLists("select * from ac_head");
    }

    public List get_Bank() throws Exception {
        return objsql.getLists("select * from Bank_master");
    }

    public List get_UBank() throws Exception {
        return objsql.getLists("select ub.Ac_id,ub.BANK_ID,bm.Bank_name,ub.BANK_ADDRESS from User_Bank ub,bank_master bm where trash=0 and ub.bank_id=bm.bank_id");
    }

    public void delete(Integer id) throws Exception {
        objsql.update("update Ac_master set Trash=1 where Ac_id=" + id);
        objsql.update("update user_bank set Trash=1 where Ac_id=" + id);
    }

    public List export() throws Exception {
            return objsql.getLists("select a.AC_NAME,b.AC_NAME head_name,a.OP_BAL,a.BAL_TYPE,a.REF_PERSON,a.C_ADDRESS,a.CI_NAME,a.S_NAME,a.C_NAME,a.CONTACT_NO,a.PHONE_NO,a.EMAIL_ID,a.LIMIT,a.DUE_DAYS from ac_master a,AC_HEAD b where Trash=0 and a.head_id=b.head_id and a.trash=0");
    }
}
