/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Send_Mail;

import Bean.Send_Mail.Send_MailBean;
import Services.Send_Mail.Send_MailService;
import Services.common.common;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KRISHNA
 */
public class Send_MailContorller extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Send_Mail");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltreq,msg,per,ltAdmin,ltMR;
            Send_MailService objSMSer = new Send_MailService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
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
            /* Message services start*/
             ltreq = objSMSer.get_data();
            mv.addObject("dataReq", ltreq);
            ltMR=objSMSer.get_MR(session.getAttribute("User_Type"),session.getAttribute("User_Id"));
            mv.addObject("dataMR", ltMR);
            ltAdmin=objSMSer.get_Admin(session.getAttribute("User_Id"));
            mv.addObject("dataAdmin",ltAdmin);
           
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Send(HttpServletRequest req, HttpServletResponse res, Send_MailBean objbean) {
        ModelAndView mv = new ModelAndView("Send_Mail");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            Send_MailService objSMSer = new Send_MailService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
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
            /* Message services start*/
  
            objSMSer.Send(objbean, session.getAttribute("User_Id"),session.getAttribute("User_Type"));
            res.sendRedirect("Send_Mail.htm?menu=Send_Mail&flag=2&action=show");
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }

    public ModelAndView show_CReplay(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Send_Email");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltreq,msg;
            Send_MailService objSMSer = new Send_MailService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_Adnotify());
            /* Message services start*/
            ltreq = objSMSer.get_Contect();
            mv.addObject("dataCont", ltreq);
                    } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
    
     public ModelAndView Send_Email(HttpServletRequest req, HttpServletResponse res, Send_MailBean objbean) {
        ModelAndView mv = new ModelAndView("Send_Email");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            Send_MailService objSMSer = new Send_MailService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_Adnotify());
            /* Message services start*/
            System.out.println("enter");
              objSMSer.SendEmail(objbean);
            res.sendRedirect("Send_Mail.htm?menu=Send_Mail&flag=2&action=show_CReplay");
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }
}
