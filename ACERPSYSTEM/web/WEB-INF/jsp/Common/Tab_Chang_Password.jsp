<% Integer status = Integer.parseInt(request.getParameter("flag"));
            if (status != 0) {
                if (status == 1) {
%>
<script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'PAssword Changed',
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
        <span class="mws-i-24 i-check">Chang Password</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form"  method="get" onsubmit="return chk(this)" action="Chang_Password.htm" >
            <input name="menu" value="Chang_Password" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <div id="mws-validate-error" class="mws-form-message error" style="display:none;"></div>
            <div class="mws-form-inline">
                <div class="mws-form-row">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-2-8"></div>
                            <div class="mws-form-col-2-8 alpha">
                                <label>Current Password</label>
                                <div class="mws-form-item">
                                    <input type="password" name="Current_pwd" id="Current_pwd" class="validate[required] mws-textinput"/>
                                     <div style="float: right" id="error"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr/>
                <div class="mws-form-row">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">

                            <div class="mws-form-col-2-8"></div>

                            <div class="mws-form-col-2-8 alpha">
                                <label>New Password</label>
                                <div class="mws-form-item">
                                    <input type="password" name="New_Password" id="New_Password" class="validate[required] mws-textinput" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mws-form-row">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-2-8"></div>
                            <div class="mws-form-col-2-8 alpha">
                                <label>Conform Password</label>
                                <div class="mws-form-item">
                                    <input type="password" name="Conform_Password" id="Conform_Password" class="validate[required] mws-textinput" />
                                           <div style="float: right" id="error2"></div>
                          </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mws-button-row">
                <input type="submit" class="mws-button save green" name="action" value="Save" />
                <!--input type="reset" value="Reset" class="mws-button green" /-->
            </div>
        </form>
    </div>
</div>
            <script>
                <% //HttpSession session = req.getSession();%>
                $("#Current_pwd").change(function(){
                    if($("#Current_pwd").val()!="<%=session.getAttribute("Password")%>"){
                        $("#error").text("Password Is Wrong")
                    }else{
                        $("#error").text("Password Correnct")
                    }
                });
                function chk(){
                    if($("#Current_pwd").val()!="<%=session.getAttribute("Password")%>"){
                        $("#error").text("Password Is Wrong")
                        return false;
                    }else{
                        $("#error").text("Password Correnct")
                        if($("#New_Password").val()!=$("#Conform_Password").val()){
                               $("#error2").text("Password missmatch")
                            return false;
                        }
                        return true;
                    }
                }
            </script>
