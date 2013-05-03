/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Item_management;

import Bean.Item.ItemBean;
import Services.Item.ItemService;
import Services.common.common;
import java.util.List;
import java.io.File;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
public class ItemController extends MultiActionController {

    private String destinationDir = "D:/TYBCA/ACERPSYSTEM/build/web/images/Product/";
    private String destinationDir1 = "D:/TYBCA/ACERPSYSTEM/web/images/Product/";

    public ModelAndView show_Cat(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Item_Cat");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltICTG, msg, per;
            Integer Ctg_id;
            ItemService objItemSer = new ItemService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Item services start */
            Ctg_id = objItemSer.get_Ctg_id();
            Ctg_id += 1;
            mv.addObject("Ctg_id", Ctg_id);
            ltICTG = objItemSer.get_TCtg();
            mv.addObject("dataCtg", ltICTG);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Searching(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Searching_Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltICTG, msg, per;
            ItemService objItemSer = new ItemService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Item services start */
            //ltICTG = objItemSer.get_TCtg();
            //mv.addObject("dataCtg", ltICTG);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_CatAll(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Item_Cat_All");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltICTG, msg, per;
            ItemService objItemSer = new ItemService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Item services start */
            ltICTG = objItemSer.get_TCtg();
            mv.addObject("dataCtg", ltICTG);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltItem, ltTax, ltAllTax, ltICtg, msg, per;
            Integer itemid;
            ItemService objItemSer = new ItemService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Item services start */
            destinationDir = getServletContext().getRealPath("images/Product");
            System.out.println(destinationDir);
            ltItem = objItemSer.get_data();
            mv.addObject("dataItem", ltItem);
            ltICtg = objItemSer.get_TCtg();
            mv.addObject("dataCtg", ltICtg);
            ltTax = objItemSer.get_Tax();
            mv.addObject("dataTax", ltTax);
            ltAllTax = objItemSer.get_AllTax();
            mv.addObject("dataAllTax", ltAllTax);
            itemid = objItemSer.getItem_Id();
            itemid += 1;
            mv.addObject("ItemId", itemid);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_All(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Item_All");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltItem, msg, per;
            ItemService objItemSer = new ItemService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Item services start */
            ltItem = objItemSer.get_data();
            mv.addObject("dataItem", ltItem);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Ctg_Save(HttpServletRequest req, HttpServletResponse res, ItemBean objBean) {
        ModelAndView mv = new ModelAndView("Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            ItemService objItemSer = new ItemService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Item services start */
            Integer f = Integer.parseInt(req.getParameter("flag"));/* insert/update flag */
            objItemSer.Ctg_Save(objBean, f);
            if (f == 1) {
                res.sendRedirect("Item.htm?menu=Item&flag=3&action=show_CatAll");
            } else {
                res.sendRedirect("Item.htm?menu=Item&flag=2&action=show_Cat&id=0");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;

    }

    public ModelAndView Save(HttpServletRequest req, HttpServletResponse res, ItemBean objBean) {
        ModelAndView mv = new ModelAndView("Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            ItemService objItemSer = new ItemService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Item services start */
            Integer f = Integer.parseInt(req.getParameter("flag"));
            objItemSer.Save(objBean, f);
            if (objBean.getImage().getOriginalFilename() != null) {
                MultipartFile file = objBean.getImage();
                File destination = new File(destinationDir + objBean.getItem_Code() + file.getOriginalFilename());
                file.transferTo(destination);
                File destination1 = new File(destinationDir1 + objBean.getItem_Code() + file.getOriginalFilename());
                file.transferTo(destination1);
            }
            if (f == 1) {
                res.sendRedirect("Item.htm?menu=Item&flag=3&action=show_All");
            } else {
                res.sendRedirect("Trade.htm?action=Item3dtagshow&menu=Item&flag=0");
            }
            res.flushBuffer();
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;

    }

    public ModelAndView delete_Ctg(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            ItemService objItemSer = new ItemService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Item services start */
            Integer id = Integer.parseInt(req.getParameter("id"));
            objItemSer.delete_Ctg(id);
            res.sendRedirect("Item.htm?menu=Item&flag=2&action=show_CatAll");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg, per;
            ItemService objItemSer = new ItemService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Item services start */
            Integer id = Integer.parseInt(req.getParameter("id"));
            objItemSer.delete(id);
            res.sendRedirect("Item.htm?menu=Item&flag=2&action=show_All");
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
            ItemService objItemSer = new ItemService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
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
            lt = objItemSer.export();
            String SelectedField[] = {"Item Name", "Category Name", "Opening Stock", "Opening Rate", "Opening Amount", "Sales Rate", "Reorder level"};
            String field[] = {"ITEM_NAME", "CTG_NAME", "OP_STOCK", "OP_RATE", "OP_AMOUNT", "SALES_RATE", "REORDER_LEVEL"};
            try {
                res.setContentType("application/vnd.ms-excel");
                res.setHeader("Content-Disposition", "attachment; filename=Iteminfo_OAS.csv");
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
            res.sendRedirect("Item.htm?menu=Item&flag=4&action=show_All");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
    
        
}
