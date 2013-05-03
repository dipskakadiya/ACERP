<hr/>
<%Integer status = Integer.parseInt(request.getParameter("flag"));
            if (status != 0) {
                if (status == 2) {
%>
  <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'Add Bank Succesfully',
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
<div  class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Add Bank</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="post" action="Setting.htm">
            <input name="menu" value="Account" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <%  List ltBank = (List) request.getAttribute("dataBank");
                            HashMap hmBank = null;
                            if (ltBank != null) {
                                if (request.getParameter("id") != null) {
                                    for (int i = 0; i < ltBank.size(); i++) {
                                        hmBank = (HashMap) ltBank.get(i);
                                        if (request.getParameter("id").toString().equals(hmBank.get("Bank_Id").toString())) {
                                            break;
                                        } else {
                                            hmBank = null;
                                        }
                                    }
                                }
                            }
                %>
            <fieldset>
                <legend style="text-align: center">Bank Information</legend>
                <div class="mws-form-inline">
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-2-8">
                                    <label>Bank Name</label>
                                    <div class="mws-form-item">
                                        <input type="text" name="Add_Bank" id="Add_Bank" class="validate[required] mws-textinput" value="<% if (hmBank != null) {
                                                        out.print(hmBank.get("Bank_Name"));
                                                    }%>"/>
                                    </div>
                                     <% if (hmBank != null) {%>
                                            <input type="hidden" name="Bank_id" value="<%
                                                 out.print(hmBank.get("Bank_Id"));
                                                   %> "/>
                                    <% }%>
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








    <div class="mws-panel grid_4">
        <div class="mws-panel-header">
            <span class="mws-i-24 i-table-1">View All Added Bank</span>
        </div>
        <div class="mws-panel-body">
            <table class="mws-datatable-fn mws-table">
                <thead>
                    <tr>
                        <th>Bank Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% List ltBk = (List) request.getAttribute("dataBank");
                                HashMap hmBk = null;
                                if (ltBk != null) {
                                    for (int i = 0; i < ltBk.size(); i++) {
                                        hmBk = (HashMap) ltBk.get(i);
                    %>
                    <tr class="gradeX">
                        <td style="text-align: center"><a style="color: black;" href="?menu=Setting&action=Add_Bank&flag=1&id=<%out.print(hmBk.get("Bank_Id"));%>"><%  out.print(hmBk.get("Bank_Name"));%></a></td>
                        <td>
                            <a href="?menu=Setting&action=Delete&flag=0&id=<%out.print(hmBk.get("Bank_Id"));%>"><img src="images/core/ico_delete_16.png" alt="Delete"/></a>
                        </td>
                    </tr>
                    <%}
                                }%>
                </tbody>
            </table>
        </div>
    </div>
