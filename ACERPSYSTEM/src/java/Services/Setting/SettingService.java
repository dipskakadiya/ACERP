/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Setting;

import Bean.Setting.SettingBean;
import Utilites.AdminService;
import Utilites.UserService;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author KRISHNA
 */
public class SettingService {

    UserService objsql;
    AdminService objadmin;

    public SettingService(String file, String id) throws Exception {
        objsql = new UserService(file, id);
        objadmin = new AdminService(file);
    }

    public void Get_Backup(SettingBean objBean, String db) throws Exception {
        String str = objBean.getB_Path();
        Runtime runtime = Runtime.getRuntime();
        try {
            Process p = runtime.exec("cmd /c exp "+db+"/"+db+"@XE buffer=4096 grants=Y file=" + str);
            //Process p = runtime.exec("cmd /c D:\\backup.bat");
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    public void Get_Restore(SettingBean objBean, String u_id) throws Exception {
        objadmin.persist("DROP USER "+u_id+" CASCADE");
        MultipartFile file = objBean.getR_file();
        objadmin.persist("CREATE USER " + u_id + " IDENTIFIED BY " + u_id + " DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp QUOTA UNLIMITED ON users");
        objadmin.persist("GRANT CREATE SESSION,DBA TO " + u_id);
        Runtime runtime = Runtime.getRuntime();
        try {
            Process p = runtime.exec("imp " + u_id + "/" + u_id + "@XE buffer=4096 grants=Y full=Y file=\"D:/TYBCA/ACERPSYSTEM/build/web/Backup_Clients/R_" + file.getOriginalFilename() + "\"");
            //Process p = runtime.exec("cmd /c D:\\backup.bat");
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        //String str = objBean.getR_Path();
    }

    public List get_bank() throws Exception {

        return objsql.getLists("select * from Bank_Master");
    }

    public void Save(SettingBean objBean, Integer f) throws Exception {
        if (f == 1) {
            objsql.update("update Bank_Master set Bank_Name='" + objBean.getAdd_Bank() + "' where Bank_Id=" + objBean.getBank_id());
        } else {
            Integer no;
            no = objsql.get_int("select max(Bank_Id) from Bank_master");
            no += 1;
            objsql.persist("insert into Bank_Master (Bank_Id,Bank_Name) values(" + no + ",'" + objBean.getAdd_Bank() + "')");

        }
    }

    public void Delete(Integer id) throws Exception {
        objsql.persist("delete from Bank_Master where Bank_Id=" + id);
    }

    public List get_Tax() throws Exception {

        return objsql.getLists("select * from Tax_Master");
    }

    public void save(SettingBean objBean, Integer f) throws Exception {
        if (f == 1) {
            objsql.update("update Tax_Master set Tax_Name='" + objBean.getAdd_Tax() + "' where Tax_Id=" + objBean.getTax_id());
        } else {
            Integer no;
            no = objsql.get_int("select max(Tax_Id) from Tax_master");
            no += 1;
            objsql.persist("insert into Tax_Master (Tax_Id,Tax_Name) values(" + no + ",'" + objBean.getAdd_Tax() + "')");

        }
    }

    public void delete(Integer id) throws Exception {
        objsql.persist("delete from Tax_Master where Tax_Id=" + id);
    }

    public List get_AcHead() throws Exception {
        return objsql.getLists("select * from AC_HEAD");
    }

    public void save_Ah(SettingBean objBean, Integer f) throws Exception {
        if (f == 1) {
            objsql.update("update AC_HEAD set M_HEAD_ID=" + objBean.getMAc_Head() + ",AC_NAME='" + objBean.getAc_Head() + "',BAL_TYPE='" + objBean.getBtype() + "' where HEAD_ID=" + objBean.getHead_id());
        } else {
            Integer no;
            no = objsql.get_int("select max(HEAD_id) from AC_HEAD");
            no += 1;
            objsql.persist("insert into AC_HEAD values (" + no + "," + objBean.getMAc_Head() + ",'" + objBean.getAc_Head() + "','" + objBean.getBtype() + "')");

        }
    }

    public void deleteAh(Integer id) throws Exception {
        objsql.persist("delete from AC_HEAD where HEAD_id=" + id);
    }
}
