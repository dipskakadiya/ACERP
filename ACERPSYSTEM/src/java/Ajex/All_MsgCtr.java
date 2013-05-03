/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Ajex;

import Services.Account.AcService;
import java.util.List;
import Services.common.common;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author sai
 */
public class All_MsgCtr extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("All_Msg");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            objComSer.Msg_Read();
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("S_Admin")) {
                mv.addObject("Datanotify", objComSer.get_Adnotify());
            } else {
                mv.addObject("Datanotify", objComSer.get_notify());
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

        public ModelAndView show_Notify(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("All_Notify");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            objComSer.Ntf_Read();
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("S_Admin")) {
                mv.addObject("Datanotify", objComSer.get_Adnotify());
            } else {
                mv.addObject("Datanotify", objComSer.get_notify());
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    
    
    public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("All_Msg");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("S_Admin")) {
                mv.addObject("Datanotify", objComSer.get_Adnotify());
            } else {
                mv.addObject("Datanotify", objComSer.get_notify());
            }
            Integer id = Integer.parseInt(req.getParameter("id"));/* id for delete Record */
            objComSer.delete(id);
            /* Delete info */
            res.sendRedirect("All_Msg.htm?menu=AllMessage&action=show");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
    
    
    
}
