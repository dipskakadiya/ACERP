

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<hr/>
<div>
    <%/* Success notification */
        Integer status = Integer.parseInt(request.getParameter("flag"));
        if (status != 0) {
            if (status == 2) {
    %>
    <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'Bank Transection Create Successfully',
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
            window.open("Bank.htm?action=show&menu=Bank&flag=0&id=0","_self");
            window.open("Bank.htm?menu=Bank&action=print_bill&pid=<%out.print(request.getParameter("pid"));%>","_blank");
        }
        function print_cancle(){
            window.open("Bank.htm?action=show&menu=Bank&flag=0&id=0","_self");
        }
    </script>
</div>


<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Bank Transection</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="post" action="Bank.htm">
            <input name="menu" value="Bank" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <input name="id" value="<% out.print(request.getParameter("id"));%>" type="hidden"/>
            <%  List ltBtr = (List) request.getAttribute("dataBtr");
                HashMap hmBtr = null;
                if (ltBtr != null) {
                    if (request.getParameter("id") != null) {
            %>
            <input name="Tr_id" value="<% out.print(request.getParameter("id"));%>" type="hidden"/>
            <%
                        for (int i = 0; i < ltBtr.size(); i++) {
                            hmBtr = (HashMap) ltBtr.get(i);
                            if (request.getParameter("id").toString().equals(hmBtr.get("TR_ID").toString())) {
                                break;
                            } else {
                                hmBtr = null;
                            }
                        }
                    }
                }
            %>
            <div class="mws-form-inline">
                <fieldset>
                    <legend style="text-align: center">Bank Transection Information</legend>
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-1-8">
                                </div>
                                <div class="mws-form-col-2-8 alpha">
                                    <label>Bank Transection</label>
                                    <div class="mws-form-item">
                                        <select name="T_Type" id="T_Type">
                                            <option  <% if (hmBtr != null) {
                                                    out.print(hmBtr.get("TR_TYPE"));

                                                    if (hmBtr.get("TR_TYPE").toString().equals("Payment") == true) {
                                                    out.print("selected");
                                                }
                                            }%>>Payment</option>
                                            <option <% if (hmBtr != null) {
                                                if (hmBtr.get("TR_TYPE").toString().equals("Receipt") == true) {
                                                    out.print("selected");
                                                }
                                            }%>>Receipt</option>
                                        </select>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $(document).ready(function(){
                                        var coun=$("#Bank_Name").val();
                                        $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun, success:function(result){
                                                $("#AcAmount1").html(result);
                                            }});
                                        $("#Bank_Name").change(function(){
                                            var coun=$("#Bank_Name").val();
                                            $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun, success:function(result){
                                                    $("#AcAmount1").html(result);
                                                }});
                                        });
                                    });
                                </script>
                                <div class="mws-form-col-2-8">
                                    <label>Your Bank Name</label>
                                    <div class="mws-form-item">
                                        <select name="Bank_Name" id="Bank_Name">
                                            <% List ltBank = (List) request.getAttribute("dataBank");
                                                HashMap hmBank = null;
                                                if (ltBank != null) {
                                                for (int j = 0; j < ltBank.size(); j++) {
                                                    hmBank = (HashMap) ltBank.get(j);%>
                                            <option value="<%out.print(hmBank.get("Ac_id"));%>"<%if (hmBank != null && hmBtr != null) {
                                                if (hmBtr.get("BANK_NAME").toString().equals(hmBank.get("Ac_id").toString()) == true) {
                                                    out.print("selected");
                                                }
                                            }%>><%out.print(hmBank.get("Ac_name"));%></option>
                                            <% }
                                            }%>
                                        </select>
                                    </div>
                                    <div id="AcAmount1"></div>
                                </div>
                                <div class="mws-form-col-1-8">
                                    <label>Entry Date</label>
                                    <div class="mws-form-item large">
                                        <input type="text" placeholder="YYYY-MM-DD" name="Entry_Date" id="Entry_Date" class="validate[required] mws-textinput mws-datepicker" readonly value="<% if (hmBtr != null) {
                                                out.print(hmBtr.get("Entry_Date").toString().substring(0, 10));
                                            } else {
                                                Calendar currentDate = Calendar.getInstance();
                                                SimpleDateFormat formatter =
                                                        new SimpleDateFormat("yyyy/MM/dd");
                                                String dateNow = formatter.format(currentDate.getTime());
                                            out.print(dateNow);
                                        }%>" />
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $(document).ready(function(){
                                        var coun=$("#T_Type").val();
                                        $.ajax({url:"Ajex.htm?action=show_Ac_BCTrade&BookName="+coun+"&Ac_id="+<% if (hmBtr != null) {
                                                    out.print(hmBtr.get("Ac_id"));
                                                } else {
                                                    out.print("null");
                                                }%>+"&Bill_No="+<% if (hmBtr != null) {
                                                    out.print(hmBtr.get("BILL_NO"));
                                                } else {
                                                    out.print("null");
                                                }%>+"&PB_Bank="+<% if (hmBtr != null) {
                                                    out.print(hmBtr.get("PARTY_BANK_NAME"));
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
                                    <div class="mws-form-col-1-8 alpha">
                                        <label>Check No</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="0" name="Check_No" id="Check_No" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmBtr != null) {
                                            out.print(hmBtr.get("CHK_NO"));
                                        } else {
                                            out.print("0");
                                        }%>"/>
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8">
                                        <label>Check Date</label>
                                        <div class="mws-form-item">
                                            <input type="text" placeholder="YYYY-MM-DD" name="Check_Date" id="Check_Date" class="validate[required] mws-textinput mws-datepicker" readonly value="<% if (hmBtr != null) {
                                            out.print(hmBtr.get("CHK_DATE").toString().substring(0, 10));
                                        }%>"/>
                                        </div>
                                    </div>
                                    <div class="mws-form-col-2-8 omega">
                                        <label>Party Bank Name</label>
                                        <div id="Party_Bank_No" class="mws-form-item">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <div class="mws-form-col-3-8">
                                    </div>
                                    <div class="mws-form-col-2-8 omega">
                                        <label>Bill Remarks</label>
                                        <div class="mws-form-item">
                                                <textarea name="Bill_Remarks" id="Bill_Remarks"><% if (hmBtr != null) {
                                            out.print(hmBtr.get("BILL_REMARK"));
                                        }%></textarea>
                                        </div>
                                    </div>
                                    <div class="mws-form-col-2-8">
                                        <label>Total Amount</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="0" name="Total_Amount" id="Total_Amount" class="validate[required,custom[number],min[1]] mws-textinput" value="<% if (hmBtr != null) {
                                            out.print(hmBtr.get("TOTAL_AMOUNT"));
                                        } else {
                                            out.print("0");
                                        }%>"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="mws-button-row">
                            <input type="submit" class="mws-button save green" name="action" value="Save" />
                            <!--input type="reset" value="Reset" class="mws-button gray" /-->
                        </div>
                        </form>
                        </div>
                        </div>