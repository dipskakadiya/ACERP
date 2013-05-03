/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Currency;

import Bean.Currency.CurrencyBean;
import Services.Currency.CurrencyService;
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
public class CurrencyController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Currency");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltCur, msg, per;
            CurrencyService objservices = new CurrencyService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */
            ltCur = objservices.get_data();
            mv.addObject("dataCur", ltCur);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Search(HttpServletRequest req, HttpServletResponse res, CurrencyBean objBean) {
        ModelAndView mv = new ModelAndView("Currency");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltCur, msg, per;
            CurrencyService objservices = new CurrencyService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */
            ltCur = objservices.Search(objBean);
            mv.addObject("dataCur", ltCur);
            // res.sendRedirect("Currency.htm?menu=Currency&user=A&flag=0&action=show");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;

    }
}
