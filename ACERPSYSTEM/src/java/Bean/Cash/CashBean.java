/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean.Cash;

/**
 *
 * @author sai
 */
public class CashBean {

    private String T_Type;
    private String Entry_Date;
    private Integer Sr_Bill_No;
    private Integer Account_No;
    private Double Total_Amount;
    private String Bill_Remarks;
    private Integer cash_id;
    private Integer tr_id;
    private Integer C_1000;
    private Integer C_500;
    private Integer C_100;
    private Integer C_50;
    private Integer C_20;
    private Integer C_10;

    public Integer getC_10() {
        return C_10;
    }

    public void setC_10(Integer C_10) {
        this.C_10 = C_10;
    }

    public Integer getC_100() {
        return C_100;
    }

    public void setC_100(Integer C_100) {
        this.C_100 = C_100;
    }

    public Integer getC_1000() {
        return C_1000;
    }

    public void setC_1000(Integer C_1000) {
        this.C_1000 = C_1000;
    }

    public Integer getC_20() {
        return C_20;
    }

    public void setC_20(Integer C_20) {
        this.C_20 = C_20;
    }

    public Integer getC_50() {
        return C_50;
    }

    public void setC_50(Integer C_50) {
        this.C_50 = C_50;
    }

    public Integer getC_500() {
        return C_500;
    }

    public void setC_500(Integer C_500) {
        this.C_500 = C_500;
    }

    public Double getTotal_Amount() {
        return Total_Amount;
    }

    public void setTotal_Amount(Double Total_Amount) {
        this.Total_Amount = Total_Amount;
    }

    public Integer getTr_id() {
        return tr_id;
    }

    public void setTr_id(Integer tr_id) {
        this.tr_id = tr_id;
    }

    public Integer getCash_id() {
        return cash_id;
    }

    public void setCash_id(Integer cash_id) {
        this.cash_id = cash_id;
    }

    public Integer getAccount_No() {
        return Account_No;
    }

    public void setAccount_No(Integer Account_No) {
        this.Account_No = Account_No;
    }

    public String getBill_Remarks() {
        return Bill_Remarks;
    }

    public void setBill_Remarks(String Bill_Remarks) {
        this.Bill_Remarks = Bill_Remarks;
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

    public String getT_Type() {
        return T_Type;
    }

    public void setT_Type(String T_Type) {
        this.T_Type = T_Type;
    }
}
