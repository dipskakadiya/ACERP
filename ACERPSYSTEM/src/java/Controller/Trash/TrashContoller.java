/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Trash;

import Bean.Trash.TrashBean;
import Services.Trash.TrashService;
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
public class TrashContoller extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltTrash, msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            ltTrash = objTrashSer.get_data("Ac_master");
            mv.addObject("dataTrash", ltTrash);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Restore(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Restore(objBean, "Ac_master", "Ac_id");
            objTrashSer.Restore(objBean, "user_bank", "Ac_id");
            res.sendRedirect("Trash.htm?action=show&menu=Trash&flag=2");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Delete(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Delete(objBean, "Ac_master", "Ac_id");
            objTrashSer.Delete(objBean, "user_bank", "Ac_id");
            res.sendRedirect("Trash.htm?action=show&menu=Trash&flag=3");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_Item(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Trash_Item");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltTrash, ltCtg, ltAc, msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
            ltTrash = objTrashSer.get_data("Item_master");
            mv.addObject("dataTrash", ltTrash);
            ltCtg = objTrashSer.get_data("item_Ctg");
            mv.addObject("dataCtg", ltCtg);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Restore_Item(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Restore(objBean, "item_master", "item_id");
            res.sendRedirect("Trash.htm?action=show_Item&menu=Trash&flag=4");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Restore_ICtg(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Restore(objBean, "item_Ctg", "Ctg_id");
            objTrashSer.Restore(objBean, "item_master", "Ctg_id");
            res.sendRedirect("Trash.htm?action=show_Item&menu=Trash&flag=2");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Delete_Item(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Delete(objBean, "item_master", "item_id");
            res.sendRedirect("Trash.htm?action=show_Item&menu=Trash&flag=5");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Delete_ICtg(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Delete(objBean, "item_Ctg", "Ctg_id");
            objTrashSer.Delete(objBean, "item_master", "Ctg_id");
            res.sendRedirect("Trash.htm?action=show_Item&menu=Trash&flag=3");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_Trade(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Trash_Trade");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltTrash, ltAc, msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
            ltTrash = objTrashSer.get_data("Trade_master");
            mv.addObject("dataTrash", ltTrash);

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Restore_Trade(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Restore(objBean, "Trade_master", "Bill_no");
            objTrashSer.Restore(objBean, "Trade_detail", "Bill_no");
            objTrashSer.Restore(objBean, "CURRENCY", "Bill_no");
            res.sendRedirect("Trash.htm?action=show_Trade&menu=Trash&flag=2");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Delete_Trade(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Delete(objBean, "Trade_master", "Bill_no");
            objTrashSer.Delete(objBean, "Trade_detail", "Bill_no");
            objTrashSer.Delete(objBean, "CURRENCY", "Bill_no");
            res.sendRedirect("Trash.htm?action=show_Trade&menu=Trash&flag=3");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_Bank(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Trash_Bank");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltTrash, ltAc, msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
            ltTrash = objTrashSer.get_data("Bank_Trade");
            mv.addObject("dataTrash", ltTrash);

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Restore_Bank(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Restore(objBean, "bank_trade", "tr_id");
            objTrashSer.Restore(objBean, "BILL_WISE_PAYMENT", "tr_id");
            res.sendRedirect("Trash.htm?action=show_Bank&menu=Trash&flag=2");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Delete_Bank(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Delete(objBean, "bank_trade", "tr_id");
            objTrashSer.Delete(objBean, "BILL_WISE_PAYMENT", "tr_id");
            res.sendRedirect("Trash.htm?action=show_Bank&menu=Trash&flag=3");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_Cash(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Trash_Cash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltTrash, ltAc, msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
            ltTrash = objTrashSer.get_data("Cash_Trade");
            mv.addObject("dataTrash", ltTrash);

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Restore_Cash(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Restore(objBean, "Cash_Trade", "tr_id");
            objTrashSer.Restore(objBean, "BILL_WISE_PAYMENT", "tr_id");
            res.sendRedirect("Trash.htm?action=show_Cash&menu=Trash&flag=2");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Delete_Cash(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Delete(objBean, "Cash_Trade", "tr_id");
            objTrashSer.Delete(objBean, "BILL_WISE_PAYMENT", "tr_id");
            res.sendRedirect("Trash.htm?action=show_Cash&menu=Trash&flag=3");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_JVEntry(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Trash_JVEntry");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltTrash, ltAc, msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            ltAc = objComSer.get_Ac();
            mv.addObject("dataAC", ltAc);
            ltTrash = objTrashSer.get_data("JVEntry_master");
            mv.addObject("dataTrash", ltTrash);

        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Restore_JVEntry(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Restore(objBean, "JVEntry_master", "tr_id");
            res.sendRedirect("Trash.htm?action=show_JVEntry&menu=Trash&flag=2");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Delete_JVEntry(HttpServletRequest req, HttpServletResponse res, TrashBean objBean) {
        ModelAndView mv = new ModelAndView("Trash");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg,per;
            TrashService objTrashSer = new TrashService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_notify());
            if (session.getAttribute("User_Type").toString().equals("User")) {
                per = objComSer.get_per(session.getAttribute("User_count"));
                mv.addObject("Dataper", per);
            }
            /* Trash services start */
            objTrashSer.Delete(objBean, "JVEntry_master", "tr_id");
            res.sendRedirect("Trash.htm?action=show_JVEntry&menu=Trash&flag=3");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
