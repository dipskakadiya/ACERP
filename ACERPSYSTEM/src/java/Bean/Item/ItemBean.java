/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.Item;
import org.springframework.web.multipart.MultipartFile;
/**
 *
 * @author sai
 */
public class ItemBean {

    private Integer Item_Code;
    private String Item_Name;
    private Integer Op_Stock;
    private Double Op_Rate;
    private Double Op_Amount;
    private Double Sales_Rate;
    private Double Item_Mrp;
    private Integer Reorder_Level;
    private Integer Tax_Applicable;
    private Integer Lable_Print;
    private Integer Ctg_id;
    private String Ctg_Name;
    private String[] mygrid;
    private String Imagealt;
    MultipartFile Image;

    public MultipartFile getImage() {
        return Image;
    }

    public void setImage(MultipartFile Image) {
        this.Image = Image;
    }

    public String getImagealt() {
        return Imagealt;
    }

    public void setImagealt(String Imagealt) {
        this.Imagealt = Imagealt;
    }

    public String getCtg_Name() {
        return Ctg_Name;
    }

    public void setCtg_Name(String Ctg_Name) {
        this.Ctg_Name = Ctg_Name;
    }

    public Integer getCtg_id() {
        return Ctg_id;
    }

    public void setCtg_id(Integer Ctg_id) {
        this.Ctg_id = Ctg_id;
    }

    public Integer getItem_Code() {
        return Item_Code;
    }

    public void setItem_Code(Integer Item_Code) {
        this.Item_Code = Item_Code;
    }

    public Double getItem_Mrp() {
        return Item_Mrp;
    }

    public void setItem_Mrp(Double Item_Mrp) {
        this.Item_Mrp = Item_Mrp;
    }

    public String getItem_Name() {
        return Item_Name;
    }

    public void setItem_Name(String Item_Name) {
        this.Item_Name = Item_Name;
    }

    public Integer getLable_Print() {
        return Lable_Print;
    }

    public void setLable_Print(Integer Lable_Print) {
        this.Lable_Print = Lable_Print;
    }

    public Double getOp_Amount() {
        return Op_Amount;
    }

    public void setOp_Amount(Double Op_Amount) {
        this.Op_Amount = Op_Amount;
    }

    public Double getOp_Rate() {
        return Op_Rate;
    }

    public void setOp_Rate(Double Op_Rate) {
        this.Op_Rate = Op_Rate;
    }

    public Integer getOp_Stock() {
        return Op_Stock;
    }

    public void setOp_Stock(Integer Op_Stock) {
        this.Op_Stock = Op_Stock;
    }

    public Integer getReorder_Level() {
        return Reorder_Level;
    }

    public void setReorder_Level(Integer Reorder_Level) {
        this.Reorder_Level = Reorder_Level;
    }

    public Double getSales_Rate() {
        return Sales_Rate;
    }

    public void setSales_Rate(Double Sales_Rate) {
        this.Sales_Rate = Sales_Rate;
    }

    public Integer getTax_Applicable() {
        return Tax_Applicable;
    }

    public void setTax_Applicable(Integer Tax_Applicable) {
        this.Tax_Applicable = Tax_Applicable;
    }

    public String[] getMygrid() {
        return mygrid;
    }

    public void setMygrid(String[] mygrid) {
        this.mygrid = mygrid;
    }
}
