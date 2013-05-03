/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Setting;

import Bean.Setting.SettingBean;
import Services.Setting.SettingService;
import Services.common.common;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import java.io.File;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author sai
 */
public class SettingController extends MultiActionController {

    private String destinationDir = "D:/TYBCA/ACERPSYSTEM/build/web/Backup_Clients/";

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Setting");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            
            /* Setting services start */
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_Rcovery(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Rcovery");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_Year(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Year");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView BackUp(HttpServletRequest req, HttpServletResponse res, SettingBean objBean) {
        ModelAndView mv = new ModelAndView("Setting");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
            objSetSer.Get_Backup(objBean,session.getAttribute("db").toString());
            res.sendRedirect("Setting.htm?menu=Setting&action=show&flag=1");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Recovery(HttpServletRequest req, HttpServletResponse res, SettingBean objBean) {
        ModelAndView mv = new ModelAndView("Setting");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            MultipartFile file = objBean.getR_file();
            File destination = new File(destinationDir + "R_"+ file.getOriginalFilename());
            file.transferTo(destination);
            /* Setting services start */
            objSetSer.Get_Restore(objBean,session.getAttribute("User_Id").toString());
            res.sendRedirect("Setting.htm?menu=Setting&action=show_Rcovery&recover=1");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Add_Bank(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("AddBank");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, ltBk, per;
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
            ltBk = objSetSer.get_bank();
            mv.addObject("dataBank", ltBk);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, SettingBean objBean) {
        ModelAndView mv = new ModelAndView("Setting");
        try {
            /* Variable define */
            Integer f = Integer.parseInt(req.getParameter("flag"));/* insert/update flag */
            // Integer id = Integer.parseInt(req.getParameter("id"));
            HttpSession session = req.getSession();
            List msg, per;
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
            objSetSer.Save(objBean, f);
            res.sendRedirect("Setting.htm?menu=Setting&flag=2&action=Add_Bank");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Delete(HttpServletRequest req, HttpServletResponse res, SettingBean objBean) {
        ModelAndView mv = new ModelAndView("Setting");
        try {
            HttpSession session = req.getSession();
            Integer id = Integer.parseInt(req.getParameter("id"));
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Variable define */
            List msg, per;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
            objSetSer.Delete(id);
            res.sendRedirect("Setting.htm?menu=Setting&flag=0&action=Add_Bank");
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }

    public ModelAndView Add_Tax(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("AddTax");
        try {
            /* Variable define */

            HttpSession session = req.getSession();
            List msg, ltTax, per;
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
            ltTax = objSetSer.get_Tax();
            mv.addObject("dataTax", ltTax);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView save(HttpServletRequest req, HttpServletResponse res, SettingBean objBean) {
        ModelAndView mv = new ModelAndView("Setting");
        try {
            /* Variable define */
            Integer f = Integer.parseInt(req.getParameter("flag"));/* insert/update flag */
            // Integer id = Integer.parseInt(req.getParameter("id"));
            HttpSession session = req.getSession();
            List msg, per;
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
            objSetSer.save(objBean, f);
            res.sendRedirect("Setting.htm?menu=Setting&flag=2&action=Add_Tax");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView delete(HttpServletRequest req, HttpServletResponse res, SettingBean objBean) {
        ModelAndView mv = new ModelAndView("Setting");
        try {
            HttpSession session = req.getSession();
            Integer id = Integer.parseInt(req.getParameter("id"));
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Variable define */
            List msg, per;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
            objSetSer.delete(id);
            res.sendRedirect("Setting.htm?menu=Setting&flag=0&action=Add_Tax");
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }

    public ModelAndView AC_Head(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ac_Head");
        try {
            /* Variable define */

            HttpSession session = req.getSession();
            List msg, per;
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
            mv.addObject("dataAH", objSetSer.get_AcHead());
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView save_AcHead(HttpServletRequest req, HttpServletResponse res, SettingBean objBean) {
        ModelAndView mv = new ModelAndView("Ac_Head");
        try {
            /* Variable define */
            Integer f = Integer.parseInt(req.getParameter("flag"));/* insert/update flag */
            // Integer id = Integer.parseInt(req.getParameter("id"));
            HttpSession session = req.getSession();
            List msg, per;
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
            objSetSer.save_Ah(objBean, f);
            res.sendRedirect("Setting.htm?menu=Setting&flag=2&action=AC_Head");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView deleteACHD(HttpServletRequest req, HttpServletResponse res, SettingBean objBean) {
        ModelAndView mv = new ModelAndView("Setting");
        try {
            HttpSession session = req.getSession();
            Integer id = Integer.parseInt(req.getParameter("id"));
            SettingService objSetSer = new SettingService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Variable define */
            List msg, per;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Setting services start */
            objSetSer.deleteAh(id);
            res.sendRedirect("Setting.htm?menu=Setting&flag=3&action=AC_Head");
        } catch (Exception e) {
            System.out.print(e);
        }
        return mv;
    }
}
