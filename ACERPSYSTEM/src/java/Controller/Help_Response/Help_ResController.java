/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Help_Response;

import Services.Help_Response.Help_ResponseService;
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
public class Help_ResController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Help_Response");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltReq,msg;
            Help_ResponseService objHRSer = new Help_ResponseService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_Adnotify());
            /* Help Rsponce services Start*/
            ltReq = objHRSer.get_data();
            mv.addObject("dataReq", ltReq);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
