<hr/>
<%Integer status = Integer.parseInt(request.getParameter("flag"));
            if (status != 0) {
                if (status == 1) {
%>
  <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'User Company detail Updated',
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
<div id="Company Info">
    <div class="mws-panel grid_8">
        <div class="mws-panel-header">
            <span class="mws-i-24 i-check">Company Information</span>
        </div>
        <div class="mws-panel-body">
            <form id="formID" id="mws-validate" class="mws-form" action="Company_Detail.htm">
                <input name="menu" value="Company_Detail" type="hidden"/>
                <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
                <% List ltCP = (List) request.getAttribute("DataCP");
                            HashMap hmCP = null;
                            if (ltCP != null) {
                                hmCP = (HashMap) ltCP.get(0);
                            }
                %>
                <input name="Com_id" value="<% if (hmCP != null) {
                                       out.print(hmCP.get("Com_id"));
                                   }%>" type="hidden"/>
                 <fieldset>
                <legend style="text-align: center">Company Information</legend>
                <div class="mws-form-inline">
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-1-8"></div>
                                <div class="mws-form-col-3-8 alpha">
                                    <label>Your Company Name</label>
                                    <div class="mws-form-item medium">
                                        <input type="text" name="Com_Name" id="Com_Name" class="validate[required] mws-textinput"  value="<% if (hmCP != null) {
                                                        out.print(hmCP.get("Com_name"));
                                                    }%>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-1-8"></div>
                                <div class="mws-form-col-3-8 alpha">
                                    <label>Your Company Address</label>
                                    <div class="mws-form-item">
                                        <input type="text" name="C_Address" id="C_Address" class="validate[required] mws-textinput" value="<% if (hmCP != null) {
                                                        out.print(hmCP.get("C_address"));
                                                    }%>"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label>Area</label>
                                    <div class="mws-form-item">
                                        <input type="text" name="Area" id="Area" class="validate[required] mws-textinput" value="<% if (hmCP != null) {
                                                        out.print(hmCP.get("Area"));
                                                    }%>"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-1-8 omega">
                                    <label>Pincode</label>
                                    <div class="mws-form-item">
                                        <input type="text" placeholder="Pincode" name="Pincode" id="Pincode" class="validate[required,custom[integer]] mws-textinput required" value="<% if (hmCP != null) {
                                                        out.print(hmCP.get("pincode"));
                                                    }%>"/>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function(){
                            $.ajax({url:"Ajex.htm?action=show&C_id=<%if (hmCP != null) {
                                            out.print(hmCP.get("C_name"));
                                        }%>&S_id=<%if (hmCP != null) {
                                                        out.print(hmCP.get("S_name"));
                                                    }%>&Ci_id=<%if (hmCP != null) {
                                                                    out.print(hmCP.get("Ci_name"));
                                                                }%>", success:function(result){
                                                                            $("#Contry").html(result);
                                                                        }});
                                                                });
                    </script>
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                 <fieldset>
                <legend style="text-align: center">Company Address Information</legend>
                                <div class="mws-form-col-1-8"></div>
                                <div class="mws-form-col-1-8 alpha">
                                    <label>Country</label>
                                    <div id="Contry" class="mws-form-item">
                                    </div>
                                </div>
                                <div class="mws-form-col-1-8">
                                    <label>State</label>
                                    <div id="State" class="mws-form-item">
                                    </div>
                                </div>
                                <div class="mws-form-col-1-8 omega">
                                    <label>City</label>
                                    <div id="City" class="mws-form-item">
                                    </div>
                                </div>
                                <div class="mws-form-col-3-8">
                                    <label>Company Email Address</label>
                                    <div class="mws-form-item medium">
                                        <input type="text" name="Com_Email" id="Com_Email" class="validate[required,custom[email]] mws-textinput" value="<% if (hmCP != null) {
                                                        out.print(hmCP.get("email_id"));
                                                    }%>"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-1-8"></div>
                                <div class="mws-form-col-1-8 alpha">
                                    <label>Mobile Number</label>
                                    <div class="mws-form-item">
                                        <input type="text" style="text-align: right;" placeholder="Contect No" name="Mobile_No" id="Mobile_No" class="validate[required,custom[integer],maxSize[10],minSize[10]] mws-textinput" value="<% if (hmCP != null) {
                                                        out.print(hmCP.get("Contact_no"));
                                                    }%>"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-1-8">
                                    <label>Phone No</label>
                                    <div class="mws-form-item">
                                        <input type="text" style="text-align: right;" placeholder="Alternative No"  name="Phone_No" id="Phone_No" class="validate[required,custom[integer],maxSize[11]] mws-textinput" value="<% if (hmCP != null) {
                                                        out.print(hmCP.get("phone_no"));
                                                    }%>"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-1-8">
                                    <label>Year Start Date</label>
                                    <div class="mws-form-item ">
                                        <input type="text" placeholder="YYYY-MM-DD" name="Year_Start_Date" id="Year_Start_Date" class="validate[required,custom[date]] mws-textinput" value="<% if (hmCP != null) {
                                                        out.print(hmCP.get("Year_Start_Date").toString().substring(0, 10));
                                                    }%>" />                                    </div>
                                </div>
                                <div class="mws-form-col-1-8 omega">
                                    <label>Year End Date</label>
                                    <div class="mws-form-item">
                                        <input type="text" placeholder="YYYY-MM-DD" name="Year_End_Date" id="Year_End_Date" class="validate[required,custom[date]]  mws-textinput" value="<% if (hmCP != null) {
                                                        out.print(hmCP.get("Year_End_Date").toString().substring(0, 10));
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
</div>
