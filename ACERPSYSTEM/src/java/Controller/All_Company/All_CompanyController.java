/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.All_Company;

import Services.All_Company.All_CompanyService;
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
public class All_CompanyController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("All_Company_Info");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltCom,msg;
            All_CompanyService objAComSer = new All_CompanyService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_Adnotify());
            /* All comapny Services start */
            ltCom = objAComSer.get_data();
            mv.addObject("dataCom", ltCom);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
