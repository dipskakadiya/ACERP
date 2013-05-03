/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Trade_management;

import Bean.Report.ReportBean;
import Bean.Trade.TradeBean;
import Services.Trade.TradeService;
import Services.common.Ajex;
import Services.common.common;
import Utilites.ConnectionClass;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import javax.servlet.ServletOutputStream;
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

/**
 *
 * @author sai
 */
public class TradeController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Trade");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltTM, ltCur, ltTD, ltICTG, msg,per;
            Integer Bill_no;
            TradeService objTradeSer = new TradeService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trade services start */
            Bill_no = objTradeSer.get_Bill_no();
            Bill_no += 1;
            mv.addObject("Bill_no", Bill_no);
            ltICTG = objTradeSer.get_TCtg();
            mv.addObject("dataCtg", ltICTG);
            ltTM = objTradeSer.get_data();
            mv.addObject("dataTM", ltTM);
            ltCur = objTradeSer.get_data1();
            mv.addObject("dataCur", ltCur);
            ltTD = objTradeSer.get_data2();
            mv.addObject("dataTD", ltTD);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_All(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Trade_All");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltTrade, ltAc, msg,per;
            TradeService objTradeSer = new TradeService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trade services start */
            ltTrade = objTradeSer.get_data();
            mv.addObject("dataTrade", ltTrade);
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, TradeBean objBean) {
        ModelAndView mv = new ModelAndView("Trade");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TradeService objTradeSer = new TradeService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trade services start */
            Integer f = Integer.parseInt(req.getParameter("flag"));
            objTradeSer.Save(objBean, f);
            if (f == 1) {
                res.sendRedirect("Trade.htm?menu=Trade&flag=3&action=show_All&pid=" + objBean.getSr_Bill_No());
            } else {
                res.sendRedirect("Trade.htm?menu=Trade&flag=2&action=show&id=0&pid=" + objBean.getSr_Bill_No());
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Trade");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TradeService objTradeSer = new TradeService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trade services start */
            Integer id = Integer.parseInt(req.getParameter("id"));
            objTradeSer.delete(id);
            res.sendRedirect("Trade.htm?menu=Trade&flag=2&action=show_All");
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
            jasperReport = JasperCompileManager.compileReport(getServletContext().getRealPath("WEB-INF/classes/Reports/PIReports1.jrxml"));
            jasperPrint = JasperFillManager.fillReport(
                    jasperReport, new HashMap(), new ConnectionClass(session.getAttribute("db").toString()).getConnection());
//            JasperExportManager.exportReportToPdfFile(jasperPrint, getServletContext().getRealPath("WEB-INF/classes/Reports/PIReports1.pdf"));
        } catch (JRException e) {
            e.printStackTrace();
        }
        try {
            ServletOutputStream servletOutputStream = res.getOutputStream();
            File reportFile = new File(getServletContext().getRealPath("WEB-INF/classes/Reports/PIReports1.jasper"));
            byte[] bytes = null;
            try {
                HashMap hm = new HashMap();
                hm.put("test", req.getParameter("pid"));
                hm.put("Company_Name",session.getAttribute("Com_name"));
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
            List msg, lt, lt1,per;
            TradeService objTradeSer = new TradeService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Accoutn services start */
            lt = objTradeSer.export();
            String SelectedField[] = {"Trade Type", "Bill_no", "Account Name", "Bill Date", "Total Qty", "DISCOUNT", "TOTAL GROSS", "TOTAL TAX", "TOTAL AMOUNT", "BILL MODE"};
            String field[] = {"BOOK_NAME", "BILL_NO", "ac_name", "BILL_DATE", "TOTAL_QTY", "DISCOUNT", "TOTAL_GROSS", "TOTAL_TAX", "TOTAL_AMOUNT", "BILL_MODE"};
            String SelectedField1[] = {"Bill No", "Item Name", "Oty", "Rate", "Gross Total", "Total Tax", "Total"};
            String field1[] = {"Bill_no", "item_name", "QTY", "RATE", "G_TOTAL", "T_TAX", "TOTAL"};
            lt1 = objTradeSer.export1();
            try {
                res.setContentType("application/vnd.ms-excel");
                res.setHeader("Content-Disposition", "attachment; filename=Tradeinfo_OAS.csv");
                WritableWorkbook w = Workbook.createWorkbook(res.getOutputStream());
                if (lt != null && lt.size() != 0) {
                    WritableSheet s = w.createSheet("Demo", 0);
                    for (int j = 0, i = SelectedField.length - 1; j < SelectedField.length; j++, i--) {
                        s.addCell(new Label(i, 0, SelectedField[i]));
                    }
                    int c = 0;
                    for (int i = 0; i < lt.size(); i++) {
                        HashMap mapdata = (HashMap) lt.get(i);
                        for (int j = 0, k = mapdata.size() - 1; j < mapdata.size(); j++, k--) {
                            if (mapdata.get(field[k]) != null) {
                                s.addCell(new Label(k, c + 1, mapdata.get(field[k]).toString()));
                            } else {
                                s.addCell(new Label(k, c + 1, ""));
                            }
                        }
                        c++;
                        if (lt1 != null && lt1.size() != 0) {
                            for (int p = 0, q = SelectedField1.length - 1; p < SelectedField1.length; p++, q--) {
                                s.addCell(new Label(q + 1, c + 1, SelectedField1[q]));
                            }
                            c++;
                            for (int p = 0; p < lt1.size(); p++) {
                                HashMap mapdata1 = (HashMap) lt1.get(p);
                                for (int q = 0, r = mapdata1.size() - 1; q < mapdata1.size(); q++, r--) {
                                    if (mapdata.get("Bill_no").equals(mapdata1.get("Bill_no")) == true) {
                                        if (mapdata1.get(field1[r]) != null) {
                                            s.addCell(new Label(r + 1, c + 1, mapdata1.get(field1[r]).toString()));
                                        } else {
                                            s.addCell(new Label(r + 1, c + 1, ""));
                                        }
                                    }
                                }
                                if (mapdata.get("Bill_no").equals(mapdata1.get("Bill_no")) == true) {
                                    c++;
                                }
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
            res.sendRedirect("Trade.htm?menu=Trade&flag=4&action=show_All");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
    
    public ModelAndView Item3dtagshow(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("3dImade_Create");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("S_Admin")) {
                mv.addObject("Datanotify", objComSer.get_Adnotify());
            } else {
                mv.addObject("Datanotify", objComSer.get_notify());
            }
             Ajex objComSer1 = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            mv.addObject("data",objComSer1.get_itag());
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
    
    public ModelAndView Item3dtag(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("3dImade_Show");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            if (session.getAttribute("User_Type").toString().equals("S_Admin")) {
                mv.addObject("Datanotify", objComSer.get_Adnotify());
            } else {
                mv.addObject("Datanotify", objComSer.get_notify());
            }
             Ajex objComSer1 = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            mv.addObject("data",objComSer1.get_itag());
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

}
