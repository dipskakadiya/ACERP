/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Dashboard;

import Services.Dashboard.DashboardService;
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
public class DashboardController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Dashboard");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per, Pur_chart, Sal_chart, TopAc_chart, Topitem_chart, payment;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Dashboard sservices Start */
            DashboardService objDBSer = new DashboardService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            Pur_chart = objDBSer.Purchase_chart();
            mv.addObject("PurChart", Pur_chart);
            Sal_chart = objDBSer.Sales_chart();
            mv.addObject("SalChart", Sal_chart);
            TopAc_chart = objDBSer.Top_Ac();
            mv.addObject("TopAc", TopAc_chart);
            Topitem_chart = objDBSer.All_item();
            mv.addObject("ItemAll", Topitem_chart);

            /* Call Method for sms for due */
            objDBSer.due_insert(session.getAttribute("User_Id"));
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
