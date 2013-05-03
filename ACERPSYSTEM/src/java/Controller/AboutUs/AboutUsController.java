/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.AboutUs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author KRISHNA
 */
public class AboutUsController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("AboutUsOut");
        return mv;
    }
}
