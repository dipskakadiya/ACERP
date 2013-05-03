/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.S_JvEntry;

/**
 *
 * @author Krishna
 */
public class S_JvEntryBean {

    private String Entry_Date;
    private Integer Sr_Bill_No;
    private Integer Debit_Ac;
    private Integer Credit_Ac;
    private Integer Total_Amount;
    private String Debit_Description;
    private String Credit_Description;

    public Integer getCredit_Ac() {
        return Credit_Ac;
    }

    public void setCredit_Ac(Integer Credit_Ac) {
        this.Credit_Ac = Credit_Ac;
    }

    public String getCredit_Description() {
        return Credit_Description;
    }

    public void setCredit_Description(String Credit_Description) {
        this.Credit_Description = Credit_Description;
    }

    public Integer getDebit_Ac() {
        return Debit_Ac;
    }

    public void setDebit_Ac(Integer Debit_Ac) {
        this.Debit_Ac = Debit_Ac;
    }

    public String getDebit_Description() {
        return Debit_Description;
    }

    public void setDebit_Description(String Debit_Description) {
        this.Debit_Description = Debit_Description;
    }

    public String getEntry_Date() {
        return Entry_Date;
    }

    public void setEntry_Date(String Entry_Date) {
        this.Entry_Date = Entry_Date;
    }

    public Integer getSr_Bill_No() {
        return Sr_Bill_No;
    }

    public void setSr_Bill_No(Integer Sr_Bill_No) {
        this.Sr_Bill_No = Sr_Bill_No;
    }

    public Integer getTotal_Amount() {
        return Total_Amount;
    }

    public void setTotal_Amount(Integer Total_Amount) {
        this.Total_Amount = Total_Amount;
    }

   
}
