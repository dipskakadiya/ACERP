/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.Blog;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author KRISHNA
 */
public class BlogBean {

    private String Subject;
    private String Message;
    MultipartFile Image;

    public MultipartFile getImage() {
        return Image;
    }

    public void setImage(MultipartFile Image) {
        this.Image = Image;
    }

   

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String Subject) {
        this.Subject = Subject;
    }
}
