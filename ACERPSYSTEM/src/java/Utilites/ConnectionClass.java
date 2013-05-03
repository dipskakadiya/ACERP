/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilites;

import java.sql.*;

/**
 *
 * @author sai
 */
public class ConnectionClass {

    Connection con = null;

    public ConnectionClass(String Uid) {
        try {
            String driverName = "oracle.jdbc.OracleDriver";
            Class.forName(driverName);
            // Create a connection to the database
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = Uid;
            String password = Uid;
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.print(e);
        }
    }

    public Connection getConnection() {
    return con;
    }
}
