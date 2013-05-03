/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Cash;

import Bean.Cash.CashBean;
import Services.Cash.CashService;
import Services.common.common;
import Utilites.ConnectionClass;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletOutputStream;

/**
 *
 * @author sai
 */
public class CashController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Cash");
        try {
            HttpSession session = req.getSession();
            List ltCtr, ltAc, ltCash, msg, ltCur, per;
            CashService objCtrSer = new CashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Bank Trade services start */
            ltAc = objComSer.get_AcTrade();
            mv.addObject("dataAC", ltAc);
            ltCash = objCtrSer.get_ACash();
            mv.addObject("dataCash", ltCash);
            ltCtr = objCtrSer.get_data();
            mv.addObject("dataCtr", ltCtr);
            ltCur = objCtrSer.get_data1();
            mv.addObject("dataCur", ltCur);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_All(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Cash_All");
        try {
            HttpSession session = req.getSession();
            List ltCtr, ltAc, msg, per;
            CashService objCtrSer = new CashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Bank Trade services start */
            ltCtr = objCtrSer.get_data();
            mv.addObject("dataCtr", ltCtr);
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, CashBean objBean) {
        ModelAndView mv = new ModelAndView("Cash");
        try {
            HttpSession session = req.getSession();
            List ltCtr, msg, per;
            CashService objCtrSer = new CashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Bank Trade services start */
            Integer f = Integer.parseInt(req.getParameter("flag"));
            Integer i=objCtrSer.Save(objBean, f);
            if (f == 1) {
                res.sendRedirect("Cash.htm?menu=Cash&flag=3&action=show_All&pid="+objBean.getTr_id());
            } else {
                res.sendRedirect("Cash.htm?menu=Cash&flag=2&action=show&id=0&pid="+i);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;

    }

    public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Cash");
        try {
            HttpSession session = req.getSession();
            List ltCtr, msg,per;
            CashService objCtrSer = new CashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }

            /* Bank Trade services start */
            Integer id = Integer.parseInt(req.getParameter("id"));
            objCtrSer.delete(id);
            res.sendRedirect("Cash.htm?menu=Cash&flag=2&action=show_All");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }


    public void print_bill(HttpServletRequest req, HttpServletResponse res) {
//        ConnectionClass conclass=new ConnectionClass();
        HttpSession session = req.getSession();
        JasperReport jasperReport = null;
        JasperPrint jasperPrint;
        try {
            jasperReport = JasperCompileManager.compileReport(getServletContext().getRealPath("WEB-INF/classes/Reports/PIReports3.jrxml"));
            jasperPrint = JasperFillManager.fillReport(
                    jasperReport, new HashMap(), new ConnectionClass(session.getAttribute("db").toString()).getConnection());
//            JasperExportManager.exportReportToPdfFile(jasperPrint, getServletContext().getRealPath("WEB-INF/classes/Reports/PIReports1.pdf"));
        } catch (JRException e) {
            e.printStackTrace();
        }
        try {
            ServletOutputStream servletOutputStream = res.getOutputStream();
            File reportFile = new File(getServletContext().getRealPath("WEB-INF/classes/Reports/PIReports3.jasper"));
            byte[] bytes = null;
            try {
                HashMap hm = new HashMap();
                hm.put("test", req.getParameter("pid"));
                hm.put("Company_Name", session.getAttribute("Com_name"));
                bytes = JasperRunManager.runReportToPdf(jasperReport,
                        hm, new ConnectionClass(session.getAttribute("db").toString()).getConnection());
                res.setContentType("application/pdf");
                res.setContentLength(bytes.length);
                servletOutputStream.write(bytes, 0, bytes.length);
                servletOutputStream.flush();
                servletOutputStream.close();
            } catch (JRException e) {
                // display stack trace in the browser
                StringWriter stringWriter = new StringWriter();
                PrintWriter printWriter = new PrintWriter(stringWriter);
                e.printStackTrace(printWriter);
                res.setContentType("text/plain");
                res.getOutputStream().print(stringWriter.toString());

            }
        } catch (Exception e) {
        }
    }

    public ModelAndView ExportToCSV(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, lt,per;
            CashService objCtrSer = new CashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
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
            lt = objCtrSer.export();
            String SelectedField[] = {"Tr Type", "Entry Date", "Bill No", "Account Name", "Total Amount"};
            String field[] = {"TR_TYPE", "ENTRY_DATE", "BILL_NO", "Ac_name", "TOTAL_AMOUNT"};
            try {
                res.setContentType("application/vnd.ms-excel");
                res.setHeader("Content-Disposition", "attachment; filename=CashTradeinfo_OAS.csv");
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
            res.sendRedirect("Cash.htm?menu=Cash&flag=4&action=show_All");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
