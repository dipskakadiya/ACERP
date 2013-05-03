/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Request;

import Services.Request.RequestService;
import Services.common.common;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author KRISHNA
 */
public class RequestController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Request");
        try {
            /* Variable define */
            RequestService objReq = new RequestService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            HttpSession session = req.getSession();
            List msg, ltReq;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
             mv.addObject("Datanotify", objComSer.get_Adnotify());
            ltReq = objReq.get_data();
            mv.addObject("dataRq", ltReq);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
