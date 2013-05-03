/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package timer;

import java.sql.*;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author tony
 */
public class timer implements ServletContextListener {

    Connection con;
    Statement st;

    public timer() throws Exception {
        String driverName = "oracle.jdbc.OracleDriver";
        Class.forName(driverName);
        // Create a connection to the database
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        String username = "ACERPSYSTEM";
        String password = "acerp";
        con = DriverManager.getConnection(url, username, password);
        st = con.createStatement();
    }
    private Timer timer;
    TimerTask timertask = new TimerTask() {

        public void run() {
            try {
                //System.out.println(objsql);
                //objsql.persist("declare begin salin; end;");
                String sql = "declare begin Block; end;";
                st.execute(sql);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    };

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        System.out.println("ServletContextListener destroyed");
        timer.cancel();
    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        timer = new Timer("blkunblk");
        timer.schedule(timertask, 0, 60*60*1000);
        //	System.out.println("ServletContextListener started");	
    }
}
