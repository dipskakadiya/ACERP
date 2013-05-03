<% /* Display Success/error Message  */
            Integer status = Integer.parseInt(request.getParameter("flag"));
            if (status != 0) {
                if (status == 2) {
%>
<script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'Send Message Succesfuly',
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

<hr/>
<div class="mws-panel grid_8">

    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Send Mail</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="post" action="Send_Mail.htm">
            <input name="menu" value="Send_Mail"  type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <%
                        List ltReq = (List) request.getAttribute("dataReq");
                        HashMap hmReq = null;
                        if (ltReq != null) {
                            if (request.getParameter("id") != null) {
                                for (int i = 0; i < ltReq.size(); i++) {
                                    hmReq = (HashMap) ltReq.get(i);
                                    if (request.getParameter("id").toString().equals(hmReq.get("Req_Id").toString())) {
                                        break;
                                    }
                                }
                            }
                        }
            %>
            <div id="mws-validate-error" class="mws-form-message error" style="display:none;"></div>
            <div class="mws-form-inline">
                <div class="mws-form-row" style="margin-left: 25px;">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-1-8 alpha"></div>
                            <div class="mws-form-col-7-8 omega">
                                <label><b>To</b></label>
                                <div class="mws-form-item medium">
                                    <select  multiple="multiple" size="5" class="validate[required,] chzn-select" id="User_Name" name="User_Name">
                                        <%if (request.getParameter("id") != null) {%>
                                        <option selected value="<% if (hmReq != null) {
                                                out.print(hmReq.get("User_id"));
                                            }%>">
                                            <% if (hmReq != null) {
                                                    out.print(hmReq.get("User_id"));
                                                }%>
                                        </option>
                                        <%} else {
                                            List ltMR = (List) request.getAttribute("dataMR");
                                            HashMap hmMR = null;
                                            if (ltMR != null) {
                                                for (int i = 0; i < ltMR.size(); i++) {
                                                    hmMR = (HashMap) ltMR.get(i);%>
                                        <option style="color: black;" value="<%out.print(hmMR.get("user"));%>"><%out.print(hmMR.get("user"));%></option>
                                        <%}
                                            }
                                            ltMR = (List) request.getAttribute("dataAdmin");
                                            hmMR = null;
                                            if (ltMR != null) {
                                                hmMR = (HashMap) ltMR.get(0);%>
                                        <option style="color: black;" value="<%out.print(hmMR.get("ADMIN_ID"));%>"><%out.print(hmMR.get("ADMIN_ID"));%></option>
                                        <%}
                                                    }%>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mws-form-row" style="margin-left: 25px;">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-1-8 alpha"></div>
                            <div class="mws-form-col-7-8 omega">
                                <label><b>Subject</b></label>
                                <div class="mws-form-item medium">
                                       <input type="text" name="Subject" id="Subject"  <%if (request.getParameter("id") != null) {%>value="Response: <%if (hmReq != null) {
                                                                out.print(hmReq.get("Question"));

                                                            }%>"<%}%> class="validate[required] mws-textinput"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mws-form-row" style="margin-left: 25px;">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-1-8 alpha"></div>
                            <div class="mws-form-col-7-8 omega">
                                <label><b>Message</b></label>
                                <div class="mws-form-item medium">
                                    <textarea name="Message" id="Message" class="validate[required] mws-textinput" style="height: 200px;"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><hr/>
            <div class="mws-button-row">
                <input type="submit" class="mws-button save green" name="action" value="Send" />
                <!--input type="reset" value="Reset" class="mws-button gray" /-->
            </div>
        </form>
    </div>
</div>
