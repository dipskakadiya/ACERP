/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Contect;

import Bean.Contact.ContactBean;
import Services.Contact.ContactService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author sai
 */
public class ContectController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Contect");
        return mv;
    }

    public ModelAndView Send(HttpServletRequest req, HttpServletResponse res, ContactBean objbean) {
        ModelAndView mv = new ModelAndView("Contect");
        try {
            ContactService objservice = new ContactService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            objservice.Send(objbean);
            res.sendRedirect("Contect.htm?action=show");
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }
}
