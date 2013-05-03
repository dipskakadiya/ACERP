/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Payment;

import Services.common.common;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KRISHNA
 */
public class PaymentController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Payment");
        return mv;
    }

    public ModelAndView Update(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Payment");
        try {
            HttpSession session = req.getSession();
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),"Admindb");
            String User = req.getParameter("id");
            String Amount = req.getParameter("Amount");
            objComSer.Payment(User, Amount);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
