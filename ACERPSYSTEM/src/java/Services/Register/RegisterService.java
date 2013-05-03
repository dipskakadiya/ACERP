/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Register;

import Bean.Register.RegisterBean;
import Utilites.AdminService;

/**
 *
 * @author KRISHNA
 */
public class RegisterService {

    AdminService objadmin;

    public RegisterService(String file) throws Exception {
        objadmin = new AdminService(file);
    }

    public void Register(RegisterBean objbean, String str) throws Exception {
        Integer uc = objadmin.get_int("select max(USER_COUNT) from ADMIN_LOGIN");
        uc += 1;
        objadmin.persist("insert into Admin_Login(USER_COUNT,Admin_id,Password,User_Type,Block_Unblock,Start_Date,Days,demo)values(" + uc + ",'" + objbean.getUser_Name() + "','" + objbean.getPassword() + "','Admin',0,SYSDATE,30,0)");
        Integer Ci = objadmin.get_int("select max(COM_ID) from COMPANY_DETAIL");
        Ci += 1;
        objadmin.persist("insert into Company_Detail(COM_ID,ADMIN_ID,com_name,c_address,area,pincode,c_name,s_name,ci_name,email_id,contact_no,phone_no,year_start_date,year_end_date)values(" + Ci + "," + uc + ",'Demo','add','area',0,'india','gujarat','surat','" + objbean.getEmail_Id() + "'," + objbean.getContect_No() + ",0,'1-april-2011','31-march-2013')");
        objadmin.persist("insert into Admin_Detail(user_count,f_name,l_name,gender,dob,join_date,r_address,pincode,c_name,s_name,ci_name,CONTACT_NO,email_id,desig,image)values(" + uc + ",'first Name','last Name','Male','1-jan-1990',SYSDATE,'add',0,'India','Gujarat','Surat'," + objbean.getContect_No() + ",'" + objbean.getEmail_Id() + "','Admin','A_profile.png')");
        objadmin.persist("CREATE USER " + objbean.getUser_Name() + " IDENTIFIED BY " + objbean.getUser_Name() + " DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp QUOTA UNLIMITED ON users");
        objadmin.persist("GRANT CREATE SESSION,DBA TO " + objbean.getUser_Name());
        Runtime runtime = Runtime.getRuntime();
        try {
            Process p = runtime.exec("imp " + objbean.getUser_Name() + "/" + objbean.getUser_Name() + "@XE buffer=4096 grants=Y full=Y file=\"D:/TYBCA/ACERPSYSTEM/build/web/images/NEWBACKUP/NewDB.dmp\"");
            //Process p = runtime.exec("cmd /c D:\\backup.bat");
        } catch (Exception e) {
            System.out.println(e.toString());
        }
            
    }
}
