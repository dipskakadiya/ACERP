<hr/>
<%@page import="java.util.ArrayList"%>
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
                pnotify_text: 'User Create Successfully',
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
                pnotify_text: 'User Permission Updated Successfully',
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
        <span class="mws-i-24 i-check">Add User</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="post" action="User.htm">
            <input name="menu" value="User" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <% List ltUser = (List) request.getAttribute("dataUser");
                HashMap hmUser = null;
                ArrayList q = new ArrayList();
                if (ltUser != null) {
                    if (request.getParameter("id") != null) {
                        for (int i = 0; i < ltUser.size(); i++) {
                            hmUser = (HashMap) ltUser.get(i);
                            if (request.getParameter("id").toString().equals(hmUser.get("User_count").toString())) {
            %>
            <input name="User_count" value="<% out.print(request.getParameter("id"));%>" type="hidden"/>
            <%
                                break;
                            }
                        }
                    }
                }
            %>
            <fieldset>
                <legend style="text-align: center">User Information</legend>
                <div class="mws-form-inline">

                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-2-8 alpha">
                                    <label>User Name</label>
                                    <div class="mws-form-item">
                                        <input type="text" name="User_Name" id="User_Name" class="validate[required] mws-textinput" <% if (hmUser != null) {
                                                out.print("value='" + hmUser.get("User_id") + "' readonly");
                                            }%>  />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-2-8 alpha">
                                    <label>Password</label>
                                    <div class="mws-form-item">
                                        <input type="text" name="Password" id="Password" class="validate[required] mws-textinput" <% if (hmUser != null) {
                                                out.print("value='" + hmUser.get("Password") + "' readonly");
                                            }%> />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% List ltper = (List) request.getAttribute("dataper");
                        HashMap hmper = null;
                    %>

                    <fieldset>
                        <legend style="text-align: center">Permission Information</legend>
                        <div class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <div class="mws-form-row">
                                        <%
                                            if (ltper != null) {
                                                hmper = (HashMap) ltper.get(0);
                                            }
                                        %>  
                                        <div id="PAccount" class="mws-form-col-3-8">
                                            <label style="text-align: center;">Permission For Account Module</label>
                                            <div class="mws-form-item large">
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Add" name="Add" value="1" onchange="getper('PAccount','Add')" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") ? "checked" : "") : ""%> /><label>Add</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Edit" name="Edit" value="2" onchange="getper('PAccount','Edit')" <%= hmper != null ? (hmper.get("P_UPDATE").toString().equals("1") ? "checked" : "") : ""%>/><label>Edit</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Delete" name="Delete" value="4" onchange="getper('PAccount','Delete')" <%= hmper != null ? (hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>Delete</label>
                                                    <input type="hidden" id="per" name="per" value="<%=hmper != null ? hmper.get("TOTAL") : "0"%>"/>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="View" name="View" value="8" onchange="getper('PAccount','View')" <%= hmper != null ? (hmper.get("P_VIEW").toString().equals("1") ? "checked" : "") : ""%>/><label>View</label>
                                                </div>
                                                <div class="mws-form-col-2-8"></div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Trash" name="Trash" value="16" onchange="getper('PAccount','Trash')" <%= hmper != null ? (hmper.get("P_TRASH").toString().equals("1") ? "checked" : "") : ""%>/><label>Trash</label>
                                                </div>
                                                <div class="mws-form-col-2-8">
                                                    <input type="checkbox" name="All" id="All" onchange="AllChk('PAccount','All')" value="31" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") && hmper.get("P_UPDATE").toString().equals("1") && hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>All</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8"></div>
                                        <%
                                            if (ltper != null) {
                                                hmper = (HashMap) ltper.get(1);
                                            }
                                        %>
                                        <div id="PItem" class="mws-form-col-3-8">
                                            <label style="text-align: center;">Permission For Item Module</label>
                                            <div class="mws-form-item large">
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Add" name="Add" value="1" onchange="getper('PItem','Add')" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") ? "checked" : "") : ""%>/><label>Add</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Edit" name="Edit" value="2" onchange="getper('PItem','Edit')" <%= hmper != null ? (hmper.get("P_UPDATE").toString().equals("1") ? "checked" : "") : ""%>/><label>Edit</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Delete" name="Delete" value="4" onchange="getper('PItem','Delete')" <%= hmper != null ? (hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>Delete</label>
                                                    <input type="hidden" id="per" name="per" value="<%=hmper != null ? hmper.get("TOTAL") : "0"%>"/>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="View" name="View" value="8" onchange="getper('PItem','View')" <%= hmper != null ? (hmper.get("P_VIEW").toString().equals("1") ? "checked" : "") : ""%>/><label>View</label>
                                                </div>
                                                <div class="mws-form-col-2-8"></div>            
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Trash" name="Trash" value="16" onchange="getper('PItem','Trash')" <%= hmper != null ? (hmper.get("P_TRASH").toString().equals("1") ? "checked" : "") : ""%>/><label>Trash</label>
                                                </div>
                                                <div class="mws-form-col-2-8">
                                                    <input type="checkbox" name="All" id="All" onchange="AllChk('PItem','All')" value="31" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") && hmper.get("P_UPDATE").toString().equals("1") && hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>All</label>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="border-top: Solid 1px #B5D56D;"></hr>
                                        <div class="mws-form-col-2-8"></div>
                                        <%
                                            if (ltper != null) {
                                                hmper = (HashMap) ltper.get(2);
                                            }
                                        %>
                                        <div id="PTrade" class="mws-form-col-3-8">
                                            <label style="text-align: center;">Permission For Trade Module</label>
                                            <div class="mws-form-item large">
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Add" name="Add" value="1" onchange="getper('PTrade','Add')" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") ? "checked" : "") : ""%>/><label>Add</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Edit" name="Edit" value="2" onchange="getper('PTrade','Edit')" <%= hmper != null ? (hmper.get("P_UPDATE").toString().equals("1") ? "checked" : "") : ""%>/><label>Edit</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Delete" name="Delete" value="4" onchange="getper('PTrade','Delete')" <%= hmper != null ? (hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>Delete</label>
                                                    <input type="hidden" id="per" name="per" value="<%=hmper != null ? hmper.get("TOTAL") : "0"%>"/>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="View" name="View" value="8" onchange="getper('PTrade','View')" <%= hmper != null ? (hmper.get("P_VIEW").toString().equals("1") ? "checked" : "") : ""%>/><label>View</label>
                                                </div>
                                                <div class="mws-form-col-2-8"></div>            
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Trash" name="Trash" value="16" onchange="getper('PTrade','Trash')" <%= hmper != null ? (hmper.get("P_TRASH").toString().equals("1") ? "checked" : "") : ""%>/><label>Trash</label>
                                                </div>
                                                <div class="mws-form-col-2-8">
                                                    <input type="checkbox" name="All" id="All" onchange="AllChk('PTrade','All')" value="31" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") && hmper.get("P_UPDATE").toString().equals("1") && hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>All</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8"></div>
                                        <%
                                            if (ltper != null) {
                                                hmper = (HashMap) ltper.get(3);
                                            }
                                        %>
                                        <div id="PBTrade" class="mws-form-col-3-8">
                                            <label style="text-align: center;">Permission For Bank Trade Module</label>
                                            <div class="mws-form-item large">
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Add" name="Add" value="1" onchange="getper('PBTrade','Add')" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") ? "checked" : "") : ""%>/><label>Add</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Edit" name="Edit" value="2" onchange="getper('PBTrade','Edit')" <%= hmper != null ? (hmper.get("P_UPDATE").toString().equals("1") ? "checked" : "") : ""%>/><label>Edit</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Delete" name="Delete" value="4" onchange="getper('PBTrade','Delete')" <%= hmper != null ? (hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>Delete</label>
                                                    <input type="hidden" id="per" name="per" value="<%=hmper != null ? hmper.get("TOTAL") : "0"%>"/>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="View" name="View" value="8" onchange="getper('PBTrade','View')" <%= hmper != null ? (hmper.get("P_VIEW").toString().equals("1") ? "checked" : "") : ""%>/><label>View</label>
                                                </div>
                                                <div class="mws-form-col-2-8"></div>            
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Trash" name="Trash" value="16" onchange="getper('PBTrade','Trash')" <%= hmper != null ? (hmper.get("P_TRASH").toString().equals("1") ? "checked" : "") : ""%>/><label>Trash</label>
                                                </div>
                                                <div class="mws-form-col-2-8">
                                                    <input type="checkbox" name="All" id="All" onchange="AllChk('PBTrade','All')" value="31" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") && hmper.get("P_UPDATE").toString().equals("1") && hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>All</label>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="border-top: Solid 1px #B5D56D;"></hr>
                                        <%
                                            if (ltper != null) {
                                                hmper = (HashMap) ltper.get(4);
                                            }
                                        %>
                                        <div id="PCTrade" class="mws-form-col-3-8 alpha">
                                            <label style="text-align: center;">Permission For Cash Trade Module</label>
                                            <div class="mws-form-item large">
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Add" name="Add" value="1" onchange="getper('PCTrade','Add')" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") ? "checked" : "") : ""%>/><label>Add</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Edit" name="Edit" value="2" onchange="getper('PCTrade','Edit')" <%= hmper != null ? (hmper.get("P_UPDATE").toString().equals("1") ? "checked" : "") : ""%>/><label>Edit</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Delete" name="Delete" value="4" onchange="getper('PCTrade','Delete')" <%= hmper != null ? (hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>Delete</label>
                                                    <input type="hidden" id="per" name="per" value="<%=hmper != null ? hmper.get("TOTAL") : "0"%>"/>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="View" name="View" value="8" onchange="getper('PCTrade','View')" <%= hmper != null ? (hmper.get("P_VIEW").toString().equals("1") ? "checked" : "") : ""%>/><label>View</label>
                                                </div>
                                                <div class="mws-form-col-2-8"></div>            
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Trash" name="Trash" value="16" onchange="getper('PCTrade','Trash')" <%= hmper != null ? (hmper.get("P_TRASH").toString().equals("1") ? "checked" : "") : ""%>/><label>Trash</label>
                                                </div>
                                                <div class="mws-form-col-2-8">
                                                    <input type="checkbox" name="All" id="All" onchange="AllChk('PCTrade','All')" value="31" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") && hmper.get("P_UPDATE").toString().equals("1") && hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>All</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8"></div>
                                        <%
                                            if (ltper != null) {
                                                hmper = (HashMap) ltper.get(5);
                                            }
                                        %>
                                        <div id="PJv" class="mws-form-col-3-8 alpha">
                                            <label style="text-align: center;">Permission For JvEntry Module</label>
                                            <div class="mws-form-item large">
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Add" name="Add" value="1" onchange="getper('PJv','Add')" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") ? "checked" : "") : ""%>/><label>Add</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Edit" name="Edit" value="2" onchange="getper('PJv','Edit')" <%= hmper != null ? (hmper.get("P_UPDATE").toString().equals("1") ? "checked" : "") : ""%>/><label>Edit</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Delete" name="Delete" value="4" onchange="getper('PJv','Delete')" <%= hmper != null ? (hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>Delete</label>
                                                    <input type="hidden" id="per" name="per" value="<%=hmper != null ? hmper.get("TOTAL") : "0"%>"/>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="View" name="View" value="8" onchange="getper('PJv','View')" <%= hmper != null ? (hmper.get("P_VIEW").toString().equals("1") ? "checked" : "") : ""%>/><label>View</label>
                                                </div>
                                                <div class="mws-form-col-2-8"></div>            
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Trash" name="Trash" value="16" onchange="getper('PJv','Trash')" <%= hmper != null ? (hmper.get("P_TRASH").toString().equals("1") ? "checked" : "") : ""%>/><label>Trash</label>
                                                </div>
                                                <div class="mws-form-col-2-8">
                                                    <input type="checkbox" name="All" id="All" onchange="AllChk('PJv','All')" value="31" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") && hmper.get("P_UPDATE").toString().equals("1") && hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>All</label>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="border-top: Solid 1px #B5D56D;"></hr>
                                        <div class="mws-form-col-2-8"></div>
                                        <%
                                            if (ltper != null) {
                                                hmper = (HashMap) ltper.get(6);
                                            }
                                        %>
                                        <div id="PReport" class="mws-form-col-3-8 alpha">
                                            <label style="text-align: center;">Permission For Report Module</label>
                                            <div class="mws-form-item large">
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Add" name="Add" value="1" onchange="getper('PReport','Add')" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") ? "checked" : "") : ""%>/><label>Add</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Delete" name="Delete" value="4" onchange="getper('PReport','Delete')" <%= hmper != null ? (hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>Delete</label>
                                                    <input type="hidden" id="per" name="per" value="<%=hmper != null ? hmper.get("TOTAL") : "0"%>"/>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="View" name="View" value="8" onchange="getper('PReport','View')" <%= hmper != null ? (hmper.get("P_VIEW").toString().equals("1") ? "checked" : "") : ""%>/><label>View</label>
                                                </div>
                                                <div class="mws-form-col-2-8">
                                                    <input type="checkbox" name="All" id="All" onchange="AllChk('PReport','All')" value="13" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") && hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>All</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mws-form-col-1-8"></div>
                                        <%
                                            if (ltper != null) {
                                                hmper = (HashMap) ltper.get(7);
                                            }
                                        %>
                                        <div id="PTrash" class="mws-form-col-3-8 alpha">
                                            <label style="text-align: center;">Permission For Trash Module</label>
                                            <div class="mws-form-item large">
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Add" name="Add" value="1" onchange="getper('PTrash','Add')" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") ? "checked" : "") : ""%>/><label>Restore</label>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="Delete" name="Delete" value="4" onchange="getper('PTrash','Delete')" <%= hmper != null ? (hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>Delete</label>
                                                    <input type="hidden" id="per" name="per" value="<%=hmper != null ? hmper.get("TOTAL") : "0"%>"/>
                                                </div>
                                                <div class="mws-form-col-2-8">            
                                                    <input type="checkbox" id="View" name="View" value="8" onchange="getper('PTrash','View')" <%= hmper != null ? (hmper.get("P_VIEW").toString().equals("1") ? "checked" : "") : ""%>/><label>View</label>
                                                </div>
                                                <div class="mws-form-col-2-8">
                                                    <input type="checkbox" name="All" id="All" onchange="AllChk('PTrash','All')" value="13" <%= hmper != null ? (hmper.get("P_ADD").toString().equals("1") && hmper.get("P_DELETE").toString().equals("1") ? "checked" : "") : ""%>/><label>All</label>
                                                </div>
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
                <script>
                    function AllChk(tr,id){
                        if($('#'+tr).find('#'+id).attr('checked')=="checked"){
                            $('#'+tr).find('input').attr('checked','checked');
                            $('#'+tr).find('#per').val($('#'+tr).find('#All').val());
                        }else{
                            $('#'+tr).find('input').removeAttr('checked');
                            $('#'+tr).find('#per').val(0);
                        }
                    }                   
                    function getper (tr,id){
                        var total=parseInt($('#'+tr).find('#per').val());
                        if($('#'+tr).find('#'+id).attr('checked')=="checked"){
                            total+=parseInt($('#'+tr).find('#'+id).val());
                        }else{
                            total-=parseInt($('#'+tr).find('#'+id).val());
                        }
                        $('#'+tr).find('#per').val(total);
                    }
                </script>










