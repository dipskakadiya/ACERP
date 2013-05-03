/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Chang_Password;

import Bean.Chang_Password.Chang_PasswordBean;
import Services.Chang_Password.Chang_PasswordService;
import Services.common.common;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class Chang_PasswordController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Chang_Password");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("S_Admin")) {
                mv.addObject("Datanotify", objComSer.get_Adnotify());
            } else {
                mv.addObject("Datanotify", objComSer.get_notify());
            }
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }


        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, Chang_PasswordBean objbean) {
        ModelAndView mv = new ModelAndView("Chang_Password");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List lt,msg,per;
            Chang_PasswordService objPwdSer = new Chang_PasswordService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("S_Admin")) {
                mv.addObject("Datanotify", objComSer.get_Adnotify());
            } else {
                mv.addObject("Datanotify", objComSer.get_notify());
            }
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }

            /* Change password services start*/
            lt = objPwdSer.Save(objbean, session.getAttribute("User_Id"), session.getAttribute("User_Type"), session.getAttribute("Password"));
            if (lt.size() > 0) {
                session.setAttribute("Password", objbean.getNew_Password());
            }
            res.sendRedirect("Chang_Password.htm?menu=Chang_Password&flag=1&action=show");


        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }
}
