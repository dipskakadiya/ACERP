/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.S_JvEntry;

import java.util.List;
import Bean.S_JvEntry.S_JvEntryBean;
import Services.S_JvEntry.S_JvEntryService;
import Services.common.common;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import javax.servlet.ServletException;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
/**
 *
 * @author Krishna
 */
public class S_JvEntryContoller extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("S_JvEntry");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltSJV, ltAc, msg, per;
            Integer Bill_no;
            S_JvEntryService objSjvSer = new S_JvEntryService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Single JVEntry services start */
            Bill_no = objSjvSer.get_Bno();
            Bill_no += 1;
            mv.addObject("BNo", Bill_no);
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
            ltSJV = objSjvSer.get_data();
            mv.addObject("dataSJV", ltSJV);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_All(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Sjv_All");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltSJV, ltAc, msg, per;
            S_JvEntryService objSjvSer = new S_JvEntryService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Single JVEntry services start */
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
            ltSJV = objSjvSer.get_data();
            mv.addObject("dataSJV", ltSJV);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, S_JvEntryBean objbean) {
        ModelAndView mv = new ModelAndView("S_JvEntry");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            S_JvEntryService objSjvSer = new S_JvEntryService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Single JVEntry services start */
            Integer f = Integer.parseInt(req.getParameter("flag"));
            objSjvSer.Save(objbean, f);
            if (f == 1) {
                res.sendRedirect("S_JvEntry.htm?menu=S_JvEntry&action=show_All&flag=3");
            } else {
                res.sendRedirect("S_JvEntry.htm?menu=S_JvEntry&action=show&flag=2&id=0");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;

    }

    public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("S_JvEntry");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            S_JvEntryService objSjvSer = new S_JvEntryService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Single JVEntry services start */
            Integer id = Integer.parseInt(req.getParameter("id"));
            objSjvSer.delete(id);
            res.sendRedirect("S_JvEntry.htm?menu=S_JvEntry&action=show_All&flag=2");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;

    }

    public ModelAndView ExportToCSV(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, lt, per;
            S_JvEntryService objItemSer = new S_JvEntryService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */

            /* Accoutn services start */
            lt = objItemSer.export();
            String SelectedField[] = {"Bill No","Entry Date","Debit Account","Credit Account","Total Amount"};
            String field[] = {"BILL_NO","ENTRY_DATE","DR_AC","CR_AC","TOTAL_AMOUNT"};
            try {
                res.setContentType("application/vnd.ms-excel");
                res.setHeader("Content-Disposition", "attachment; filename=Jvinfo_OAS.csv");
                WritableWorkbook w = Workbook.createWorkbook(res.getOutputStream());
                if (lt != null && lt.size() != 0) {
                    WritableSheet s = w.createSheet("Demo", 0);
                    for (int j = 0, i = SelectedField.length - 1; j < SelectedField.length; j++, i--) {
                        s.addCell(new Label(i, 0, SelectedField[i]));
                    }
                    for (int i = 0; i < lt.size(); i++) {
                        HashMap mapdata = (HashMap) lt.get(i);
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
            res.sendRedirect("S_JvEntry.htm?menu=S_JvEntry&action=show_All&flag=4");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
