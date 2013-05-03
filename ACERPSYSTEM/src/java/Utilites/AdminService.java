/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilites;

import java.util.List;
import java.util.Properties;
import javax.sql.DataSource;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import java.net.*;
import java.io.InputStreamReader;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author sai
 */
public class AdminService {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    public AdminService(String file) {
        Resource res = new FileSystemResource(file);
        XmlBeanFactory xbf = new XmlBeanFactory(res);
        DataSource ds = (DataSource) xbf.getBean("Admindb", DataSource.class);
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
        URL url = new URL("http://www.ubaid.tk/sms/sms.aspx?uid=8460838411&pwd=dips1992&msg=" + msg + "&phone=" + phone + "&provider=way2sms");

        URLConnection conn = url.openConnection();
        conn.connect();
        InputStreamReader content = new InputStreamReader(conn.getInputStream());
        for (int i = 0; i != -1; i = content.read()) {
            System.out.print((char) i);
        }

    }
    
    public void sendmail(String Receiver,String Sub,String Msg){
            final String username = "dipesh.kakadiya111@gmail.com";
		final String password = "dips11011992";
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
         
				protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("from-email@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(Receiver));
			message.setSubject(Sub);
			message.setText("From: Online Accounting System "
				+ "\n\n "+Msg+"!");
 
			Transport.send(message);
 
			System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
        }

}
