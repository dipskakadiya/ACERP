
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<hr/>
<div>
    <%/* Success Notification */
        Integer status = Integer.parseInt(request.getParameter("flag"));
        if (status != 0) {
            if (status == 2) {
    %>
    <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'Trade Create Successfully',
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
            window.open("Trade.htm?action=Item3dtagshow&menu=Trade&flag=0","_self");
            window.open("Trade.htm?menu=Trade&action=print_bill&pid=<%out.print(request.getParameter("pid"));%>","_blank");
        }
        function print_cancle(){
            window.open("Trade.htm?action=Item3dtagshow&menu=Trade&flag=0","_self");
        }
    </script>
</div>


<!--   MAin PAge    -->
<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Trading Detail</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="get"  action="Trade.htm">
            <input name="menu" value="Trade" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <input name="id" value="<% out.print(request.getParameter("id"));%>" type="hidden"/>
            <% List ltTrade = (List) request.getAttribute("dataTM");
                HashMap hmTrade = null;
                if (ltTrade != null) {
                    if (request.getParameter("id") != null) {
                        for (int i = 0; i < ltTrade.size(); i++) {
                            hmTrade = (HashMap) ltTrade.get(i);
                            if (request.getParameter("id").toString().equals(hmTrade.get("Bill_No").toString())) {
                                break;
                            } else {
                                hmTrade = null;
                            }
                        }
                    }
                }
            %>
            <div class="mws-form-inline">
                <fieldset>
                    <legend style="text-align: center">Trade Information</legend>
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-2-8 alpha">
                                    <label>Book Name</label>
                                    <div class="mws-form-item">
                                        <select id="Book_No" name="Book_No">
                                            <option value="Purchase Bill" <% if (hmTrade != null) {
                                                    if (hmTrade.get("Book_Name").toString().equals("Purchase Bill") == true) {
                                                        out.print("selected");
                                                    }
                                                }%>>Purchase Bill </option>
                                            <option value="Purchase Return Bill" <% if (hmTrade != null) {
                                                    if (hmTrade.get("Book_Name").toString().equals("Purchase Return Bill") == true) {
                                                        out.print("selected");
                                                    }
                                                }%>>Purchase Return Bill </option>
                                            <option value="Sales Bill" <% if (hmTrade != null) {
                                                    if (hmTrade.get("Book_Name").toString().equals("Sales Bill") == true) {
                                                        out.print("selected");
                                                    }
                                                }%>>Sales Bill </option>
                                            <option value="Sales Return Bill"<% if (hmTrade != null) {
                                                    if (hmTrade.get("Book_Name").toString().equals("Sales Return Bill") == true) {
                                                        out.print("selected");
                                                    }
                                                }%>>Sales Return Bill</option>
                                        </select>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $(document).ready(function(){
                                        var coun=$("#Book_No").val();
                                        var tbill=$("#Total_Bill_Amount").val();
                                        $.ajax({url:"Ajex.htm?action=show_Ac_Trade&BookName="+coun+"&tbill="+tbill+"&Ac_id="+<% if (hmTrade != null) {
                                                out.print(hmTrade.get("Ac_id"));
                                            } else {
                                                out.print("null");
                                            }%>, success:function(result){
                                                        $("#Display_Ac").html(result);
                                                    }});
                                                
                                                $("#Book_No").change(function(){
                                                    var coun=$("#Book_No").val();
                                                    var tbill=$("#Total_Bill_Amount").val();
                                                    $.ajax({url:"Ajex.htm?action=show_Ac_Trade&BookName="+coun+"&tbill="+tbill+"&Ac_id=null", success:function(result){
                                                            $("#Display_Ac").html(result);
                                                        }});
                                                });
                                                
                                                $("#Book_No").change(function(){
                                                    $("#TblIDetail").find("tr").remove();
                                                });
                                            });
                                </script>
                                <div class="mws-form-col-2-8">
                                    <label>Account / Ledger / party Name</label>
                                    <div id="Display_Ac" style="color: black;" class="mws-form-item">

                                    </div>
                                    <div id="AcAmount"></div>
                                </div>
                                <div class="mws-form-col-1-8">
                                    <label>Bill Date</label>
                                    <div class="mws-form-item">
                                        <input type="text" name="Bill_Date" id="Bill_Date" class="validate[required] mws-textinput  mws-datepicker" readonly value="<% if (hmTrade != null) {
                                                out.print(hmTrade.get("Bill_Date").toString().substring(0, 10));
                                            } else {
                                                Calendar currentDate = Calendar.getInstance();
                                                SimpleDateFormat formatter =
                                                        new SimpleDateFormat("yyyy-MM-dd");
                                                String dateNow = formatter.format(currentDate.getTime());
                                                out.print(dateNow);
                                            }%>" />
                                    </div>
                                </div>
                                <div class="mws-form-col-1-8">
                                    <label>Sr No/Bill no</label>
                                    <div class="mws-form-item">
                                        <input type="text" style="text-align: right;" name="Sr_Bill_No" id="Sr_Bill_No" class="validate[required] mws-textinput" readonly value="<% if (hmTrade != null) {
                                                out.print(hmTrade.get("Bill_No"));
                                            } else {
                                                out.print(request.getAttribute("Bill_no"));
                                            }%>" />
                                    </div>
                                </div>
                                <div class="mws-form-col-1-8">
                                    <label>Party Bill Date</label>
                                    <div class="mws-form-item">
                                        <input type="text" name="Party_Bill_Date" id="Party_Bill_Date" class="validate[required] mws-textinput mws-datepicker" readonly value="<% if (hmTrade != null) {
                                                out.print(hmTrade.get("Party_Bill_Date").toString().substring(0, 10));
                                            } else {
                                                Calendar currentDate = Calendar.getInstance();
                                                SimpleDateFormat formatter =
                                                        new SimpleDateFormat("yyyy-MM-dd");
                                                String dateNow = formatter.format(currentDate.getTime());
                                                out.print(dateNow);
                                            }%>" />
                                    </div>
                                </div>
                                <div class="mws-form-col-1-8 omega">
                                    <label>Party Sr No/Bill no</label>
                                    <div class="mws-form-item">
                                        <input type="text" style="text-align: right;" placeholder="0" name="Party_Sr_Bill_No" id="Party_Sr_Bill_No" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmTrade != null) {
                                                out.print(hmTrade.get("Party_Bill_No"));
                                            } else {
                                                out.print("0");
                                            }%>" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- *************************************************************** Item Detail*********************************************************************** -->
                    <script type="text/javascript">
                    $(document).ready(function(){
                        var pbno=$("#Book_No").val();
                        var coun=$("#Ctg_id").val();
                        $.ajax({url:"Ajex.htm?action=show_item&Ctg_Id="+coun+"&bookno="+pbno, success:function(result){
                                $("#Item").html(result);
                            }});

                        $("#Ctg_id").change(function(){
                            var pbno=$("#Book_No").val();
                            var coun=$("#Ctg_id").val();
                            $.ajax({url:"Ajex.htm?action=show_item&Ctg_Id="+coun+"&bookno="+pbno, success:function(result){
                                    $("#Item").html(result);
                                }});
                        });

                        $("#Book_No").change(function(){
                            var pbno=$("#Book_No").val();
                            var coun=$("#Ctg_id").val();
                            $.ajax({url:"Ajex.htm?action=show_item&Ctg_Id="+coun+"&bookno="+pbno, success:function(result){
                                    $("#Item").html(result);
                                }});
                        });

                    });
                    </script>
                    <fieldset>
                        <legend style="text-align: center">Item Detail Information</legend>
                        <div class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <div class="mws-form-col-2-8">
                                        <label>Item Category</label>
                                        <div class="mws-form-item">
                                            <select name='Ctg_id' id='Ctg_id'>
                                                <% List ltICtg = (List) request.getAttribute("dataCtg");
                                                    HashMap hmICtg = null;
                                                    if (ltICtg != null) {
                                                        for (int j = 0; j < ltICtg.size(); j++) {
                                                            hmICtg = (HashMap) ltICtg.get(j);%>
                                                <option value="<%out.print(hmICtg.get("Ctg_id"));%>"><%out.print(hmICtg.get("Ctg_Name"));%></option>
                                                <% }
                                                    }%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- *************************************************************** Item Display*********************************************************************** -->
                        <%@include file="DemoItem.jsp" %>
                        <!-- *************************************************************** Item Detail over ***************************************************************** -->
                        <fieldset>
                            <legend style="text-align: center">Bill Information</legend>
                            <div class="mws-form-row">
                                <div class="mws-form-cols clearfix">
                                    <div class="mws-form-item large">
                                        <div class="mws-form-col-2-8 alpha">
                                            <label>Total Qty</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="Total_Qty" id="Total_Qty" readonly class="validate[required,min[1]] mws-textinput" value="<% if (hmTrade != null) {
                                                        out.print(hmTrade.get("Total_Qty"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-2-8">
                                            <label>Discount (%)</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="Discount" id="Discount" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmTrade != null) {
                                                        out.print(hmTrade.get("Discount"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-2-8">
                                            <label>Total tax Amount</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="Total_Tax_Amount" id="Total_Tax_Amount" readonly class="validate[required] mws-textinput" value="<% if (hmTrade != null) {
                                                        out.print(hmTrade.get("Total_Tax"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-2-8">
                                            <label>Total Gross Amount</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="Total_Gross_Amount" id="Total_Gross_Amount" readonly class="validate[required,min[1]] mws-textinput" value="<% if (hmTrade != null) {
                                                        out.print(hmTrade.get("Total_Gross"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <div class="mws-form-cols clearfix">
                                    <div class="mws-form-item large">
                                        <div class="mws-form-col-2-8 alpha">
                                            <label>Bill Remarks</label>
                                            <div class="mws-form-item">
                                                <textarea class="" name="Bill_Remarks" id="Bill_Remarks"><% if (hmTrade != null) {
                                                        out.print(hmTrade.get("Bill_Remark"));
                                                    }%></textarea>
                                            </div>
                                        </div>
                                        <div class="mws-form-col-2-8">
                                            <label>Bill mode</label>
                                            <div class="mws-form-item">
                                                <select name="Bill_Mode" id="Bill_Mode">
                                                    <option value="Credit Bill" <% if (hmTrade != null) {
                                                            if (hmTrade.get("Bill_Mode").toString().equals("Credit Bill") == true) {
                                                                out.print("selected");
                                                            }
                                                        }%>>Credit Bill</option>

                                                    <option value="Case Memo" <% if (hmTrade != null) {
                                                            if (hmTrade.get("Bill_Mode").toString().equals("Case Memo") == true) {
                                                                out.print("selected");
                                                            }
                                                        }%>>Case Memo</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8">
                                            <label>Due Days</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="Due_Days" id="Due_Days" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmTrade != null) {
                                                        out.print(hmTrade.get("Due_Days"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-3-8 omega">
                                            <div class="mws-form-col-2-8 alpha">
                                            </div>
                                            <div class="mws-form-col-6-8 omega">
                                                <label>Total Bill Amount</label>
                                                <div class="mws-form-item">
                                                    <input type="text" style="text-align: right;" placeholder="0" name="Total_Bill_Amount" id="Total_Bill_Amount" readonly class="validate[required,min[1],funcCall[checklimit]] mws-textinput" value="<% if (hmTrade != null) {
                                                            out.print(hmTrade.get("Total_Amount"));
                                                        } else {
                                                            out.print("0");
                                                        }%>" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script>
                            $(document).ready(function(){
                                //Couurency management show
                                if($("#Bill_Mode").val()=="Case Memo"){
                                    $("#Currency_Row").attr("style","")
                                }
                                $("#Bill_Mode").change(function(){
                                    if($("#Bill_Mode").val()=="Credit Bill"){
                                        $("#Currency_Row").attr("style","display:none")
                                    }else{
                                        $("#Currency_Row").attr("style","")
                                    }
                                });
                                //Count iscount
                                $("#Discount").change(function(){
                                    var discount= parseFloat($("#Total_Gross_Amount").val());
                                    var discount=discount*parseFloat($("#Discount").val())/100;
                                    var dtotal=parseFloat($("#Total_Gross_Amount").val())+parseFloat($("#Total_Tax_Amount").val())
                                    var dtotal_bill=dtotal-discount;
                                    $("#Total_Bill_Amount").val(dtotal_bill);
                                });
                            })
                   
                            </script>
                            <!-- *********************************************************** currency management ****************************************************************  -->
                            <% List ltCur = (List) request.getAttribute("dataCur");
                                HashMap hmCur = null;
                                if (ltCur != null) {
                                    if (request.getParameter("id") != null) {
                                        for (int i = 0; i < ltCur.size(); i++) {
                                            hmCur = (HashMap) ltCur.get(i);
                                            if (request.getParameter("id").toString().equals(hmCur.get("Bill_No").toString())) {
                                                break;
                                            } else {
                                                hmCur = null;
                                            }
                                        }
                                    }
                                }
                            %>
                            <div id="Currency_Row" style="display: none;" class="mws-form-row">
                                <div class="mws-form-cols clearfix">
                                    <div class="mws-form-item large">
                                        <fieldset>
                                            <legend style="text-align: center">Currency Information</legend>
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
                            </div>
                            <script>
                            //currency add and subtraction
                            C_Amount=parseFloat($("#Total_Bill_Amount").val());
                            C_Amount-=parseFloat($("#C_1000").val()*1000);
                            C_Amount-=parseFloat($("#C_500").val()*500);
                            C_Amount-=parseFloat($("#C_100").val()*100);
                            C_Amount-=parseFloat($("#C_50").val()*50);
                            C_Amount-=parseFloat($("#C_20").val()*20);
                            C_Amount-=parseFloat($("#C_10").val()*10);
                            $("#Currency_Amount").text(C_Amount);
                            $("#C_1000,#C_500,#C_100,#C_50,#C_20,#C_10").change(function(){
                                C_Amount=parseFloat($("#Total_Bill_Amount").val());
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
                                <input type="submit" class="mws-button blue  mws-i-24 i-save large" name="action" value="Save" />
                                <!--input type="reset" value="Reset" class="mws-button gray" /-->
                            </div>
                            </form>
                            </div>
                            </div>
                            <script>
                            function checklimit(field, rules, i, options){
                                var limit=parseFloat($('#limit').val())-parseFloat($('#Total_Bill_Amount').val());
                                if(limit<0){
                                    options.allrules.validate2fields.alertText="Your Limit is:"+$('#limit').val()+"<br/>Please Remove product from cart";
                                    return options.allrules.validate2fields.alertText;
                                }
                            }
                            
                            </script>