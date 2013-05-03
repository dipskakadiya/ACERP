/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Blog;

import Bean.Blog.BlogBean;
import Services.Blog.BlogService;
import Services.common.common;
import java.util.List;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author KRISHNA
 */
public class BlogController extends MultiActionController {

    private String destinationDir1 = "D:/TYBCA/ACERPSYSTEM/build/web/images/BlogImage/";
    private String destinationDir = "D:/TYBCA/ACERPSYSTEM/web/images/BlogImage/";

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Blog");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_Adnotify());
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, BlogBean objbean) {
        ModelAndView mv = new ModelAndView("Blog");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            BlogService objservice = new BlogService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_Adnotify());
            objservice.Save(objbean, session.getAttribute("User_Id"));
            if (objbean.getImage().getOriginalFilename() != null) {
                MultipartFile file = objbean.getImage();
                File destination = new File(destinationDir +  file.getOriginalFilename());
                file.transferTo(destination);
                File destination1 = new File(destinationDir1 + file.getOriginalFilename());
                file.transferTo(destination1);
                session.setAttribute("Image", objbean.getImage().getOriginalFilename());
            }

            res.sendRedirect("Blog.htm?menu=Blog&flag=0&action=show");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
