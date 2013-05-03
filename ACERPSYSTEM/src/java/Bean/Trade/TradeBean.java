/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean.Trade;

/**
 *
 * @author sai
 */
public class TradeBean {
private String Book_No;
private Integer Account_No;
private String Bill_Date;
private Integer Sr_Bill_No;
private String Party_Bill_Date;
private Integer Party_Sr_Bill_No;
private Double Total_Qty;
private Double Total_Tax_Amount;
private Double Total_Gross_Amount;
private String Bill_Remarks;
private Double Total_Bill_Amount;
private Integer Due_Days;
private String Bill_Mode;
private String OBill_Mode;
private Integer Discount;
private Integer C_1000;
private Integer C_500;
private Integer C_100;
private Integer C_50;
private Integer C_20;
private Integer C_10;
private String[] mygrid;

    public Integer getAccount_No() {
        return Account_No;
    }

    public void setAccount_No(Integer Account_No) {
        this.Account_No = Account_No;
    }

    public String getBill_Date() {
        return Bill_Date;
    }

    public void setBill_Date(String Bill_Date) {
        this.Bill_Date = Bill_Date;
    }

    public String getBill_Mode() {
        return Bill_Mode;
    }

    public void setBill_Mode(String Bill_Mode) {
        this.Bill_Mode = Bill_Mode;
    }

    public String getBill_Remarks() {
        return Bill_Remarks;
    }

    public void setBill_Remarks(String Bill_Remarks) {
        this.Bill_Remarks = Bill_Remarks;
    }

    public String getBook_No() {
        return Book_No;
    }

    public void setBook_No(String Book_No) {
        this.Book_No = Book_No;
    }

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

    public Integer getDiscount() {
        return Discount;
    }

    public void setDiscount(Integer Discount) {
        this.Discount = Discount;
    }

    public Integer getDue_Days() {
        return Due_Days;
    }

    public void setDue_Days(Integer Due_Days) {
        this.Due_Days = Due_Days;
    }

    public String getOBill_Mode() {
        return OBill_Mode;
    }

    public void setOBill_Mode(String OBill_Mode) {
        this.OBill_Mode = OBill_Mode;
    }

    public String getParty_Bill_Date() {
        return Party_Bill_Date;
    }

    public void setParty_Bill_Date(String Party_Bill_Date) {
        this.Party_Bill_Date = Party_Bill_Date;
    }

    public Integer getParty_Sr_Bill_No() {
        return Party_Sr_Bill_No;
    }

    public void setParty_Sr_Bill_No(Integer Party_Sr_Bill_No) {
        this.Party_Sr_Bill_No = Party_Sr_Bill_No;
    }

    public Integer getSr_Bill_No() {
        return Sr_Bill_No;
    }

    public void setSr_Bill_No(Integer Sr_Bill_No) {
        this.Sr_Bill_No = Sr_Bill_No;
    }

    public Double getTotal_Bill_Amount() {
        return Total_Bill_Amount;
    }

    public void setTotal_Bill_Amount(Double Total_Bill_Amount) {
        this.Total_Bill_Amount = Total_Bill_Amount;
    }

    public Double getTotal_Gross_Amount() {
        return Total_Gross_Amount;
    }

    public void setTotal_Gross_Amount(Double Total_Gross_Amount) {
        this.Total_Gross_Amount = Total_Gross_Amount;
    }

    public Double getTotal_Qty() {
        return Total_Qty;
    }

    public void setTotal_Qty(Double Total_Qty) {
        this.Total_Qty = Total_Qty;
    }

    public Double getTotal_Tax_Amount() {
        return Total_Tax_Amount;
    }

    public void setTotal_Tax_Amount(Double Total_Tax_Amount) {
        this.Total_Tax_Amount = Total_Tax_Amount;
    }

    public String[] getMygrid() {
        return mygrid;
    }

    public void setMygrid(String[] mygrid) {
        this.mygrid = mygrid;
    }

}
