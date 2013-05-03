/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.User_Detail;

import Bean.User_Detail.UserDetailBean;
import Utilites.AdminService;
import java.util.List;

public class UserDetailService {

    AdminService objsql;

    public UserDetailService(String file) throws Exception {
        objsql = new AdminService(file);

    }

    public void Save(UserDetailBean objBean, Object user_id, Object user_type) throws Exception {
        String image;
        if(objBean.getImage().getOriginalFilename().equals("")==true){
        image=objBean.getImagealt();
        }else{
        image=objBean.getImage().getOriginalFilename();
        }
        if (user_type.equals("User") == true) {
            objsql.persist("Update USR_DETAIL set F_NAME='" + objBean.getF_Name() + "',L_NAME='" + objBean.getL_Name() + "',GENDER='" + objBean.getGender() + "',DOB=TO_DATE('" + objBean.getDOB() + "','YYYY-MM-DD'),JOIN_DATE=TO_DATE('" + objBean.getJoin_Date() + "','YYYY-MM-DD'),R_ADDRESS='" + objBean.getR_Address() + "',PINCODE=" + objBean.getPincode() + ",C_NAME='" + objBean.getContry() + "',S_NAME='" + objBean.getState() + "',CI_NAME='" + objBean.getCity() + "',EMAIL_ID='" + objBean.getEmail() + "',DESIG='" + objBean.getDesig() + "',IMAGE='" + image + "',CONTACT_NO=1234567890 where USER_COUNT=" + objBean.getUser_Count());
        } else {
            objsql.persist("Update ADMIN_DETAIL set F_NAME='" + objBean.getF_Name() + "',L_NAME='" + objBean.getL_Name() + "',GENDER='" + objBean.getGender() + "',DOB=TO_DATE('" + objBean.getDOB() + "','YYYY-MM-DD'),JOIN_DATE=TO_DATE('" + objBean.getJoin_Date() + "','YYYY-MM-DD'),R_ADDRESS='" + objBean.getR_Address() + "',PINCODE=" + objBean.getPincode() + ",C_NAME='" + objBean.getContry() + "',S_NAME='" + objBean.getState() + "',CI_NAME='" + objBean.getCity() + "',EMAIL_ID='" + objBean.getEmail() + "',DESIG='" + objBean.getDesig() + "',IMAGE='" + image + "',CONTACT_NO=1234567890 where USER_COUNT=" + objBean.getUser_Count());
        }
    }

    public List get_data(Object user_id, Object user_type) throws Exception {
        if (user_type.equals("User") == true) {
            return objsql.getLists("select * from USR_DETAIL where USER_COUNT=" + user_id);
        } else {
            return objsql.getLists("select * from ADMIN_DETAIL where USER_COUNT=" + user_id);
        }
    }
}
