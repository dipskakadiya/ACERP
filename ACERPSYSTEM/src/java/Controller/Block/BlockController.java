/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Block;

import Services.Block.BlockService;
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
public class BlockController extends MultiActionController {

    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Block");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List ltadmin,msg;
            BlockService objBlockSer = new BlockService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_Adnotify());
            /* Block services Start*/
            ltadmin = objBlockSer.get_data();
            mv.addObject("dataAdmin", ltadmin);
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

    public ModelAndView Block(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Block");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
             mv.addObject("Datanotify", objComSer.get_Adnotify());
             /* Block services Start*/
            BlockService objservices = new BlockService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            Integer id =Integer.parseInt(req.getParameter("id"));
            objservices.Block(id);
            Integer fblock = Integer.parseInt(req.getParameter("flag"));
            if (fblock == 1) {
                res.sendRedirect("Block.htm?menu=Block&flag=3&action=show");
            } else {
                res.sendRedirect("Block.htm?menu=Block&flag=4&action=show");
            }
           // res.sendRedirect("Block.htm?menu=Block&flag=2&action=show");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }
    
    public ModelAndView Drop(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Block");
        try {
            /* Variable define */
            HttpSession session = req.getSession();
            List msg;
            BlockService objBlockSer = new BlockService(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"));
            /* Message display*/
            common objComSer = new common(getServletContext().getRealPath("WEB-INF/applicationcontext.xml"),session.getAttribute("db").toString());
            msg = objComSer.get_msg(session.getAttribute("User_Id"));
            mv.addObject("DataMsg", msg);
            mv.addObject("Datanotify", objComSer.get_Adnotify());
            /* Block services Start*/
            objBlockSer.Drop(req.getParameter("u_id"));
            res.sendRedirect("Block.htm?menu=Block&flag=2&action=show");
        } catch (Exception e) {
            System.out.println(e);
        }
        return mv;
    }

}
