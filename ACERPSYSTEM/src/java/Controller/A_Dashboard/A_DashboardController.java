/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.A_Dashboard;

import Services.A_Dashboard.A_DashboardService;
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
public class A_DashboardController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Admin_Dashboard");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, ltAdLog, ltAdExp, ltBlg;
            A_DashboardService objA_Ser = new A_DashboardService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("Datanotify", objComSer.get_Adnotify());
            mv.addObject("DataMsg", msg);
            /*Current Login Users*/
            ltAdLog = objA_Ser.get_dateLo();
            mv.addObject("dataA_Log", ltAdLog);
            /*Expiry time Remaining*/
            ltAdExp = objA_Ser.get_dateEx();
            mv.addObject("dataExp", ltAdExp);
            /*Blog Display*/
            ltBlg = objA_Ser.get_dateBlg();
            mv.addObject("dataBlg", ltBlg);
            mv.addObject("datapayment", objA_Ser.Payment());
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
