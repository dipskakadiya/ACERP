/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.Contact;

import Bean.Contact.ContactBean;
import Utilites.AdminService;

public class ContactService {

    AdminService objadmin;

    public ContactService(String file) throws Exception {
        objadmin = new AdminService(file);
    }

    public void Send(ContactBean objbean) throws Exception {
        Integer Ci=objadmin.get_int("select max(CONTACT_ID) from contact_us");
        Ci+=1;
        objadmin.persist("insert into contact_us (CONTACT_ID,Name,Company,Email_Id,Contact_No,Message,Read)values("+Ci+",'" + objbean.getName() + "','" + objbean.getCompany() + "','" + objbean.getEmail() + "'," + objbean.getPhone() + ",'" + objbean.getMessage() + "',0)");
    }
}
