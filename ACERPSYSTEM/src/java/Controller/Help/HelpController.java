/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Help;

import Bean.Help.HelpBean;
import Services.Help.HelpService;
import Services.common.common;
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
public class HelpController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Help");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Send(HttpServletRequest req, HttpServletResponse res, HelpBean objbean) {
        ModelAndView mv = new ModelAndView("Help");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            HelpService objHelpSer = new HelpService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            objHelpSer.Send(objbean,session.getAttribute("User_Id"));
            res.sendRedirect("Help.htm?menu=Help&action=show&flag=1");
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
