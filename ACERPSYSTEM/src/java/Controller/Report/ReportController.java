/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Report;

import Bean.Report.ReportBean;
import Services.Report.ReportService;
import Services.common.common;
import Utilites.ConnectionClass;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import java.util.HashMap;
import javax.servlet.ServletException;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

/**
 *
 * @author sai
 */
public class ReportController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Report");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltAc, msg, per;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_CReportAll(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Custom_ReportAll");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, Reports, per;
            ReportService objRepSer = new ReportService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            Reports = objRepSer.getAllreports();
            mv.addObject("Data", Reports);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_CReport(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Custom_Report");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Run(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Custom_ReportsRun");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, Reports, fields, per;
            ReportService objRepSer = new ReportService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /*Reports services*/
            String id = req.getParameter("id");
            fields = objRepSer.getFields(id);
            mv.addObject("fields", fields);
            Reports = objRepSer.RunReport(id);
            mv.addObject("Data", Reports);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Delete(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Custom_ReportAll");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, Reports, fields, per;
            ReportService objRepSer = new ReportService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /*Reports services*/
            String id = req.getParameter("id");
            objRepSer.delete(id);
            res.sendRedirect("Report.htm?menu=Report&action=show_CReportAll");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Create_Report(HttpServletRequest req, HttpServletResponse res, ReportBean objBean) {
        ModelAndView mv = new ModelAndView("Custom_Report");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            ReportService objRepSer = new ReportService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            objRepSer.Create_rpt(objBean);
            res.sendRedirect("Report.htm?menu=Report&action=show_CReportAll");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Show_Ledger(HttpServletRequest req, HttpServletResponse res, ReportBean objBean) {
        ModelAndView mv = new ModelAndView("Report");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltAc, ltLedger, msg, per;
            Integer Ac_no;
            ReportService objRepSer = new ReportService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
            Ac_no = objBean.getAccount_No();
            mv.addObject("AcNo", Ac_no);
            ltLedger = objRepSer.get_Ledger(objBean);
            mv.addObject("dataLedger", ltLedger);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Show_Item_Stock(HttpServletRequest req, HttpServletResponse res, ReportBean objBean) {
        ModelAndView mv = new ModelAndView("ItemStockReport");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltItStock, msg, per;
            ReportService objRepSer = new ReportService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            ltItStock = objRepSer.get_ItStock();
            mv.addObject("dataStock", ltItStock);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView ItStDt(HttpServletRequest req, HttpServletResponse res, ReportBean objBean) {
        ModelAndView mv = new ModelAndView("ItemStDetail");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltItStock, msg, per;
            ReportService objRepSer = new ReportService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            String id = req.getParameter("id");
            String ty = req.getParameter("ty");
            ltItStock = objRepSer.get_ItStDt(id,ty);
            mv.addObject("dataStock", ltItStock);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

  
    public ModelAndView ExportLegder(HttpServletRequest req, HttpServletResponse res, ReportBean objBean) {
        ModelAndView mv = new ModelAndView("Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, lt, per;
            ReportService objItemSer = new ReportService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
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
            lt = objItemSer.exportLedger(objBean);
            String SelectedField[] = {"Bill No", "Bill Date", "Perticuler", "Account Amount", "type"};
            String field[] = {"BILL_NO", "BILL_DATE", "PERTICULER", "AC_AMOUNT", "TYPE"};
            try {
                res.setContentType("application/vnd.ms-excel");
                res.setHeader("Content-Disposition", "attachment; filename=Reportsinfo_OAS.csv");
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
                                s.addCell(new Label(k, i + 1, "0"));
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
            res.sendRedirect("Report.htm?menu=Report&action=show");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView ExportItemStock(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, lt, per;
            ReportService objItemSer = new ReportService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
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
            lt = objItemSer.exportITstAll();
            String SelectedField[] = {"Item Name", "OpStock", "Purchase", "Sales", "Purchase Retune", "Sales Retuen", "Stock", "Stock values"};
            String field[] = {"ITEM_NAME", "OP_STOCK", "PURCHASE", "SALES", "PURCHASE_RTN", "SALES_RTN", "STOCK", "ItemValues"};
            try {
                res.setContentType("application/vnd.ms-excel");
                res.setHeader("Content-Disposition", "attachment; filename=Reportsinfo_OAS.csv");
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
                                s.addCell(new Label(k, i + 1, "0"));
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
            res.sendRedirect("Report.htm?menu=Report&action=show");

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
            ReportService objItemSer = new ReportService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
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

            String id = req.getParameter("id");
            lt = objItemSer.getFields(id);
            String SelectedField[] = null;
            String field[] = null;
            if (lt != null) {
                HashMap mapdata = (HashMap) lt.get(0);
                SelectedField = mapdata.get("ALIES").toString().split(",");
                field = mapdata.get("FIELDS").toString().split(",");
            }
            lt = objItemSer.RunReport(id);
            try {
                res.setContentType("application/vnd.ms-excel");
                res.setHeader("Content-Disposition", "attachment; filename=Reportsinfo_OAS.csv");
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
                                s.addCell(new Label(k, i + 1, "0"));
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
            res.sendRedirect("Report.htm?menu=Report&action=show");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
