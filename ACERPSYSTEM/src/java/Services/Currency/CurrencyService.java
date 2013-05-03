/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Services.Currency;

import Bean.Currency.CurrencyBean;
import Utilites.UserService;
import java.util.List;

/**
 *
 * @author sai
 */
public class CurrencyService {
    UserService objsql;

    public CurrencyService(String file,String id) throws Exception {
        objsql = new UserService(file,id);
    }

    public List Search(CurrencyBean objBean) throws Exception {
        return objsql.getLists("select * from Currency where trash=0 and Bill_Date=TO_DATE('" + objBean.getBill_Date() + "','YYYY-MM-DD')");
    }

    public List get_data() throws Exception {
        return objsql.getLists("select * from Currency where trash=0");
    }
}
