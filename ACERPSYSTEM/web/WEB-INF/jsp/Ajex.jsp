<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/mws.theme.css" media="screen" />
<!--<script type="text/javascript" src="js/mws.js"></script>-->
<script>
    if($.fn.chosen) {
        $("select.chzn-select").chosen();
    }
</script>
<script type="text/javascript" src="js/demo.js"></script>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%if (request.getParameter("action").equals("show") == true) {%>

<%          String S_id = request.getParameter("S_id");
    String id = request.getParameter("C_id");
    String Ci_id = request.getParameter("Ci_id");
%>
<script type="text/javascript">
    $(document).ready(function(){
        var coun=$("#country").val();
        $.ajax({url:"Ajex.htm?action=show_state&S_id=<% out.print(S_id);%>&Ci_id=<% out.print(Ci_id);%>&C_id="+coun, success:function(result){
                $("#State").html(result);
            }});

        $("#country").change(function(){
            var coun=$("#country").val();
            $.ajax({url:"Ajex.htm?action=show_state&S_id=<% out.print(S_id);%>&Ci_id=<% out.print(Ci_id);%>&C_id="+coun, success:function(result){
                    $("#State").html(result);
                }});
        });
    });
</script>
<%
    // String id = request.getParameter("C_id");
    String msg = "<select name='Contry' id='country'>";
    List ltCtr = (List) request.getAttribute("dataCtr");
    HashMap hmCtr = null;
    if (ltCtr != null) {
        for (int j = 0; j < ltCtr.size(); j++) {
            hmCtr = (HashMap) ltCtr.get(j);
            msg += "<option value='" + hmCtr.get("C_Name").toString() + "'";
            if (id != null) {
                if (id.equals(hmCtr.get("C_name").toString()) == true) {
                    msg += "selected";
                }
            }
            msg += ">";
            msg += hmCtr.get("C_Name").toString() + "</option>";
        }

    }
    msg += "</select>";
    out.print(msg);
%>





<%} else if (request.getParameter("action").equals("show_state") == true) {%>

<%          String S_id = request.getParameter("S_id");
    String Ci_id = request.getParameter("Ci_id");
%>
<script type="text/javascript">
    $(document).ready(function(){
        var coun=$("#state").val();
        $.ajax({url:"Ajex.htm?action=show_city&Ci_id=<% out.print(Ci_id);%>&S_id="+coun, success:function(result){
                $("#City").html(result);
            }});

        $("#State").change(function(){
            var coun=$("#state").val();
            $.ajax({url:"Ajex.htm?action=show_city&Ci_id=<% out.print(Ci_id);%>&S_id="+coun, success:function(result){
                    $("#City").html(result);
                }});
        });
    });
</script>
<%
    String C_id = request.getParameter("C_id");
    String msg = "<select name='State' id='state'>";
    List ltCtr = (List) request.getAttribute("dataSte");
    HashMap hmCtr = null;
    if (ltCtr != null) {
        for (int j = 0; j < ltCtr.size(); j++) {
            hmCtr = (HashMap) ltCtr.get(j);
            if (C_id.equals(hmCtr.get("C_Name").toString()) == true) {
                msg += "<option value='" + hmCtr.get("S_Name").toString() + "'";
                if (S_id != null) {
                    if (S_id.equals(hmCtr.get("S_name").toString()) == true) {
                        msg += "selected";
                    }
                }
                msg += ">";
                msg += hmCtr.get("S_Name").toString() + "</option>";
            }
        }
    }
    msg += "</select>";
    out.print(msg);
%>








<%} else if (request.getParameter("action").equals("show_city") == true) {%>

<%
    String S_id = request.getParameter("S_id");
    String Ci_id = request.getParameter("Ci_id");
    String msg = "<select  name ='City' id ='City'>";
    List ltCtr = (List) request.getAttribute("dataCtr");
    HashMap hmCtr = null;
    if (ltCtr != null) {
        for (int j = 0; j < ltCtr.size(); j++) {
            hmCtr = (HashMap) ltCtr.get(j);
            if (S_id.equals(hmCtr.get("S_Name").toString()) == true) {
                msg += "<option value='" + hmCtr.get("Ci_Name").toString() + "'";
                if (S_id != null) {
                    if (Ci_id.equals(hmCtr.get("Ci_name").toString()) == true) {
                        msg += "selected";
                    }
                }
                msg += ">";
                msg += hmCtr.get("Ci_Name").toString() + "</option>";
            }
        }
    }
    msg += "</select>";
    out.print(msg);
%>








<%} else if (request.getParameter("action").equals("show_billno") == true) {%>

<%
    String bill_no = request.getParameter("bill_no");
    String msg = "<select class'validate[required]' id='Sr_Bill_No' name='Sr_Bill_No'>";
    List ltBill = (List) request.getAttribute("dataBill");
    HashMap hmBill = null;
    if (ltBill != null) {
        for (int j = 0; j < ltBill.size(); j++) {
            hmBill = (HashMap) ltBill.get(j);
            msg += "<option value='" + hmBill.get("BILL_NO").toString() + "'";
            if (bill_no.equals(hmBill.get("BILL_NO").toString()) == true) {
                msg += "selected";
            }
            msg += ">";
            msg += hmBill.get("BILL_NO").toString() + " Amt:-:" + hmBill.get("Amount").toString() + "</option>";
        }
    } else {
        msg += "";
    }
    msg += "</select>";
    out.print(msg);
%>





<%} else if (request.getParameter("action").equals("show_pb") == true) {%>

<%
    String id = request.getParameter("pb_name");
    String msg = "<select name='Party_Bank_No' id='party_Bank_No'>";
    List ltCtr = (List) request.getAttribute("dataPBank");
    HashMap hmCtr = null;
    if (ltCtr != null) {
        for (int j = 0; j < ltCtr.size(); j++) {
            hmCtr = (HashMap) ltCtr.get(j);
            msg += "<option value='" + hmCtr.get("BANK_id").toString() + "'";
            if (id != null) {
                if (id.equals(hmCtr.get("bank_id").toString()) == true) {
                    msg += "selected";
                }
            }
            msg += ">";
            msg += hmCtr.get("BANK_NAME").toString() + "</option>";
        }
    }
    if (ltCtr.size() == 0) {
        msg += "<option value='Pending'>Pending</option>";
    }
    msg += "</select>";
    out.print(msg);
%>







<%} else if (request.getParameter("action").equals("show_item") == true) {%>

<%
    String msg = "";
    List ltItem = (List) request.getAttribute("dataItem");
    HashMap hmItem = null;
    if (ltItem != null) {
        for (int j = 0; j < ltItem.size(); j++) {
            hmItem = (HashMap) ltItem.get(j);
            msg += " <div class='product' id='product_" + j + "'>";
            msg += "<img src='images/Product/" + hmItem.get("item_id") + "" + hmItem.get("pimage") + "' alt='iPod' width='50px' height='50px'  class='pngfix' />";
            msg += "<div>";
            msg += hmItem.get("SALES_RATE") + " RS<br/>STOCK:- " + hmItem.get("STOCK");
            msg += " <input type='hidden' id='Product_id' value='" + hmItem.get("item_id") + "'/>";
            msg += " <input type='hidden' id='Product_name' value='" + hmItem.get("Item_name") + "'/>";
            msg += " <input type='hidden' id='Product_Rate' value='" + hmItem.get("SALES_RATE") + "'/>";
            msg += " <input type='hidden' id='Product_Tax' value='";  
            if(hmItem.get("TAX")!=null){
             msg+=hmItem.get("TAX")+ "'/>";
             }else{
             msg+="0'/>";
             }
            msg += " <input type='hidden' id='Product_Stock' value='" + hmItem.get("STOCK") + "'/>";
            msg += "</div></div>";
        }
    }
    out.print(msg);
%>
<script>
    $(document).ready(function(){
        $(".product img").draggable({
            containment: 'document',
            opacity: 0.6,
            revert: 'invalid',
            helper: 'clone',
            zIndex: 100
        });
    });
    $(".product img").dblclick(function(){
        var param =$(this).parent().attr('id'); 
        AddProduct(param);
    });
    
</script>








<%} else if (request.getParameter("action").equals("show_AcAmount") == true) {%>

<%
    String msg = "";
    List ltAc = (List) request.getAttribute("AcAmount");
    HashMap hmAc = null;
    msg += "<div style='float:right;color:yellow;'>";
    if (ltAc != null) {
        hmAc = (HashMap) ltAc.get(0);
        Double AcAmount = Double.parseDouble(hmAc.get("AcAmount").toString());
        Double limit = Double.parseDouble(hmAc.get("limit").toString());
        limit -= AcAmount;
        limit+=Double.parseDouble(request.getParameter("tbill"));
        if (AcAmount >= 0) {
            msg += AcAmount + "  CR";
        } else {
            msg += (-AcAmount) + "  DR";
        }
        msg += "<input type='hidden' id='limit' value='" + limit + "'>";
    }
    msg += "</div>";
    out.print(msg);
%>









<%} else if (request.getParameter("action").equals("show_CArea") == true) {%>
<script>
    function removeElement(id){
        var li=$('#'+id).parent().parent();
        var label=li.children('label').text();
        li=li.parent().parent();
        li.remove();
        
        if(id==2){
            $('#AcCri').append("<option>"+label+"</option>");
            $('#ItemCri').append("<option>"+label+"</option>");
        }else if( id<=5){
            $('#AcCri').append("<option>"+label+"</option>");
        }else{
            $('#ItemCri').append("<option>"+label+"</option>");
        }
    }
</script>





<%
    String msg = "";
    if (request.getParameter("Cname") != null) {
        if (request.getParameter("Cname").equals("Account Name") == true) {
            msg = "<div class='mws-form-col-2-8'><div  class='mws-form-item'>";
            msg += "<div><label>" + request.getParameter("Cname").toString() + "<img src='images/core/fancy_close.png' style='float:right;' id='1' onClick='removeElement(1);'></label><div class='mws-form-item' style='color:black'><select name='val' class='chzn-select'>";
            List ltAc = (List) request.getAttribute("data");
            HashMap hmAc = null;
            if (ltAc != null) {
                for (int j = 0; j < ltAc.size(); j++) {
                    hmAc = (HashMap) ltAc.get(j);
                    //if (hmAc.get("Ac_id").equals(hmBill.get("Ac_id")) == true) {
                    msg += "<option value='" + hmAc.get("Ac_Name").toString() + "'>";
                    msg += hmAc.get("Ac_Name").toString() + "</option>";
                    //}
                }
            }
            msg += "</select>";
            msg += "<input type='hidden' name='cri' value='Ac_Name'>";
            msg += "</div></div></div></div>";
            out.println(msg);
        } else if (request.getParameter("Cname").equals("Bill Date") == true) {
            msg = "<div class='mws-form-col-1-8'><div  class='mws-form-item'>";
            msg += "<div><label>" + request.getParameter("Cname").toString() + "<img src='images/core/fancy_close.png' style='float:right;' id='2' onClick='removeElement(2);'></label><div class='mws-form-item'>";
            msg += "<input type='text' name='val' id='Bill_Date' class='validate[required] mws-textinput mws-datepicker' value='' />";
            msg += "<input type='hidden' name='cri' value='Bill_Date'>";
            msg += "</div></div></div></div>";
            out.println(msg);
        } else if (request.getParameter("Cname").equals("Bill Remaing Amount") == true) {
            msg = "<div class='mws-form-col-2-8'><div  class='mws-form-item'>";
            msg += "<div><label>" + request.getParameter("Cname").toString() + "<img src='images/core/fancy_close.png' style='float:right;' id='3' onClick='removeElement(3);'></label><div class='mws-form-item'>";
            msg += "<input type='text' name='val' id='R_Amount' class='validate[required] mws-textinput' value='' />";
            msg += "<input type='hidden' name='cri' value='R_Amount'>";
            msg += "</div></div></div></div>";
            out.println(msg);
        } else if (request.getParameter("Cname").equals("Head Id") == true) {
            msg = "<div class='mws-form-col-2-8'><div  class='mws-form-item'>";
            msg += "<div><label>" + request.getParameter("Cname").toString() + "<img src='images/core/fancy_close.png' style='float:right;' id='4' onClick='removeElement(4);'></label><div class='mws-form-item' style='color:black'><select name='val'>";
            List ltAc = (List) request.getAttribute("data");
            HashMap hmAc = null;
            if (ltAc != null) {
                for (int j = 0; j < ltAc.size(); j++) {
                    hmAc = (HashMap) ltAc.get(j);
                    //if (hmAc.get("Ac_id").equals(hmBill.get("Ac_id")) == true) {
                    msg += "<option value='" + hmAc.get("AC_NAME").toString() + "'>";
                    msg += hmAc.get("AC_NAME").toString() + "</option>";
                    //}
                }
            }
            msg += "</select>";
            msg += "<input type='hidden' name='cri' value='Head_Name'>";
            msg += "</div></div></div></div>";
            out.println(msg);
        } else if (request.getParameter("Cname").equals("Category Name") == true) {
            msg = "<div class='mws-form-col-2-8'><div  class='mws-form-item'>";
            msg += "<div><label>" + request.getParameter("Cname").toString() + "<img src='images/core/fancy_close.png' style='float:right;' id='6' onClick='removeElement(6);'></label><div class='mws-form-item' style='color:black'><select name='val'>";
            List ltAc = (List) request.getAttribute("data");
            HashMap hmAc = null;
            if (ltAc != null) {
                for (int j = 0; j < ltAc.size(); j++) {
                    hmAc = (HashMap) ltAc.get(j);
                    //if (hmAc.get("Ac_id").equals(hmBill.get("Ac_id")) == true) {
                    msg += "<option value='" + hmAc.get("ctg_name").toString() + "'>";
                    msg += hmAc.get("ctg_name").toString() + "</option>";
                    //}
                }
            }
            msg += "</select>";
            msg += "<input type='hidden' name='cri' value='ctg_name'>";
            msg += "</div></div></div></div>";
            out.println(msg);
        } else if (request.getParameter("Cname").equals("Item Name") == true) {
            msg = "<div class='mws-form-col-2-8'><div  class='mws-form-item'>";
            msg += "<div><label>" + request.getParameter("Cname").toString() + "<img src='images/core/fancy_close.png' style='float:right;' id='7' onClick='removeElement(7);'></label><div class='mws-form-item' style='color:black'><select name='val'>";
            List ltAc = (List) request.getAttribute("data");
            HashMap hmAc = null;
            if (ltAc != null) {
                for (int j = 0; j < ltAc.size(); j++) {
                    hmAc = (HashMap) ltAc.get(j);
                    //if (hmAc.get("Ac_id").equals(hmBill.get("Ac_id")) == true) {
                    msg += "<option value='" + hmAc.get("item_name").toString() + "'>";
                    msg += hmAc.get("item_name").toString() + "</option>";
                    //}
                }
            }
            msg += "</select>";
            msg += "<input type='hidden' name='cri' value='item_name'>";
            msg += "</div></div></div></div>";
            out.println(msg);
        } else if (request.getParameter("Cname").equals("Tr Type") == true) {
            msg = "<div class='mws-form-col-2-8'><div  class='mws-form-item'>";
            msg += "<div><label>" + request.getParameter("Cname").toString() + "<img src='images/core/fancy_close.png' style='float:right;' id='8' onClick='removeElement(8);'></label><div class='mws-form-item'><select name='val'>";
            msg += "<option value='OPENING STOCK'>Opening Stock</option>";
            msg += "<option value='Purchase Bill'>Purchase</option>";
            msg += "<option value='Sales Bill'>Sales</option>";
            msg += "<option value='Purchase Return Bill'>Purchase Return</option>";
            msg += "<option value='Sales Return Bill'>Sales Return</option>";
            msg += "</select>";
            msg += "<input type='hidden' name='cri' value='DESCRIPTION'>";
            msg += "</div></div></div></div>";
            out.println(msg);
        } else if (request.getParameter("Cname").equals("Bill Mode") == true) {
            msg = "<div class='mws-form-col-2-8'><div  class='mws-form-item'>";
            msg += "<div><label>" + request.getParameter("Cname").toString() + "<img src='images/core/fancy_close.png' style='float:right;' id='5' onClick='removeElement(5);'></label><div class='mws-form-item'><select name='val'>";
            msg += "<option value='OPENING STOCK'>Opening Balance</option>";
            msg += "<option value='Purchase Bill'>Purchase</option>";
            msg += "<option value='Sales Bill'>Sales</option>";
            msg += "<option value='Purchase Return Bill'>Purchase Return</option>";
            msg += "<option value='Sales Return Bill'>Sales Return</option>";
            msg += "<option value='Bank Receipt'>Bank Receipt</option>";
            msg += "<option value='Bank Payment'>Bank Payment</option>";
            msg += "<option value='Cash Receipt'>Cash Receipt</option>";
            msg += "<option value='Cash Payment'>Cash Payment</option>";
            msg += "</select>";
            msg += "<input type='hidden' name='cri' value='PERTICULER'>";
            msg += "</div></div></div></div>";
            out.println(msg);
        }
    }
%>

<%} else if (request.getParameter("action").equals("show_Ac_Trade") == true) {%>

<%  String Ac_id = "";
    if (Ac_id != null) {
        Ac_id = request.getParameter("Ac_id");
    }
    String msg = "<select name='Account_No' class='chzn-select' id='Account_No'>";
    List ltAc = (List) request.getAttribute("dataAT");
    HashMap hmAc = null;
    if (ltAc != null) {
        for (int j = 0; j < ltAc.size(); j++) {
            hmAc = (HashMap) ltAc.get(j);
            msg += "<option value='" + hmAc.get("Ac_id").toString() + "'";
            if (Ac_id.equals(hmAc.get("Ac_id").toString()) == true) {
                msg += " selected ";
            }
            msg += ">";
            msg += hmAc.get("Ac_Name").toString() + "</option>";
        }
    }
    msg += "</select>";
    out.println(msg);
%>
<script type="text/javascript">
    $(document).ready(function(){
        var coun=$("#Account_No").val();
        $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun+"&tbill=<%=request.getParameter("tbill")%>", success:function(result){
                $("#AcAmount").html(result);
            }});
        $("#Account_No").change(function(){
            var coun=$("#Account_No").val();
            $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun+"&tbill=<%=request.getParameter("tbill")%>", success:function(result){
                    $("#AcAmount").html(result);
                }});
        });
    });
