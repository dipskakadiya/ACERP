<hr/>
<%Integer status = Integer.parseInt(request.getParameter("flag"));
    if (status != 0) {
        if (status == 1) {
%>
    <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'User Profile Updated',
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
<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Update User profile</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" method="post" enctype="multipart/form-data" class="mws-form" action="User_Detail.htm">
            <input name="menu" value="Add_New_User" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <%List ltUP = (List) request.getAttribute("dataUP");
                HashMap hmUP = null;
                if (ltUP != null) {
                    hmUP = (HashMap) ltUP.get(0);

                } else {
                    out.print("null");
                }
            %>
            <input name="User_Count" value="<% if (hmUP != null) {
                    out.print(hmUP.get("USER_COUNT"));
                }%>" type="hidden"/>
            <fieldset>
                <legend style="text-align: center">User Information</legend>
                <div class="mws-form-inline">
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-4-8 alpha">
                                    <div class="mws-form-row">
                                        <div class="mws-form-col-1-8"></div>
                                        <div class="mws-form-col-3-8 alpha">
                                            <label>First Name</label>
                                            <div class="mws-form-item">
                                                <input type="text" name="F_Name" id="F_Name" class="validate[required] mws-textinput" value="<% if (hmUP != null) {
                                                        out.print(hmUP.get("F_Name"));
                                                    }%>">
                                            </div>
                                        </div>
                                        <div class="mws-form-col-3-8 omega  ">
                                            <label>Last Name</label>
                                            <div class="mws-form-item">
                                                <input type="text" name="L_Name" id="L_Name" class="validate[required] mws-textinput" value="<% if (hmUP != null) {
                                                        out.print(hmUP.get("L_Name"));
                                                    }%>" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mws-form-row">
                                        <div class="mws-form-col-1-8"></div>
                                        <div class="mws-form-col-3-8 alpha" >
                                            <label>Gender</label>
                                            <ul class="mws-form-list inline">
                                                <li><input type="radio" id="Male" name="Gender" value="Male" <% if (hmUP != null) {
                                                        if (hmUP.get("GENDER").toString().equals("Male")) {
                                                            out.print("checked");
                                                        }
                                                    }%> /> <label>Male</label></li>
                                                <li><input type="radio" id="Female" name="Gender" value="Fmale" <% if (hmUP != null) {
                                                        if (hmUP.get("GENDER").toString().equals("Fmale")) {
                                                            out.print("checked");
                                                        }
                                                    }%> /> <label>Female</label></li>
                                            </ul>
                                        </div>
                                        <div class="mws-form-col-2-8 ">
                                            <label>Birth Date</label>
                                            <div class="mws-form-item">
                                                <input type="text" placeholder="YYYY-MM-DD" name="DOB" id="DOB" class="validate[required,custom[date]] mws-textinput" value="<% if (hmUP != null) {
                                                        out.print(hmUP.get("DOB").toString().substring(0, 10));
                                                    }%>"/>
                                            </div>
                                        </div>
                                        <div class="mws-form-col-2-8 omega">
                                            <label>Join Date</label>
                                            <div class="mws-form-item">
                                                <input type="text" placeholder="YYYY-MM-DD" name="Join_Date" id="Join_Date" class="validate[required,custom[date]] mws-textinput" readonly value="<% if (hmUP != null) {
                                                        out.print(hmUP.get("JOIN_DATE").toString().substring(0, 10));
                                                    }%>" />
                                            </div>
                                        </div>
                                    </div>
                                    <fieldset>
                                        <legend style="text-align: center">Address Information</legend>
                                        <div class="mws-form-row">
                                            <div class="mws-form-col-1-8"></div>
                                            <div class="mws-form-col-4-8 alpha">
                                                <label>Home Address</label>
                                                <div class="mws-form-item">
                                                    <input type="text" name="R_Address" id="R_Address"  class="validate[required] mws-textinput" value="<% if (hmUP != null) {
                                                            out.print(hmUP.get("R_ADDRESS"));
                                                        }%>">
                                                </div>
                                            </div>
                                            <div class="mws-form-col-2-8 alpha">
                                                <label>Pin Code</label>
                                                <div class="mws-form-item">
                                                    <input type="text" placeholder="Pincode" name="Pincode" id="Pincode" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmUP != null) {
                                                            out.print(hmUP.get("PINCODE"));
                                                        }%>">
                                                </div>
                                            </div>
                                        </div>
                                        <script type="text/javascript">
                                            $(document).ready(function(){
                                                $.ajax({url:"Ajex.htm?action=show&C_id=<%if (hmUP != null) {
                                                        out.print(hmUP.get("C_name"));
                                                    }%>&S_id=<%if (hmUP != null) {
                                                            out.print(hmUP.get("S_name"));
                                                        }%>&Ci_id=<%if (hmUP != null) {
                                                                out.print(hmUP.get("Ci_name"));
                                                            }%>", success:function(result){
                                                                        $("#Contry").html(result);
                                                                    }});
                                                            });
                                        </script>
                                        <div class="mws-form-row">
                                            <div class="mws-form-col-1-8"></div>
                                            <div class="mws-form-col-2-8 alpha">
                                                <label>Country</label>
                                                <div id="Contry" class="mws-form-item">
                                                </div>
                                            </div>
                                            <div class="mws-form-col-2-8">
                                                <label>State</label>
                                                <div id="State" class="mws-form-item">
                                                </div>
                                            </div>
                                            <div class="mws-form-col-2-8 omega">
                                                <label>City</label>
                                                <div id="City" class="mws-form-item">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mws-form-row">
                                            <div class="mws-form-col-1-8"></div>
                                            <div class="mws-form-col-5-8 alpha">
                                                <label>Email Address</label>
                                                <div class="mws-form-item">
                                                    <input type="text" name="Email" id="Email" class="validate[required,custom[email]] mws-textinput" value="<% if (hmUP != null) {
                                                            out.print(hmUP.get("Email_id"));
                                                        }%>">
                                                </div>
                                            </div>
                                            <div class="mws-form-col-2-8 omega">
                                                <label>Designation</label>
                                                <div class="mws-form-item">
                                                    <input type="text" name="Desig" id="Desig" class="validate[required] mws-textinput" value="<% if (hmUP != null) {
                                                            out.print(hmUP.get("Desig"));
                                                        }%>">
                                                </div>
                                            </div>
                                        </div>
                                </div>

                                <div class="mws-form-col-4-8 omega">
                                    <fieldset>
                                        <legend style="text-align: center">User Profile Image</legend>
                                        <div class="mws-form-row" align="center">
                                            <label></label>
                                            <div id="">
                                                <img src="images/profile/<% if (hmUP != null) {
                                                        out.print(hmUP.get("user_count") + "" + hmUP.get("image"));
                                                    }%>" alt="User Photo" height="300" width="300" />
                                            </div>
                                        </div>
                                        <div class="mws-form-row" align="center">
                                            <label></label>
                                        </div>
                                        <div class="mws-form-row" align="center">
                                            <input type="hidden" name="Imagealt" value="<% if (hmUP != null) {
                                                    out.print(hmUP.get("image"));
                                                } else {
                                                    out.print("profile.png");
                                                }%>"/>                                      
                                            <input type="file" name="Image"/>
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
