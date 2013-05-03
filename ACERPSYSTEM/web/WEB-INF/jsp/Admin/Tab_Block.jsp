<script type="text/javascript" src="plugins/Hover/jquery.hovercard.js"></script>
<script type="text/javascript" src="plugins/Hover/notify.js"></script>

<% /* Display Success/error Message  */
    Integer status = Integer.parseInt(request.getParameter("flag"));
    if (status != 0) {
        if (status == 3) {
%>
<script>
    $(document).ready(function() {
        $.pnotify({
            pnotify_title: 'Success Notification',
            pnotify_text: 'User Successfully Block',
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
<%} else if (status == 4) {%>
<script>
    $(document).ready(function() {
        $.pnotify({
            pnotify_title: 'Success Notification',
            pnotify_text: 'User Successfully UnBlock',
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
<div id="Block" style="margin-top: 25px;">
    <div class="mws-panel grid_8">
        <div class="mws-panel-header">
            <span class="mws-i-24 i-table-1">Total Currency</span>
        </div>
        <div class="mws-panel-body">
            <table class="mws-datatable-fn mws-table">
                <thead>
                    <tr>
                        <th>Admin_Id</th>
                        <th>Start Date</th>
                        <th>days</th>
                        <th>Current Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%List ltAdmin = (List) request.getAttribute("dataAdmin");
                        HashMap hmAdmin = null;

                        if (ltAdmin != null) {
                            for (int i = 0; i < ltAdmin.size(); i++) {
                                hmAdmin = (HashMap) ltAdmin.get(i);
                    %>
                    <tr class="gradeX">
                        <td>             
                            <label id="<%= hmAdmin.get("USER_COUNT")%>" class="hc-name">
                                <%  out.print(hmAdmin.get("Admin_id"));%>
                            </label>
                        </td>

                <script type="text/javascript">
                    $(document).ready(function () {
           
                        var hoverHTMLDemoCallback = '<p>' +
                            '<%= hmAdmin.get("F_NAME") + " " + hmAdmin.get("L_NAME")%><p> ' +
                            '<p><label>Address:</label> <%= hmAdmin.get("R_ADDRESS") + " ," + hmAdmin.get("CI_NAME") + " ," + hmAdmin.get("S_NAME") + " ," + hmAdmin.get("C_NAME")%></p>' +
                            '<p><label>Sex:</label><%= hmAdmin.get("GENDER")%></p>'+
                            '<p><label>Contact NO:</label><%= hmAdmin.get("CONTACT_NO")%></p>'+
                            '<p><label>Email:</label><%= hmAdmin.get("EMAIL_ID")%></p>';

                        $("#<%= hmAdmin.get("USER_COUNT")%>").hovercard({
                            detailsHTML: hoverHTMLDemoCallback,
                            width: 500,
                            height:200,
                            cardImgSrc: 'images/profile/<%= hmAdmin.get("USER_COUNT")%><%= hmAdmin.get("IMAGE")%>'
                        });

                    });
                </script>


                <td><%  out.print(hmAdmin.get("START_DATE").toString().substring(0, 10));%></td>
                <td><%  out.print(hmAdmin.get("DAYS"));%></td>
                <td > <ul style="margin-left: 50px;" id="icons-16" class="clearfix">
                        <%if (hmAdmin.get("Block_Unblock").toString().equals("0")) {%>
                        <a href="?menu=Block&action=Block&flag=1&id=<%out.print(hmAdmin.get("User_Count"));%>"><li  class="mws-ic ic-status-online" title="UnBlock"></li></a>
                        <%} else {%>
                        <a href="?menu=Block&action=Block&flag=2&id=<%out.print(hmAdmin.get("User_Count"));%>"><li class="mws-ic ic-status-offline" title="Block"></li></a>
                        <%}%>

                        <a href="?menu=Block&action=Drop&flag=1&u_id=<%out.print(hmAdmin.get("Admin_id"));%>"><li  class="mws-ic ic-database-delete" title="Drop User"></li></a>
                    </ul>
                </td>
                </tr>
                <%}
                        }%>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="hc-details" style="width: 350px; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); background-position: initial initial; background-repeat: initial initial; "></div>