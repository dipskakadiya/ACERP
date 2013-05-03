<hr/>
<%Integer status = Integer.parseInt(request.getParameter("flag"));
            if (status != 0) {
                if (status == 2) {
%>
  <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'Add Tax Succesfuly',
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
        <span class="mws-i-24 i-check">Add Tax</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="post" action="Setting.htm">
            <input name="menu" value="Account" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
             <%  List ltTax = (List) request.getAttribute("dataTax");
                HashMap hmTax = null;
                if (ltTax != null) {
                    if (request.getParameter("id") != null) {
                        for (int i = 0; i < ltTax.size(); i++) {
                            hmTax = (HashMap) ltTax.get(i);
                            if (request.getParameter("id").toString().equals(hmTax.get("Tax_Id").toString())) {
                                break;
                            } else {
                                hmTax = null;
                            }
                        }
                    }
                }
            %>
            <fieldset>
                <legend style="text-align: center">Tax Information</legend>
                <div class="mws-form-inline">
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-2-8">
                                    <label>Tax Name</label>
                                    <div class="mws-form-item">
                                        <input type="text" name="Add_Tax" id="Add_Tax" class="validate[required] mws-textinput" value="<% if (hmTax != null) {
                                                out.print(hmTax.get("Tax_Name"));
                                            }%>"/>
                                    </div>
                                    <% if (hmTax != null) {%>
                                            <input type="hidden" name="Tax_id" id="Tax_id" class="mws-textinput" value="<%
                                                out.print(hmTax.get("Tax_Id"));
                                                   %> "/>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mws-button-row">
                    <input type="submit" class="mws-button blue  mws-i-24 i-save large" name="action" value="save" />
                    <!--input type="reset" value="Reset" class="mws-button green" /-->
                </div>
        </form>
    </div>
</div>

<div class="mws-panel grid_4">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-table-1">View All Added Tax</span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead>
                <tr>
                    <th>Tax Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% List ltTx = (List) request.getAttribute("dataTax");
                    HashMap hmTx = null;
                    if (ltTx != null) {
                        for (int i = 0; i < ltTx.size(); i++) {
                            hmTx = (HashMap) ltTx.get(i);
                %>
                <tr class="gradeX">
                    <td style="text-align: center;"><a style="color: black;" href="?menu=Setting&action=Add_Tax&flag=1&id=<%out.print(hmTx.get("Tax_Id"));%>"><%  out.print(hmTx.get("Tax_Name"));%></a></td>
                    <td>
                        <a href="?menu=Setting&action=delete&flag=0&id=<%out.print(hmTx.get("Tax_Id"));%>"><img src="images/core/ico_delete_16.png" alt="Delete"/></a>
                    </td>
                </tr>
                <%}
                    }%>
            </tbody>
        </table>
    </div>
</div>