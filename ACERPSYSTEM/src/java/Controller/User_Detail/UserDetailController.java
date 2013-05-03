/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.User_Detail;

import Bean.User_Detail.UserDetailBean;
import Services.User_Detail.UserDetailService;
import Services.common.common;
import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author KRISHNA
 */
public class UserDetailController extends MultiActionController {

    private String destinationDir1 = "D:/TYBCA/ACERPSYSTEM/build/web/images/profile/";
    private String destinationDir = "D:/TYBCA/ACERPSYSTEM/web/images/profile/";

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("User_Detail");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltUP, msg, per;
            UserDetailService objUPSer = new UserDetailService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("S_Admin")) {
                mv.addObject("Datanotify", objComSer.get_Adnotify());
            } else {
                mv.addObject("Datanotify", objComSer.get_notify());
            }
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */
            ltUP = objUPSer.get_data(session.getAttribute("User_count"), session.getAttribute("User_Type"));
            mv.addObject("dataUP", ltUP);
        } catch (Exception e) {
            System.out.println(e);
        }

        return mv;
    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, UserDetailBean objbean) {
        ModelAndView mv = new ModelAndView("User_Detail");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            UserDetailService objUPSer = new UserDetailService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("S_Admin")) {
                mv.addObject("Datanotify", objComSer.get_Adnotify());
            } else {
                mv.addObject("Datanotify", objComSer.get_notify());
            }
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */
            objUPSer.Save(objbean, session.getAttribute("User_count"), session.getAttribute("User_Type"));

            if (objbean.getImage().getOriginalFilename() != null) {
                MultipartFile file = objbean.getImage();
                File destination = new File(destinationDir + objbean.getUser_Count() + file.getOriginalFilename());
                file.transferTo(destination);
                File destination1 = new File(destinationDir1 + objbean.getUser_Count() + file.getOriginalFilename());
                file.transferTo(destination1);
            }
            res.sendRedirect("User_Detail.htm?menu=User_Detail&user=A&flag=1&action=show");
            res.flushBuffer();
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }
}
