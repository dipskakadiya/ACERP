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
                pnotify_text: 'Item Category Move To Trash Successfully',
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
    <%} else if (status == 3) {%>
    <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'Category Updated Successfully',
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
<div class="mws-panel grid_4">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-table-1">View All Item Category</span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead>
                <tr>
                    <th>Item Category Name</th>
                    <%
                        if (lper != null) {
                            hper = (HashMap) lper.get(1);
                        }
                        UST = session.getAttribute("User_Type");
                        if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_Delete").toString().equals("1")))) {
                    %>
                    <th>Action</th>
                    <%}%>
                </tr>
            </thead>
            <tbody>
                <%List ltICtg = (List) request.getAttribute("dataCtg");
                    HashMap hmICtg = null;
                    if (ltICtg != null) {
                        for (int i = 0; i < ltICtg.size(); i++) {
                            hmICtg = (HashMap) ltICtg.get(i);
                %>
                <tr class="gradeX">
                    <td style="text-align: center;">
                        <%
                            if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1")))) {
                        %>
                        <a style="color: black" href="?menu=Item&action=show_Cat&flag=1&id=<%out.print(hmICtg.get("Ctg_id"));%>"><%  out.print(hmICtg.get("Ctg_Name"));%></a>
                        <%} else {%>
                        <%  out.print(hmICtg.get("Ctg_Name"));%>
                        <%}%>
                    </td>
                    <% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_Delete").toString().equals("1")))) {%>
                    <td>  
                        <a href="?menu=Item&action=delete_Ctg&flag=0&id=<%out.print(hmICtg.get("Ctg_id"));%>"><img src="images/core/ico_delete_16.png" alt="Delete"/></a>
                    </td>
                    <%}%>
                </tr>
                <%}
                    }%>
            </tbody>
        </table>
    </div>
</div>
