/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.BlogDisplay;

import Services.BlogDisplay.BlogDisplayService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author KRISHNA
 */
public class BlogDisplayController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("BlogDisplay");
        try {
            List ltblog;
            BlogDisplayService objservice = new BlogDisplayService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            ltblog = objservice.Display();
            mv.addObject("ltblog", ltblog);
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }
}
