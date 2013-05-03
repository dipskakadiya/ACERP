/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Structure;

import Services.Structure.StructureService;
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
public class StructureController extends MultiActionController {
    
    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Structure");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,ltAdmin,ltUser;
             StructureService objStrucser = new StructureService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
             mv.addObject("Datanotify", objComSer.get_Adnotify());
            /*Current Login Users*/
            ltAdmin=objStrucser.get_Admin();
            mv.addObject("DataAdmin", ltAdmin);
            ltUser=objStrucser.get_User();
            mv.addObject("DataUser", ltUser);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
    
}
