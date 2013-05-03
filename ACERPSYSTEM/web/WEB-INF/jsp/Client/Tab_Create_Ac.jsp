<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
                pnotify_text: 'Account Create Successfully',
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
<div  class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Add Account</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="post" action="Account.htm">
            <input name="menu" value="Account" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <input name="id" value="<% out.print(request.getParameter("id"));%>" type="hidden"/>
            <% List ltAc = (List) request.getAttribute("dataAc");
                HashMap hmAc = null;
                if (ltAc != null) {
                    if (request.getParameter("id") != null) {
                        for (int i = 0; i < ltAc.size(); i++) {
                            hmAc = (HashMap) ltAc.get(i);
                            if (request.getParameter("id").toString().equals(hmAc.get("Ac_id").toString())) {
                                break;
                            } else {
                                hmAc = null;
                            }
                        }
                    }
                }
            %>
            <fieldset>
                <legend style="text-align: center">Accounting Information</legend>
                <div class="mws-form-inline">
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-1-8 alpha">
                                    <label>Account Code</label>
                                    <div class="mws-form-item">
                                        <input type="text" style="text-align: right;" name="Ac_Code" id="Ac_Code" readonly class="mws-textinput" value="<% if (hmAc != null) {
                                                out.print(hmAc.get("Ac_id"));
                                            } else {
                                                out.print(request.getAttribute("Ac_no"));
                                            }%>" />
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label>Account / Ledger / party Name</label>
                                    <div class="mws-form-item">
                                        <input type="text" name="Ac_Name" id="Ac_Name" class="validate[required] mws-textinput" value="<% if (hmAc != null) {
                                                out.print(hmAc.get("Ac_Name"));
                                            }%>"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label>Account Head / Group</label>
                                    <div style="color: black" class="mws-form-item omega" id="Ac_Head">
                                        <select class="validate[required] chzn-select" name='Ac_Head' id='Ac_Head'>
                                            <% List ltAH = (List) request.getAttribute("dataAH");
                                                HashMap hmAH = null;
                                                if (ltAH != null) {
                                                    for (int j = 0; j < ltAH.size(); j++) {
                                                        hmAH = (HashMap) ltAH.get(j);%>
                                            <option value="<%out.print(hmAH.get("Head_id"));%>"<%if (hmAc != null) {
                                                    if (hmAc.get("Head_id").toString().equals(hmAH.get("Head_id").toString()) == true) {
                                                        out.print("selected");
                                                    }
                                                }%>><%out.print(hmAH.get("Ac_name"));%></option>
                                            <% }
                                                }%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <fieldset>
                        <legend style="text-align: center">Personale Information</legend>
                        <div class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <div class="mws-form-col-1-8 alpha">
                                        <label>Opening Balance</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" name="Opening_Bal" id="Opening_Bal" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmAc != null) {
                                                    out.print(hmAc.get("Op_Bal"));
                                                } else {
                                                    out.print("0");
                                                }%>" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8">
                                        <label>Balance Type</label>
                                        <div class="mws-form-item">
                                            <select name="Bal_Type" id="Bal_Type">
                                                <option value="Dr" <% if (hmAc != null) {
                                                        if (hmAc.get("Bal_Type").toString().equals("Dr") == true) {
                                                            out.print("selected");
                                                        }
                                                    }%>>Debit</option>
                                                <option value="Cr" <% if (hmAc != null) {
                                                        if (hmAc.get("Bal_Type").toString().equals("Cr") == true) {
                                                            out.print("selected");
                                                        }
                                                    }%>>Credit</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mws-form-col-2-8">
                                        <label>Contact Person</label>
                                        <div class="mws-form-item">
                                            <input type="text" name="Cont_Person" id="Cont_Person" class="mws-textinput" value="<% if (hmAc != null) {
                                                    out.print(hmAc.get("ref_Person"));
                                                }%>" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-2-8">
                                        <label>Business / Bill Address</label>
                                        <div class="mws-form-item">
                                            <div class="mws-form-col-5-8 alpha">
                                                <input type="text" name="Business_Address" id="Business_Address" class="validate[required] mws-textinput" value="<% if (hmAc != null) {
                                                        out.print(hmAc.get("C_Address"));
                                                    }%>" />
                                            </div>
                                            <div class="mws-form-col-3-8 omega">
                                                <input type="text" style="text-align: right;" placeholder="Pincode" name="Pincode" id="Pincode" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmAc != null) {
                                                        out.print(hmAc.get("Pincode"));
                                                    }%>" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mws-form-col-2-8 omega">
                                        <label>Resident Address</label>
                                        <div class="mws-form-item">
                                            <textarea name="Resident_Address" id="Resident_Address" class="validate[required]"><% if (hmAc != null) {
                                                    out.print(hmAc.get("R_Address"));
                                                }%></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            $(document).ready(function(){
                                $.ajax({url:"Ajex.htm?action=show&C_id=<%if (hmAc != null) {
                                        out.print(hmAc.get("C_name"));
                                    }%>&S_id=<%if (hmAc != null) {
                                            out.print(hmAc.get("S_name"));
                                        }%>&Ci_id=<%if (hmAc != null) {
                                                out.print(hmAc.get("Ci_name"));
                                            }%>", success:function(result){
                                                        $("#Contry").html(result);
                                                    }});
                                            });
                        </script>
                        <div class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <div class="mws-form-col-1-8 alpha">
                                        <label>Contry</label>
                                        <div id="Contry" class="mws-form-item">
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8">
                                        <label>State</label>
                                        <div id="State" class="mws-form-item">
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8">
                                        <label>City</label>
                                        <div id="City" class="mws-form-item">
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8">
                                        <label>Join Date</label>
                                        <div class="mws-form-item">
                                            <input type="text" placeholder="YYYY-MM-DD" name="Join_Date" id="Join_Date" class="mws-textinput mws-datepicker" value="<% if (hmAc != null) {
                                                    out.print(hmAc.get("Join_Date").toString().substring(0, 10));
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
                                        <label>Mobile No</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="Contect No" name="Mobile_No" id="Mobile_No" class="validate[required,custom[integer],maxSize[10],minSize[10]] mws-textinput" value="<% if (hmAc != null) {
                                                    out.print(hmAc.get("Contact_No"));
                                                }%>" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8">
                                        <label>Office No</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="Alternative No" name="Office_No" id="Office_No" class="validate[required,custom[integer],maxSize[11]] mws-textinput" value="<% if (hmAc != null) {
                                                    out.print(hmAc.get("phone_No"));
                                                }%>" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-2-8 omega">
                                        <label>Email Address</label>
                                        <div class="mws-form-item">
                                            <input type="text" name="Email" id="Email" class="validate[required,custom[email]] mws-textinput" value="<% if (hmAc != null) {
                                                    out.print(hmAc.get("Email_id"));
                                                }%>" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <fieldset>
                            <legend style="text-align: center">Other Information</legend>
                            <div class="mws-form-row">
                                <div class="mws-form-cols clearfix">
                                    <div class="mws-form-item large">
                                        <div class="mws-form-col-1-8 alpha">
                                            <label>Limit</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="Limit" id="Limit" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmAc != null) {
                                                        out.print(hmAc.get("LIMIT"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8">
                                            <label>Due Days</label>
                                            <div class="mws-form-item">
                                                <input type="text" style="text-align: right;" placeholder="0" name="Due_Days" id="Due_Days" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmAc != null) {
                                                        out.print(hmAc.get("DUE_DAYS"));
                                                    } else {
                                                        out.print("0");
                                                    }%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-col-2-8">
                                            <label>Bank Name</label>
                                            <div class="mws-form-item">
                                                <select name='Bank_Name' id='Bank_Name'>
                                                    <% List ltBank = (List) request.getAttribute("dataBank");
                                                        HashMap hmBank = null;
                                                        if (ltBank != null) {
                                                            for (int j = 0; j < ltBank.size(); j++) {
                                                                hmBank = (HashMap) ltBank.get(j);%>
                                                    <option value="<%out.print(hmBank.get("BANK_ID"));%>"><%out.print(hmBank.get("BANK_NAME"));%></option>
                                                    <% }
                                                        }%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="mws-form-col-2-8">
                                            <label>Bank Address</label>
                                            <div class="mws-form-item">
                                                <textarea id="Bank_Address" class="mws-textinput" name="Bank_Address"></textarea>
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8 omega">
                                            <div class="mws-form-item">
                                                <input type="button" name="Add_Bank" id="AddBank" style="margin-top: 50px;" class="mws-button orange" value="Add Bank"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <div class="mws-form-cols clearfix">
                                    <div class="mws-form-item large">
                                        <div align="right"  class="mws-form-col-4-8 alpha">
                                        </div>
                                        <div class="mws-form-col-4-8 omega">
                                            <!--- BANK DATA IN TABLE -->
                                            <fieldset>
                                                <legend style="text-align: center">Bank Information</legend>

                                                <table border="5">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 150px;">Bank Name</th>
                                                            <th style="width: 150px;">Bank Address</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="TblBank"></tbody>
                                                </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="mws-button-row">
                                <input type="submit" class="mws-button blue  mws-i-24 i-save large" name="action" value="Save" />
                                <!--input type="reset" value="Reset" class="mws-button green" /-->
                            </div>
                            </form>
                            </div>
                            </div>
                            <script type="text/javascript">
                            var i=1;
                            $("#AddBank").click(function(){
                                if($("#Bank_Address").val()!=""){
                                    $("#TblBank").append("<tr><td>"+$('#Bank_Name option:selected').text()+"<%out.print("<input type='hidden' name='mygrid' value='");%>"+$('#Bank_Name').val()+"<%out.print("'/>");%></td><td>"+$('#Bank_Address').val()+"<%out.print("<input type='hidden' name='mygrid' value='");%>"+$('#Bank_Address').val()+"<%out.print("'/>");%></td><td><img src='images/core/fancy_close.png' id='"+i+"' onClick='RemoveBank("+i+");'></td></tr>");
                                    i+=1;
                                }else{
                                      jQuery('#Bank_Address').validationEngine('showPrompt', 'please Enter Address of the bank', 'false');
                                }
                            });
                            function RemoveBank(i){
                                var li=$('#'+i).parent().parent();
                                li.remove();
                            }
                            function AddBank(){
                                <%
                                    List ltUBank = (List) request.getAttribute("dataUBank");
                                    HashMap hmUBank = null;
                                    if (ltUBank != null) {
                                        if (request.getParameter("id") != null) {
                                            for (int i = 0; i < ltUBank.size(); i++) {
                                                hmUBank = (HashMap) ltUBank.get(i);
                                                if (request.getParameter("id").toString().equals(hmUBank.get("Ac_id").toString())) {
                                %>
                                    $("#TblBank").append("<tr><td><% out.print(hmUBank.get("Bank_Name"));
                                        out.print("<input type='hidden' name='mygrid' value='" + hmUBank.get("Bank_id") + "'/>");%></td><td><% out.print(hmUBank.get("Bank_Address"));
                                            out.print("<input type='hidden' name='mygrid' value='" + hmUBank.get("Bank_Address") + "'/>");%></td><td><img src='images/core/fancy_close.png' id='"+i+"' onClick='RemoveBank("+i+");'></td></tr>");
                                                i++;
                                <%                        }
                                            }
                                        }
                                    }
                                %>
                                }
                            </script>

