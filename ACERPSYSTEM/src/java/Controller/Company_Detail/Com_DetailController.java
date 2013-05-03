/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Company_Detail;

import Bean.Company_Detail.Com_DetailBean;
import Services.Company_Detail.Com_DetailService;
import Services.common.common;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class Com_DetailController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Company_Detail");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltCP, msg,per;
            Com_DetailService objCPSer = new Com_DetailService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }

            /* Com detil services start */
            ltCP = objCPSer.get_data(session.getAttribute("User_count"));
            mv.addObject("DataCP", ltCP);
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, Com_DetailBean objbean) {
        ModelAndView mv = new ModelAndView("Company_Detail");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            Com_DetailService objCPSer = new Com_DetailService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_count"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }

            /* Com detil services start */
            objCPSer.Save(objbean);
            session.setAttribute("Com_name", objbean.getCom_Name());
            res.sendRedirect("Company_Detail.htm?menu=Company_Detail&flag=1&action=show");
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }
}
