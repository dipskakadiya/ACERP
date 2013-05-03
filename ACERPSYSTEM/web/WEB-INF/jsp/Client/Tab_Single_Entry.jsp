<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<hr/>
<div>
    <%/* Success Notificationn */
        Integer status = Integer.parseInt(request.getParameter("flag"));
        if (status != 0) {
            if (status == 2) {
    %>
    <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'JVENTRY Create Successfully',
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
    <%}
        }%>
</div>
<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Single Entry</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="post" action="S_JvEntry.htm">
            <input name="menu" value="JvEntry" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <input name="id" value="<% out.print(request.getParameter("id"));%>" type="hidden"/>
            <% List ltSJV = (List) request.getAttribute("dataSJV");
                HashMap hmSJV = null;
                if (ltSJV != null) {
                    if (request.getParameter("id") != null) {
                        for (int i = 0; i < ltSJV.size(); i++) {
                            hmSJV = (HashMap) ltSJV.get(i);
                            if (request.getParameter("id").toString().equals(hmSJV.get("Bill_No").toString())) {
                                break;
                            }else{
                            hmSJV=null;
                            }
                        }
                    }
                }
            %>
            <fieldset>
                <legend style="text-align: center">JV Entry Information</legend>  <div class="mws-form-inline">
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-2-8">
                                </div>
                                <div class="mws-form-col-1-8 alpha">
                                    <label>Entry Date</label>
                                    <div class="mws-form-item">
                                        <input type="text" placeholder="YYYY-MM-DD" name="Entry_Date" id="Entry_Date" class="mws-textinput mws-datepicker" readonly value="<% if (hmSJV != null) {
                                                out.print(hmSJV.get("Entry_Date").toString().substring(0, 10));
                                            } else {
                                                Calendar currentDate = Calendar.getInstance();
                                                SimpleDateFormat formatter =
                                                        new SimpleDateFormat("yyyy-MM-dd");
                                                String dateNow = formatter.format(currentDate.getTime());
                                            out.print(dateNow);
                                        }%>" />
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                </div>
                                <div class="mws-form-col-1-8 omega">
                                    <label>Sr No/Bill no</label>
                                    <div class="mws-form-item">
                                        <input type="text" style="text-align: right;" name="Sr_Bill_No" id="Sr_Bill_No" class="mws-textinput" readonly value="<% if (hmSJV != null) {
                                                out.print(hmSJV.get("Bill_No"));
                                            } else {
                                            out.print(request.getAttribute("BNo"));
                                        }%>"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function(){
                            var coun=$("#Debit_Ac").val();
                            $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun, success:function(result){
                                    $("#AcAmount").html(result);
                                }});
                            $("#Debit_Ac").change(function(){
                                var coun=$("#Debit_Ac").val();
                                $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun, success:function(result){
                                        $("#AcAmount").html(result);
                                    }});
                            });
                            var coun=$("#Credit_Ac").val();
                            $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun, success:function(result){
                                    $("#AcAmount1").html(result);
                                }});
                            $("#Credit_Ac").change(function(){
                                var coun=$("#Credit_Ac").val();
                                $.ajax({url:"Ajex.htm?action=show_AcAmount&Ac_Id="+coun, success:function(result){
                                        $("#AcAmount1").html(result);
                                    }});
                            });
                        });
                    </script>
                    <fieldset>
                        <legend style="text-align: center">Account Information</legend>
                        <div class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <div class="mws-form-col-2-8 alpha">
                                    </div>
                                    <div class="mws-form-col-2-8 omega">
                                        <label>Debit Account</label>
                                        <div style="color: black" class="mws-form-item">
                                            <select class="chzn-select" name="Debit_Ac" id="Debit_Ac">
                                                <% List ltAC = (List) request.getAttribute("dataAC");
                                                    HashMap hmAC = null;
                                                    if (ltAC != null) {
                                                for (int j = 0; j < ltAC.size(); j++) {
                                                    hmAC = (HashMap) ltAC.get(j);%>
                                                <option value="<%out.print(hmAC.get("Ac_id"));%>"<%if (hmSJV != null && hmAC != null) {
                                                if (hmSJV.get("Dr_Ac").toString().equals(hmAC.get("Ac_Id").toString()) == true) {
                                                    out.print("selected");
                                                }
                                            }%>><%out.print(hmAC.get("Ac_name"));%></option>
                                                <% }
                                            }%>

                                            </select>
                                        </div>
                                        <div id="AcAmount"></div>
                                    </div>
                                    <div class="mws-form-col-2-8 omega">
                                        <label>Credit Account</label>
                                        <div style="color: black" class="mws-form-item">
                                            <select class="chzn-select" name="Credit_Ac" id="Credit_Ac">
                                                <%  ltAC = (List) request.getAttribute("dataAC");
                                                    hmAC = null;
                                                    if (ltAC != null) {
                                                for (int j = 0; j < ltAC.size(); j++) {
                                                    hmAC = (HashMap) ltAC.get(j);%>
                                                <option value="<%out.print(hmAC.get("Ac_id"));%>"<%if (hmSJV != null && hmAC != null) {
                                                if (hmSJV.get("Cr_Ac").toString().equals(hmAC.get("Ac_Id").toString()) == true) {
                                                    out.print("selected");
                                                }
                                            }%>><%out.print(hmAC.get("Ac_name"));%></option>
                                                <% }
                                            }%>
                                            </select>
                                        </div>
                                        <div id="AcAmount1"></div>
                                    </div>
                                </div>
                                <div class="mws-form-row">
                                    <div class="mws-form-cols clearfix">
                                        <div class="mws-form-item large">
                                            <div class="mws-form-col-3-8 alpha">
                                            </div>
                                            <div class="mws-form-col-2-8">
                                                <label>Total Account</label>
                                                <div class="mws-form-item">
                                                    <input type="text" style="text-align: right;" placeholder="0" name="Total_Amount" id="Total_Amount" class="validate[required,custom[number],min[1]] mws-textinput" value="<% if (hmSJV != null) {
                                                    out.print(hmSJV.get("Total_Amount"));
                                                } else {
                                                    out.print("0");
                                                }%>"/>
                                                </div>
                                            </div>
                                            <div class="mws-form-col-3-8 omega">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <fieldset>
                                    <legend style="text-align: center">Description Information</legend> <div class="mws-form-row">
                                        <div class="mws-form-cols clearfix">
                                            <div class="mws-form-item large">
                                                <div class="mws-form-col-2-8 alpha">
                                                </div>
                                                <div class="mws-form-col-2-8">
                                                    <label>Debit Description </label>
                                                    <div class="mws-form-item">
                                                        <textarea id="textarea" name="Debit_Description" id="Debit_Description"><% if (hmSJV != null) {
                                                    out.print(hmSJV.get("Dr_Desc"));
                                                }%>
                                                        </textarea>
                                                    </div>
                                                </div>
                                                <div class="mws-form-col-2-8">
                                                    <label>Credit Description</label>
                                                    <div class="mws-form-item">
                                                        <textarea id="textarea" name="Credit_Description" id="Credit_Description"><% if (hmSJV != null) {
                                                    out.print(hmSJV.get("Cr_Desc"));
                                                }%>

                                                        </textarea>
                                                    </div>
                                                </div>
                                                <div class="mws-form-col-2-8 omega">
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






