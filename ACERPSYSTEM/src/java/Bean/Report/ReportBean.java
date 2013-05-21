/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.Report;

/**
 *
 * @author sai
 */
public class ReportBean {

    private Integer Account_No;
    private String R_Name;
    private String R_Type;
    private String[] cri;
    private String[] val;
    private Integer[] field;
    //hi
    
    public Integer getAccount_No() {
        return Account_No;
    }

    public void setAccount_No(Integer Account_No) {
        this.Account_No = Account_No;
    }

    public String getR_Name() {
        return R_Name;
    }

    public void setR_Name(String R_Name) {
        this.R_Name = R_Name;
    }

    public String getR_Type() {
        return R_Type;
    }

    public void setR_Type(String R_Type) {
        this.R_Type = R_Type;
    }

    public String[] getCri() {
        return cri;
    }

    public void setCri(String[] cri) {
        this.cri = cri;
    }

    public Integer[] getField() {
        return field;
    }

    public void setField(Integer[] field) {
        this.field = field;
    }

    public String[] getVal() {
        return val;
    }

    public void setVal(String[] val) {
        this.val = val;
    }

    
}
