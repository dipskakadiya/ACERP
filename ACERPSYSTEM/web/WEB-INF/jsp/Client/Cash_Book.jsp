<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<hr/>
<div>
    <%/* Successs Notification*/
        Integer status = Integer.parseInt(request.getParameter("flag"));
        if (status != 0) {
            if (status == 2) {
    %>
    <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'Cash Transection Create Successfully',
                pnotify_animation: {effect_in: function(status, callback, pnotify){
                        var source_note = 'Always call the callback when the animation completes.';
                        var cur_angle = 0;
                        var cur_opacity_scale = 0;
                        var timer = setInterval(function(){
                            cur_angle += 10;
                            if (cur_angle == 360) {
                                cur_angle = 0;
                                cur_opacity_scale = 1;
                                clearInterval(timer);
                            } else {
                                cur_opacity_scale = cur_angle / 360;
                            }
                            pnotify.css({
                                '-moz-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-webkit-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-o-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-ms-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                'filter': ('progid:DXImageTransform.Microsoft.BasicImage(rotation='+(cur_angle / 360 * 4)+')')
                            }).fadeTo(0, cur_opacity_scale);
                            if (cur_angle == 0)
                                callback();
                        }, 20);
                    }, effect_out: function(status, callback, pnotify){
                        var source_note = 'Always call the callback when the animation completes.';
                        var cur_angle = 0;
                        var cur_opacity_scale = 1;
                        var timer = setInterval(function(){
                            cur_angle += 10;
                            if (cur_angle == 360) {
                                cur_angle = 0;
                                cur_opacity_scale = 0;
                                clearInterval(timer);
                            } else {
                                cur_opacity_scale = cur_angle / 360;
                                cur_opacity_scale = 1 - cur_opacity_scale;
                            }
                            pnotify.css({
                                '-moz-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-webkit-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-o-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                '-ms-transform': ('rotate('+cur_angle+'deg) scale('+cur_opacity_scale+')'),
                                'filter': ('progid:DXImageTransform.Microsoft.BasicImage(rotation='+(cur_angle / 360 * 4)+')')
                            }).fadeTo(0, cur_opacity_scale);
                            if (cur_angle == 0) {
                                pnotify.hide();
                                callback();
                            }
                        }, 20);
                    }}
            });
        });
    </script>
<script>
        $(document).ready(function() {
            var notice = $.pnotify({
                pnotify_text: $('#form_notice').html(),
                pnotify_notice_icon: '',
                pnotify_width: 'auto',
                pnotify_hide: false,
                pnotify_closer: false,
                pnotify_sticker: false,
                pnotify_insert_brs: false
            });
        });
       
    </script>
    <%}
        }%>
</div>
<!-- ASK for Print  -->
<div style="display: none"><div id="form_notice">
        Do You Want to Printout The  Bill?<br/>
        <div style="float: right"> <input type="button" class="mws-button blue  mws-i-24" onclick="print_bill()" value="Yes" />
            <input type="button" class="mws-button red  mws-i-24" onclick="print_cancle()" value="No" />
        </div>
    </div>
    <script>
        function print_bill(){
            window.open("Cash.htm?action=show&menu=Cash&flag=0&id=0","_self");
            window.open("Cash.htm?menu=Cash&action=print_bill&pid=<%out.print(request.getParameter("pid"));%>","_blank");
        }
        function print_cancle(){
            window.open("Cash.htm?action=show&menu=Cash&flag=0&id=0","_self");
        }
    </script>
