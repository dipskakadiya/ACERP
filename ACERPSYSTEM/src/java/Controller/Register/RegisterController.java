/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Register;

import Bean.Register.RegisterBean;
import Services.Register.RegisterService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author KRISHNA
 */
public class RegisterController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Register");
        return mv;
    }

    public ModelAndView Register(HttpServletRequest req, HttpServletResponse res, RegisterBean objbean) {
        ModelAndView mv = new ModelAndView("Register");
        try {
            RegisterService objservice = new RegisterService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
             String str = getServletContext().getRealPath("images");
            objservice.Register(objbean,str);
            res.sendRedirect("Login.htm?action=show");
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;

    }
}
