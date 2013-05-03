/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Ajex;

import Services.common.Ajex;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author sai
 */
public class AjexCtr extends MultiActionController {

    //Ajex for City State Contry
    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltCtr;
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            ltCtr = objComSer.get_Contry();
            mv.addObject("dataCtr", ltCtr);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_state(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltCtr;
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            ltCtr = objComSer.get_State();
            mv.addObject("dataSte", ltCtr);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_city(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltCtr;
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            ltCtr = objComSer.get_City();
            mv.addObject("dataCtr", ltCtr);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    //Dispaly Ajex for Bank Cash trade
    public ModelAndView show_billno(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltBill;
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            Integer Ac_Id = Integer.parseInt(req.getParameter("Ac_Id"));
            if (req.getParameter("BookName") != null) {
                if (req.getParameter("BookName").equals("Payment") == true) {
                    ltBill = objComSer.get_Bill(Ac_Id, "'Purchase Bill','Sales Return Bill'");
                } else {
                    ltBill = objComSer.get_Bill(Ac_Id, "'Sales Bill','Purchase Return Bill'");
                }
            } else {
                ltBill = null;
            }

            mv.addObject("dataBill", ltBill);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_pb(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltPBank;
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            Integer Ac_id = Integer.parseInt(req.getParameter("Ac_id"));
            ltPBank = objComSer.get_PBank(Ac_id);
            mv.addObject("dataPBank", ltPBank);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    //display Item Ajex
    public ModelAndView show_item(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltItem;
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            Integer Ctg_id = Integer.parseInt(req.getParameter("Ctg_Id"));
            ltItem = objComSer.get_Item(Ctg_id);
            mv.addObject("dataItem", ltItem);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    //coman Display Remaining Amount
    public ModelAndView show_AcAmount(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List AcAmount;
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            Integer Ac_id = Integer.parseInt(req.getParameter("Ac_Id"));
            AcAmount = objComSer.get_AcAmount(Ac_id);
            mv.addObject("AcAmount", AcAmount);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

//    Custom Reports
    public ModelAndView show_CArea(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List lt;
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            if (req.getParameter("Cname") != null) {
                if (req.getParameter("Cname").equals("Account Name") == true) {
                    lt = objComSer.get_Ac();
                    mv.addObject("data", lt);
                }
                if (req.getParameter("Cname").equals("Head Id") == true) {
                    lt = objComSer.get_AcHead();
                    mv.addObject("data", lt);
                }
                if (req.getParameter("Cname").equals("Category Name") == true) {
                    lt = objComSer.get_ctgitem();
                    mv.addObject("data", lt);
                }
                if (req.getParameter("Cname").equals("Item Name") == true) {
                    lt = objComSer.get_Allitem();
                    mv.addObject("data", lt);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
    //    Custom Reports

    public ModelAndView show_Ac_Trade(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List lt = null;
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            if (req.getParameter("BookName") != null) {
                if (req.getParameter("BookName").equals("Purchase Bill") == true || req.getParameter("BookName").equals("Purchase Return Bill") == true || req.getParameter("BookName").equals("Payment") == true) {
                    lt = objComSer.get_Ac_Tarde(3);
                } else {
                    lt = objComSer.get_Ac_Tarde(4);
                }
            }
            mv.addObject("dataAT", lt);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_Ac_BCTrade(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List lt = null;
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            lt = objComSer.get_Ac_BCTarde();
            mv.addObject("dataAT", lt);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Ch_avalibity(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), "paresh");
            String tname = req.getParameter("tname");
            if (tname.equals("AdminName")) {
                String uname = req.getParameter("uname");
                mv.addObject("data", objComSer.get_UserName(uname));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView show_itemAll(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Ajex");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            String db;
            if (session.getAttribute("db") == null) {
                db = "Admindb";
            } else {
                db = session.getAttribute("db").toString();
            }
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), db);
            mv.addObject("data", objComSer.get_ItemAll());
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Item3dtagsave(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("3dImade_Createsave");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            String height, width, top, left, id, text;
            height = req.getParameter("height");
            width = req.getParameter("width");
            top = req.getParameter("top");
            left = req.getParameter("left");
            id = req.getParameter("id");
            text = req.getParameter("text");
            mv.addObject("id", objComSer.Save_itag(height, width, top, left, id, text));
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Item3dtagDelete(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("3dImade_Createsave");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            Ajex objComSer = new Ajex(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"), session.getAttribute("db").toString());
            String id;
            id = req.getParameter("id");
            System.out.println(id);
            objComSer.Delete_itag(id);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
}
