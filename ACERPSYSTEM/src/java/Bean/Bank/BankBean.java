/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.Bank;

/**
 *
 * @author KRISHNA
 */
public class BankBean {

    private String T_Type;
    private Integer Bank_Name;
    private String Entry_Date;
    private Integer Sr_Bill_No;
    private Integer Account_No;
    private Double Total_Amount;
    private String Bill_Remarks;
    private Integer Check_No;
    private String Check_Date;
    private Integer Party_Bank_No;
    private Integer Tr_id;

    public Integer getAccount_No() {
        return Account_No;
    }

    public void setAccount_No(Integer Account_No) {
        this.Account_No = Account_No;
    }

    public Integer getBank_Name() {
        return Bank_Name;
    }

    public void setBank_Name(Integer Bank_Name) {
        this.Bank_Name = Bank_Name;
    }

    public String getBill_Remarks() {
        return Bill_Remarks;
    }

    public void setBill_Remarks(String Bill_Remarks) {
        this.Bill_Remarks = Bill_Remarks;
    }

    public String getCheck_Date() {
        return Check_Date;
    }

    public void setCheck_Date(String Check_Date) {
        this.Check_Date = Check_Date;
    }

    public Integer getCheck_No() {
        return Check_No;
    }

    public void setCheck_No(Integer Check_No) {
        this.Check_No = Check_No;
    }

    public String getEntry_Date() {
        return Entry_Date;
    }

    public void setEntry_Date(String Entry_Date) {
        this.Entry_Date = Entry_Date;
    }

    public Integer getParty_Bank_No() {
        return Party_Bank_No;
    }

    public void setParty_Bank_No(Integer Party_Bank_No) {
        this.Party_Bank_No = Party_Bank_No;
    }

    public Integer getSr_Bill_No() {
        return Sr_Bill_No;
    }

    public void setSr_Bill_No(Integer Sr_Bill_No) {
        this.Sr_Bill_No = Sr_Bill_No;
    }

    public String getT_Type() {
        return T_Type;
    }

    public void setT_Type(String T_Type) {
        this.T_Type = T_Type;
    }

    public Double getTotal_Amount() {
        return Total_Amount;
    }

    public void setTotal_Amount(Double Total_Amount) {
        this.Total_Amount = Total_Amount;
    }

    public Integer getTr_id() {
        return Tr_id;
    }

    public void setTr_id(Integer Tr_id) {
        this.Tr_id = Tr_id;
    }

}
