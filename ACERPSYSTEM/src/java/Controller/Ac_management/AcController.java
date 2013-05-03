/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Ac_management;

import Bean.Account.AcBean;
import Services.Account.AcService;
import Services.common.common;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

/**
 *
 * @author sai
 */
public class AcController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Account");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltAc, ltUBank, ltBank, ltAH, msg, per = null;
            Integer Ac_no;
            AcService objAcSer = new AcService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */
            Ac_no = objAcSer.get_Ac_no();
            Ac_no += 1;
            mv.addObject("Ac_no", Ac_no);
            ltAc = objAcSer.get_data();
            mv.addObject("dataAc", ltAc);
            ltAH = objAcSer.get_LtAcHead();
            mv.addObject("dataAH", ltAH);
            ltBank = objAcSer.get_Bank();
            mv.addObject("dataBank", ltBank);
            ltUBank = objAcSer.get_UBank();
            mv.addObject("dataUBank", ltUBank);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_All(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Account_view_all");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltAc, msg, per;
            AcService objAcSer = new AcService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */
            ltAc = objAcSer.get_data();
            mv.addObject("dataAc", ltAc);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, AcBean objBean) {
        ModelAndView mv = new ModelAndView("Account");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            AcService objAcSer = new AcService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */
            Integer f = Integer.parseInt(req.getParameter("flag"));
            objAcSer.Save(objBean, f);
            if (f == 1) {
                /* Update info */
                res.sendRedirect("Account.htm?action=show_All&menu=Account&flag=3");
            } else {
                /* insert info */
                res.sendRedirect("Account.htm?menu=Account&flag=2&action=show&id=0");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;

    }

    public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Account");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            AcService objAcSer = new AcService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */
            Integer id = Integer.parseInt(req.getParameter("id"));/* id for delete Record */
            objAcSer.delete(id);
            /* Delete info */
            res.sendRedirect("Account.htm?menu=Account&flag=2&action=show_All");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView ExportToCSV(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Account");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per, ltAc;
            AcService objAcSer = new AcService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */

            /* Accoutn services start */
            ltAc = objAcSer.export();
            String SelectedField[] = {"Account Name", "Head Name", "Opening Balance", "Balance Type", "REF_PERSON", "Address", "City", "State", "Country", "Contect No", "Phone No", "Email ID", "Limit", "Due Days"};
            String field[] = {"AC_NAME", "Head_NAME", "OP_BAL", "BAL_TYPE", "REF_PERSON", "C_ADDRESS", "CI_NAME", "S_NAME", "C_NAME", "CONTACT_NO", "PHONE_NO", "EMAIL_ID", "LIMIT", "DUE_DAYS"};
            try {
                res.setContentType("application/vnd.ms-excel");
                res.setHeader("Content-Disposition", "attachment; filename=Accountinfo_OAS.csv");
                WritableWorkbook w = Workbook.createWorkbook(res.getOutputStream());
                if (ltAc != null && ltAc.size() != 0) {
                    WritableSheet s = w.createSheet("Demo", 0);
                    for (int j = 0, i = SelectedField.length - 1; j < SelectedField.length; j++, i--) {
                        s.addCell(new Label(i, 0, SelectedField[i]));
                    }
                    for (int i = 0; i < ltAc.size(); i++) {
                        HashMap mapdata = (HashMap) ltAc.get(i);
                        for (int j = 0, k = mapdata.size() - 1; j < mapdata.size(); j++, k--) {
                            if (mapdata.get(field[k]) != null) {
                                s.addCell(new Label(k, i + 1, mapdata.get(field[k]).toString()));
                            } else {
                                s.addCell(new Label(k, i + 1, ""));
                            }
                        }
                    }
                }

                w.write();
                w.close();
            } catch (Exception e) {
                throw new ServletException("Exception in Excel Sample Servlet", e);
            }

            /* Delete info */
            res.sendRedirect("Account.htm?menu=Account&flag=4&action=show_All");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