</div>
<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Cash Transection</span>
    </div>
    <div class="mws-panel-body">
        <form  id="formID" class="mws-form" method="post" action="Cash.htm">
            <input name="menu" value="Cash" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
                  <input name="id" value="<% out.print(request.getParameter("id"));%>" type="hidden"/>
            <%  List ltCtr = (List) request.getAttribute("dataCtr");
                HashMap hmCtr = null;
                if (ltCtr != null) {
                    if (request.getParameter("id") != null) {
            %>
            <input name="Tr_id" value="<% out.print(request.getParameter("id"));%>" type="hidden"/>
            <%
                        for (int i = 0; i < ltCtr.size(); i++) {
                            hmCtr = (HashMap) ltCtr.get(i);
                            if (request.getParameter("id").toString().equals(hmCtr.get("TR_ID").toString())) {
                                break;
                            }else{
                            hmCtr=null;
                            }
                        }
                    }
                }
            %>
            <div class="mws-form-inline">
                <fieldset>
                    <legend style="text-align: center">Cash Transection Information</legend>
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-1-8">
                                </div>
                                <div class="mws-form-col-2-8 alpha">
                                    <label>Cash Transection</label>
                                    <div class="mws-form-item">
                                        <select name="T_Type" id="T_Type">
                                            <option value="Payment" <% if (hmCtr != null) {
                                                    if (hmCtr.get("Tr_Type").toString().equals("Payment")) {
                                                        out.print("selected");
                                                    }
                                                }%>>Payment</option>

                                            <option value="Receipt" <% if (hmCtr != null) {
                                                    if (hmCtr.get("Tr_Type").toString().equals("Receipt")) {
                                                        out.print("selected");
                                                    }
                                                }%>>Receipt</option>
                                        </select>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $(document).ready(function(){
                                        var coun=$("#cash_id").val();
                                        $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun, success:function(result){
                                                $("#AcAmount1").html(result);
                                            }});
                                        $("#cash_id").change(function(){
                                            var coun=$("#cash_id").val();
                                            $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun, success:function(result){
                                                    $("#AcAmount1").html(result);
                                                }});
                                        });
                                    });
                                </script>
                                <div class="mws-form-col-2-8">
                                    <label>Cash Account</label>
                                    <div class="mws-form-item large">
                                        <select name="cash_id" id="cash_id">
                                            <% List ltCash = (List) request.getAttribute("dataCash");
                                                HashMap hmCash = null;
                                                if (ltCash != null) {
                                                    for (int j = 0; j < ltCash.size(); j++) {
                                                        hmCash = (HashMap) ltCash.get(j);%>
                                            <option value="<%out.print(hmCash.get("Ac_id"));%>"<%if (hmCash != null && hmCtr != null) {
                                                    if (hmCtr.get("cash_id").toString().equals(hmCash.get("Ac_id").toString()) == true) {
                                                        out.print("selected");
                                                    }
                                                }%>><%out.print(hmCash.get("Ac_name"));%></option>
                                            <% }
                                                }%>

                                        </select>
                                    </div>
                                    <div id="AcAmount1"></div>
                                </div>
                                <div class="mws-form-col-1-8">
                                    <label>Entry Date</label>
                                    <div class="mws-form-item">
                                        <input type="text" placeholder="YYYY-MM-DD" name="Entry_Date" id="Entry_Date" class="validate[required] mws-textinput mws-datepicker" readonly value="<% if (hmCtr != null) {
                                                out.print(hmCtr.get("Entry_Date").toString().substring(0, 10));
                                            } else {
                                                Calendar currentDate = Calendar.getInstance();
                                                SimpleDateFormat formatter =
                                                        new SimpleDateFormat("yyyy/MM/dd");
                                                String dateNow = formatter.format(currentDate.getTime());
                                                out.print(dateNow);
                                            }%>"/>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $(document).ready(function(){
                                        var coun=$("#T_Type").val();
                                        $.ajax({url:"Ajex.htm?action=show_Ac_BCTrade&BookName="+coun+"&Ac_id="+<% if (hmCtr != null) {
                                                out.print(hmCtr.get("Ac_id"));
                                            } else {
                                                out.print("null");
                                            }%>+"&Bill_No="+<% if (hmCtr != null) {
                                                   out.print(hmCtr.get("BILL_NO"));
                                               } else {
                                                   out.print("null");
                                               }%>, success:function(result){
                                                           $("#Display_Ac").html(result);
                                                       }});
                                                
                                                   $("#T_Type").change(function(){
                                                       var coun=$("#T_Type").val();
                                                       $.ajax({url:"Ajex.htm?action=show_Ac_BCTrade&BookName="+coun+"&Ac_id=null", success:function(result){
                                                               $("#Display_Ac").html(result);
                                                           }});
                                                   });
                                               });
                                </script>
                                <div class="mws-form-col-2-8 omega">
                                    <label>Account / Ledger / party Name</label>
                                    <div id="Display_Ac" style="color: black;" class="mws-form-item">
                                    </div>
                                    <div id="AcAmount"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                    $(document).ready(function(){
                        var coun=$("#Account_No").val();
                        $.ajax({url:"Ajex.htm?action=show_billno&Ac_Id="+coun+"&bill_no=<%if (hmCash != null) {
                                out.print(hmCash.get("BILL_NO"));
                            } else {
                                out.print("null");
                            }%>", success:function(result){
                                    $("#Display_bill").html(result);
                                }});
                            $("#Account_No").change(function(){
                                var coun=$("#Account_No").val();
                                $.ajax({url:"Ajex.htm?action=show_billno&Ac_Id="+coun+"&bill_no=null", success:function(result){
                                        $("#Display_bill").html(result);
                                    }});
                            });
                        });
                    </script>
                    <fieldset>
                        <legend style="text-align: center">Other Information</legend>
                        <div class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <div class="mws-form-col-1-8">
                                    </div>
                                    <div class="mws-form-col-2-8 alpha">
                                        <label>Sr No/Bill no</label>
                                        <div id="Display_bill" style="color: black" id="D_Bill_No" class="mws-form-item">
                                        </div>
                                    </div>
                                    <div class="mws-form-col-2-8">
                                        <label>Total Amount</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="0" name="Total_Amount" id="Total_Amount" class="validate[required,custom[number],min[1]] mws-textinput" value="<% if (hmCtr != null) {
                                                    out.print(hmCtr.get("Total_Amount"));
                                                } else {
                                                    out.print("0");
                                                }%>"/>
                                        </div>
                                    </div>
                                    <div class="mws-form-col-2-8 omega">
                                        <label>Bill Remarks</label>
                                        <div class="mws-form-item">
                                            <textarea name="Bill_Remarks" id="Bill_Remarks"><% if (hmCtr != null) {
                                                    out.print(hmCtr.get("Bill_Remark"));
                                                }%></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        <!-- *********************************************************** currency management ****************************************************************  -->
                        <% List ltCur = (List) request.getAttribute("dataCur");
                            HashMap hmCur = null;
                            if (ltCur != null) {
                                if (request.getParameter("id") != null) {
                                    for (int i = 0; i < ltCur.size(); i++) {
                                        hmCur = (HashMap) ltCur.get(i);
                                        if (request.getParameter("id").toString().equals(hmCur.get("tr_id").toString())) {
                                            break;
                                        } else {
                                            hmCur = null;
                                        }
                                    }
                                }
                            }
                        %>

                        <div id="Currency_Row" class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <fieldset>
                                        <legend style="text-align: center">Currency Information</legend>
                                        <div class="mws-form-col-1-8 alpha"></div>
                                        <div class="mws-form-col-1-8 alpha">
                                            <label>1000</label>
                                            <div class="mws-form-item">
                                                <input type="text"  style="text-align: right;" placeholder="0" name="C_1000" id="C_1000" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmCur != null) {
                                                        out.print(hmCur.get("C1000"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8">
                                            <label>500</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="C_500" id="C_500" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmCur != null) {
                                                        out.print(hmCur.get("C500"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8">
                                            <label>100</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="C_100" id="C_100" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmCur != null) {
                                                        out.print(hmCur.get("C100"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8">
                                            <label>50</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="C_50" id="C_50" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmCur != null) {
                                                        out.print(hmCur.get("C50"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8">
                                            <label>20</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="C_20" id="C_20" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmCur != null) {
                                                        out.print(hmCur.get("C20"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8 omega">
                                            <label>10</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="C_10" id="C_10" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmCur != null) {
                                                        out.print(hmCur.get("C10"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div  class="mws-form-col-1-8 omega">
                                            <label id="Currency_Amount" style="color: red"></label>
                                        </div>
                                </div>
                            </div>
                        </div>

                        <script>
                    C_Amount=parseFloat($("#Total_Amount").val());
                    C_Amount-=parseFloat($("#C_1000").val()*1000);
                    C_Amount-=parseFloat($("#C_500").val()*500);
                    C_Amount-=parseFloat($("#C_100").val()*100);
                    C_Amount-=parseFloat($("#C_50").val()*50);
                    C_Amount-=parseFloat($("#C_20").val()*20);
                    C_Amount-=parseFloat($("#C_10").val()*10);
                    $("#Currency_Amount").text(C_Amount);
                    $("#C_1000").change(function(){
                        C_Amount=parseFloat($("#Total_Amount").val());
                        C_Amount-=parseFloat($("#C_1000").val()*1000);
                        C_Amount-=parseFloat($("#C_500").val()*500);
                        C_Amount-=parseFloat($("#C_100").val()*100);
                        C_Amount-=parseFloat($("#C_50").val()*50);
                        C_Amount-=parseFloat($("#C_20").val()*20);
                        C_Amount-=parseFloat($("#C_10").val()*10);
                        $("#Currency_Amount").text(C_Amount);
                    })
                    $("#C_500").change(function(){
                        C_Amount=parseFloat($("#Total_Amount").val());
                        C_Amount-=parseFloat($("#C_1000").val()*1000);
                        C_Amount-=parseFloat($("#C_500").val()*500);
                        C_Amount-=parseFloat($("#C_100").val()*100);
                        C_Amount-=parseFloat($("#C_50").val()*50);
                        C_Amount-=parseFloat($("#C_20").val()*20);
                        C_Amount-=parseFloat($("#C_10").val()*10);
                        $("#Currency_Amount").text(C_Amount);
                    })
                    $("#C_100").change(function(){
                        C_Amount=parseFloat($("#Total_Amount").val());
                        C_Amount-=parseFloat($("#C_1000").val()*1000);
                        C_Amount-=parseFloat($("#C_500").val()*500);
                        C_Amount-=parseFloat($("#C_100").val()*100);
                        C_Amount-=parseFloat($("#C_50").val()*50);
                        C_Amount-=parseFloat($("#C_20").val()*20);
                        C_Amount-=parseFloat($("#C_10").val()*10);
                        $("#Currency_Amount").text(C_Amount);
                    })
                    $("#C_50").change(function(){
                        C_Amount=parseFloat($("#Total_Amount").val());
                        C_Amount-=parseFloat($("#C_1000").val()*1000);
                        C_Amount-=parseFloat($("#C_500").val()*500);
                        C_Amount-=parseFloat($("#C_100").val()*100);
                        C_Amount-=parseFloat($("#C_50").val()*50);
                        C_Amount-=parseFloat($("#C_20").val()*20);
                        C_Amount-=parseFloat($("#C_10").val()*10);
                        $("#Currency_Amount").text(C_Amount);
                    })
                    $("#C_20").change(function(){
                        C_Amount=parseFloat($("#Total_Amount").val());
                        C_Amount-=parseFloat($("#C_1000").val()*1000);
                        C_Amount-=parseFloat($("#C_500").val()*500);
                        C_Amount-=parseFloat($("#C_100").val()*100);
                        C_Amount-=parseFloat($("#C_50").val()*50);
                        C_Amount-=parseFloat($("#C_20").val()*20);
                        C_Amount-=parseFloat($("#C_10").val()*10);
                        $("#Currency_Amount").text(C_Amount);
                    })
                    $("#C_10").change(function(){
                        C_Amount=parseFloat($("#Total_Amount").val());
                        C_Amount-=parseFloat($("#C_1000").val()*1000);
                        C_Amount-=parseFloat($("#C_500").val()*500);
                        C_Amount-=parseFloat($("#C_100").val()*100);
                        C_Amount-=parseFloat($("#C_50").val()*50);
                        C_Amount-=parseFloat($("#C_20").val()*20);
                        C_Amount-=parseFloat($("#C_10").val()*10);
                        $("#Currency_Amount").text(C_Amount);
                    })
                        </script>
                        <!-- *********************************************************** currency management Over ****************************************************************  -->

                        <div class="mws-button-row">
                            <input type="submit" class="mws-button save green" name="action" value="Save" />
                            <!--input type="reset" value="Reset" class="mws-button gray" /-->
                        </div>
                        </form>
                        </div>
                        </div>