</script>







<%} else if (request.getParameter("action").equals("show_Ac_BCTrade") == true) {%>

<%  String Ac_id = "";
    if (Ac_id != null) {
        Ac_id = request.getParameter("Ac_id");
    }
    String msg = "<select name='Account_No' class='chzn-select' id='Account_No'>";
    List ltAc = (List) request.getAttribute("dataAT");
    HashMap hmAc = null;
    if (ltAc != null) {
        for (int j = 0; j < ltAc.size(); j++) {
            hmAc = (HashMap) ltAc.get(j);
            msg += "<option value='" + hmAc.get("Ac_id").toString() + "'";
            if (Ac_id.equals(hmAc.get("Ac_id").toString()) == true) {
                msg += " selected ";
            }
            msg += ">";
            msg += hmAc.get("Ac_Name").toString() + "</option>";
        }
    }
    msg += "</select>";
    out.println(msg);
%>
<script type="text/javascript">
    $(document).ready(function(){
        var coun=$("#Account_No").val();
        $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun, success:function(result){
                $("#AcAmount").html(result);
            }});
        $("#Account_No").change(function(){
            var coun=$("#Account_No").val();
            $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun, success:function(result){
                    $("#AcAmount").html(result);
                }});
        });
    });
</script>
<%
    if (request.getParameter("BookName").equals("Payment") == true || request.getParameter("BookName").equals("Receipt") == true) {

%>
<script type="text/javascript">
    $(document).ready(function(){
        var coun=$("#Account_No").val();
        $.ajax({url:"Ajex.htm?action=show_billno&Ac_Id="+coun+"&bill_no=<%out.print(request.getParameter("Bill_No"));%>&BookName=<%=request.getParameter("BookName")%>", success:function(result){
                $("#Display_bill").html(result);
            }});
        $("#Account_No").change(function(){
            var coun=$("#Account_No").val();
            $.ajax({url:"Ajex.htm?action=show_billno&Ac_Id="+coun+"&bill_no=null&BookName=<%=request.getParameter("BookName")%>", success:function(result){
                    $("#Display_bill").html(result);
                }});
        });
    });
    $(document).ready(function(){
        coun=$("#Account_No").val();
        $.ajax({url:"Ajex.htm?action=show_pb&pb_name=<%out.print(request.getParameter("PB_Bank"));%>&Ac_id="+coun, success:function(result){
                $("#Party_Bank_No").html(result);
            }});
        $('#Account_No').change(function(){
            coun=$("#Account_No").val();
            $.ajax({url:"Ajex.htm?action=show_pb&Ac_id="+coun, success:function(result){
                    $("#Party_Bank_No").html(result);
                }});
        });
    });
</script>
<%
    }
%>
<%} else if (request.getParameter("action").equals("Ch_avalibity") == true) {%>

<%
    List lt = (List) request.getAttribute("data");
    HashMap hm = null;
    if (lt.isEmpty()!=true ) {
        hm = (HashMap) lt.get(0);
        out.println("<input type='hidden' name='ChkAvability' id='ChkAvability' value='" + hm.get("Name") + "'/>");
    } else {
        out.println("<input type='hidden' name='ChkAvability' id='ChkAvability' value='0'/>");
    }

%>

<%} else if (request.getParameter("action").equals("show_itemAll") == true) {%>

<%
String msg="";
    List lt = (List) request.getAttribute("data");
    HashMap hm = null;
    if (lt != null) {
        for (int j = 0; j < lt.size(); j++) {
            hm = (HashMap) lt.get(j);
            msg += "<option value='" + hm.get("item_id").toString() + "'";
            msg += ">";
            msg += hm.get("item_name").toString() + "</option>";
        }
    }else{out.print("null");
    }
    out.println(msg);
%>


<%}%>
