/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Login;

import Bean.Login.LoginBean;
import Services.Login.LoginService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author sai
 */
public class LoginController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Login");
        return mv;
    }

    public ModelAndView Login(HttpServletRequest req, HttpServletResponse res, LoginBean objBean) {
        ModelAndView mv = new ModelAndView("Login");
        try {
            List ltlogin;
            HashMap hmlogin;
            Integer flogin = 0, fblock = 0;
            HttpSession session = req.getSession();
            LoginService objLoginSer = new LoginService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Ckeck User_ld and Pasword exist in database or not */
            ltlogin = objLoginSer.IsLogin(objBean);
            flogin = ltlogin.size();
            /* Ckeck User block by Admin or not in database or not */
            if (flogin > 0) {
                fblock = objLoginSer.Isblock(objBean);
            }
            if (flogin > 0) {
                /* Exeute if  Userid and password correct */
                if (fblock == 0) {
                    /* Exeute if user is unblock */
                    hmlogin = (HashMap) ltlogin.get(0);
                    if (hmlogin.get("user_type").toString().equals("S_Admin")) {
                        /* Exeute if Super Admin Login */
                        session.setAttribute("User_count", hmlogin.get("User_count"));
                        session.setAttribute("db", hmlogin.get("Admin_Id"));
                        session.setAttribute("User_Id", hmlogin.get("Admin_Id"));
                        session.setAttribute("db","Admindb");
                        session.setAttribute("Password", hmlogin.get("Password"));
                        session.setAttribute("User_Type", hmlogin.get("User_Type"));
                        res.sendRedirect("Admin_Dashboard.htm?menu=Dashboard&action=show");
                    } else {
                        /* Exeute if Admin/User Login */
                        if (hmlogin.get("user_type").toString().equals("Admin")) {
                            /* Exeute if Admin Login */
                            session.setAttribute("User_Id", hmlogin.get("Admin_id"));
                            session.setAttribute("db", hmlogin.get("Admin_Id"));
                            session.setAttribute("demo", hmlogin.get("demo"));
                        } else {
                            /* Exeute if User Login */
                            session.setAttribute("User_Id", hmlogin.get("user_id"));
                            session.setAttribute("db", hmlogin.get("Admin_name"));
                        }
                        session.setAttribute("User_count", hmlogin.get("User_count"));
                        session.setAttribute("Password", hmlogin.get("Password"));
                        session.setAttribute("User_Type", hmlogin.get("User_Type"));
                        session.setAttribute("Image", hmlogin.get("IMAGE"));
                        session.setAttribute("Com_name", hmlogin.get("COM_NAME"));
                        res.sendRedirect("Dashboard.htm?menu=Dashboard&action=show");
                    }

                    /* Login flag update */
                    objLoginSer.flagupdate(objBean);
                } else {
                    /* Exeute if  User block */
                    mv.addObject("Error", "your Account Blocked");
                }
            } else {
                /* Exeute if  Userid and password incorrect */
                mv.addObject("Error", "your User-Name or password wrong");
            }
        } catch (Exception e) {
            mv.addObject("Error", "Invalid login Credentials");
        }
        return mv;
    }

    public ModelAndView logout(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Logout");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            LoginService objLoginSer = new LoginService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            objLoginSer.Logout(session.getAttribute("User_count"), session.getAttribute("User_Type"));
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
