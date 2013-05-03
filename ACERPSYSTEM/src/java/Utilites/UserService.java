/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilites;

import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import java.net.*;
import java.io.InputStreamReader;


/**
 *
 * @author sai
 */
public class UserService {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate();
    public UserService(String file,String id) {
        Resource res = new FileSystemResource(file);
        XmlBeanFactory xbf = new XmlBeanFactory(res);
        DataSource ds = (DataSource) xbf.getBean(id, DataSource.class);
        this.jdbcTemplate = new JdbcTemplate(ds);
    }

    public void persist(String query) throws Exception {
        jdbcTemplate.execute(query);
    }

    public Integer get_int(String query) throws Exception {
        return jdbcTemplate.queryForInt(query);
    }

    public void update(String query) throws Exception {
        jdbcTemplate.update(query);
    }

    public List getLists(String query) {
        try {
            return jdbcTemplate.queryForList(query);

        } catch (Exception ex) {
            System.out.println(ex);
            return jdbcTemplate.queryForList(query);

        }
    }

    public void sendsms(Object phone, String msg) throws Exception {
        URL url = new URL("http://www.ubaid.tk/sms/sms.aspx?uid=8460838411&pwd=dips1992&msg="+msg+"&phone="+phone+"&provider=way2sms");

        URLConnection conn = url.openConnection();
        conn.connect();
        InputStreamReader content = new InputStreamReader(conn.getInputStream());
        for (int i = 0; i != -1; i = content.read()) {
            System.out.print((char) i);
        }

    }
}
