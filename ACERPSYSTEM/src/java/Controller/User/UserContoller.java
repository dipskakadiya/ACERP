/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.User;

import Bean.User.UserBean;
import Services.User.UserService;
import Services.common.common;
import java.util.List;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sai
 */
public class UserContoller extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("User");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltUser, ltper, msg;
            UserService objUserSer = new UserService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            /* Accoutn services start */
            ltUser = objUserSer.get_data(session.getAttribute("User_count"));
            mv.addObject("dataUser", ltUser);
            mv.addObject("Datanotify", objComSer.get_notify());
            Integer id = Integer.parseInt(req.getParameter("id"));
            if (id != null) {
                ltper = objUserSer.get_per(id);
                mv.addObject("dataper", ltper);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_All(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("User_All");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltUser, msg, ltper;
            UserService objUserSer = new UserService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            /* Accoutn services start */
            ltUser = objUserSer.get_data(session.getAttribute("User_count"));
            mv.addObject("dataUser", ltUser);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, UserBean objbean) {
        ModelAndView mv = new ModelAndView("User");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            UserService objUserSer = new UserService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            /* Accoutn services start */
            Integer f = Integer.parseInt(req.getParameter("flag"));
            objUserSer.Save(objbean, f, session.getAttribute("User_count"));
            if (f == 1) {
                res.sendRedirect("User.htm?menu=User&action=show&flag=3");
            } else {
                res.sendRedirect("User.htm?menu=User&action=show&flag=2");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("User");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            UserService objUserSer = new UserService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            /* Accoutn services start */
            Integer id = Integer.parseInt(req.getParameter("id"));
            objUserSer.delete(id);
            res.sendRedirect("User.htm?menu=User&action=show_All&flag=2");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
