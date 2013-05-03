/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.User;

import Bean.User.UserBean;
import Utilites.AdminService;
import java.util.List;

/**
 *
 * @author sai
 */
public class UserService {

    AdminService objsql;

    public UserService(String file) throws Exception {
        objsql = new AdminService(file);
    }

    public void Save(UserBean objBean, Integer f, Object Admin_id) throws Exception {
        Integer p[], Add, Edit, Delete, View,Trash;
        String per = "";
        Integer UC;
        if (f == 1) {
            objsql.update("delete from USER_PER where USER_ID=" + objBean.getUser_count());
            UC = Integer.parseInt(objBean.getUser_count().toString());
        } else {
            UC = objsql.get_int("select max(USER_COUNT) from User_login ");
            UC += 1;
            objsql.persist("insert into User_login(USER_COUNT,USER_ID,ADMIN_ID,PASSWORD,USER_TYPE,BLOCK_UNBLOCK) values(" + UC + ",'" + objBean.getUser_Name() + "'," + Admin_id + ",'" + objBean.getPassword() + "','User',0)");
            objsql.persist("insert into USR_DETAIL (USER_COUNT,F_NAME,L_NAME,GENDER,DOB,JOIN_DATE,R_ADDRESS,PINCODE,C_NAME,S_NAME,CI_NAME,EMAIL_ID,DESIG,IMAGE,CONTACT_NO) values (" + UC + ",'-','-','Male','1-jan-1992',SYSDATE,'-',0,'India','Gujarat','Surat','-','Employee','Profile.jpg',1234567890)");
        }
        if (objBean.getPer() != null) {
            p = objBean.getPer();
            for (int i = 0; i < p.length; i++) {
                Add = 0;Edit = 0;Delete = 0;View = 0;Trash=0;
                if (p[i] == 1) {
                    Add = 1;
                } else if (p[i] == 2) {
                    Edit = 1;
                } else if (p[i] == 3) {
                    Add = 1;Edit = 1;
                } else if (p[i] == 4) {
                    Delete = 1;
                } else if (p[i] == 5) {
                    Add = 1;Delete = 1;
                } else if (p[i] == 6) {
                    Edit = 1;Delete = 1;
                } else if (p[i] == 7) {
                    Add = 1;Edit = 1;Delete = 1;
                }else if (p[i] == 8) {
                    View = 1;
                }else if (p[i] == 9) {
                    Add = 1;View = 1;
                }else if (p[i] == 10) {
                    Edit = 1;View = 1;
                }else if (p[i] == 11) {
                     Add = 1;Edit = 1;View = 1;
                }else if (p[i] == 12) {
                      Delete = 1;View = 1;
                }else if (p[i] == 13) {
                      Add = 1;Delete = 1;View = 1;
                }else if (p[i] == 14) {
                      Edit = 1;Delete = 1;View = 1;
                }else if (p[i] == 15) {
                      Add = 1;Edit = 1;Delete = 1;View = 1;
                }else if (p[i] == 16) {
                      Trash = 1;
                }else if (p[i] == 17) {
                      Add = 1;Trash = 1;
                }else if (p[i] == 18) {
                      Edit = 1;Trash = 1;
                }else if (p[i] == 19) {
                      Add = 1;Edit = 1;Trash = 1;
                }else if (p[i] == 20) {
                      Delete = 1;Trash = 1;
                }else if (p[i] == 21) {
                      Add = 1;Delete = 1;Trash = 1;
                }else if (p[i] == 22) {
                      Edit = 1;Delete = 1;Trash = 1;
                }else if (p[i] == 23) {
                      Add = 1;Edit = 1;Delete = 1;Trash = 1;
                }else if (p[i] == 24) {
                      View = 1;Trash = 1;
                }else if (p[i] == 25) {
                      Add = 1;View = 1;Trash = 1;
                }else if (p[i] == 26) {
                      Edit = 1;View = 1;Trash = 1;
                }else if (p[i] == 27) {
                      Add = 1;Edit = 1;View = 1;Trash = 1;
                }else if (p[i] == 28) {
                      Delete = 1;View = 1;Trash = 1;
                }else if (p[i] == 29) {
                      Add = 1;Delete = 1;View = 1;Trash = 1;
                }else if (p[i] == 30) {
                      Edit = 1;Delete = 1;View = 1;Trash = 1;
                }else if (p[i] == 31) {
                      Add = 1;Edit = 1;Delete = 1;View = 1;Trash = 1;
                }
                objsql.persist("insert into USER_PER values(" + UC + "," + i + "," + Add + "," + Edit + "," + Delete + ","+View+","+Trash+"," + p[i] + ")");
            }
        }
    }

    public List get_data(Object admin_id) throws Exception {
        return objsql.getLists("select * from User_login where ADMIN_ID=" + admin_id);
    }

    public List get_per(Object admin_id) throws Exception {
        return objsql.getLists("select * from USER_PER where USER_ID=" + admin_id + " order by MODUAL");
    }

    public void delete(Integer id) throws Exception {
        objsql.update("delete from User_login where User_count=" + id);
    }
}
