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
        <span class0="mws-i-24 i-check">Add Bank</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="post" action="Setting.htm">
            <input name="menu" value="Account" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <%  List ltAH = (List) request.getAttribute("dataAH");
                HashMap hmAH = null;
                if (ltAH != null) {
                    if (request.getParameter("id") != null) {
                        for (int i = 0; i < ltAH.size(); i++) {
                            hmAH = (HashMap) ltAH.get(i);
                            if (request.getParameter("id").toString().equals(hmAH.get("Head_Id").toString())) {
                                break;
                            } else {
                                hmAH = null;
                            }
                        }
                    }
                }
            %>
            <fieldset>
                <legend style="text-align: center">Bank Information</legend>
                <div class="mws-form-inline">
                    <div class="mws-form-row">
                        <div class="mws-form-item large">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8">
                                    <label>Master Head</label>
                                    <div style="color: black" class="mws-form-item">
                                        <select class="chzn-select" name='MAc_Head' id='MAc_Head'>
                                            <option <% if (hmAH != null) {
                                                    if (hmAH.get("M_HEAD_ID").toString().equals("0")==true) {
                                                        out.print("selected ");
                                                    }
                                                }%> value="0">Main</option>

                                            <% List ltAH1 = (List) request.getAttribute("dataAH");
                                                HashMap hmAH1 = null;
                                                if (ltAH1 != null) {
                                                    for (int j = 0; j < ltAH1.size(); j++) {
                                                        hmAH1 = (HashMap) ltAH.get(j);%>
                                            <option value="<%out.print(hmAH1.get("Head_id"));%>"<%if (hmAH != null) {
                                                    if (hmAH.get("M_HEAD_ID").toString().equals(hmAH1.get("HEAD_ID").toString()) == true) {
                                                        out.print("selected");
                                                    }
                                                }%>><%out.print(hmAH1.get("Ac_name"));%></option>
                                            <% }
                                                }%>
                                        </select>
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label>Ac Head Name</label>
                                    <div class="mws-form-item">
                                        <input type="text" name="Ac_Head" id="Ac_Head" class="validate[required] mws-textinput" value="<% if (hmAH != null) {
                                                out.print(hmAH.get("AC_NAME"));
                                            }%>"/>
                                    </div>
                                    <% if (hmAH != null) {%>
                                    <input type="hidden" name="Head_id" value="<%
                                        out.print(hmAH.get("HEAD_ID"));
                                           %> "/>
                                    <% }%>
                                </div>
                                <div class="mws-form-col-1-8">
                                    <label>Balance Type</label>
                                    <div class="mws-form-item">
                                        <select name='Btype' id='Btype'>
                                            <option <% if (hmAH != null) {
                                                    if (hmAH.get("BAL_TYPE").toString().equals("Dr")==true) {
                                                        out.print("selected ");
                                                    }
                                                }%>>Dr</option>
                                            <option <% if (hmAH != null) {
                                                    if (hmAH.get("BAL_TYPE").toString().equals("Cr")==true) {
                                                        out.print("selected ");
                                                    }
                                                }%> >Cr</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mws-button-row">
                    <input type="submit" class="mws-button blue  mws-i-24 i-save large" name="action" value="save_AcHead" />
                    <!--input type="reset" value="Reset" class="mws-button green" /-->
                </div>
        </form>
    </div>
</div>








<div class="mws-panel grid_4">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-table-1">View All Head Account</span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead>
                <tr>
                    <th>Account Name</th>
                    <th>Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% List ltAcHead = (List) request.getAttribute("dataAH");
                    HashMap hmAcHead = null;
                    if (ltAcHead != null) {
                        for (int i = 0; i < ltAcHead.size(); i++) {
                            hmAcHead = (HashMap) ltAcHead.get(i);
                %>
                <tr class="gradeX">
                    <td style="text-align: center"><a style="color: black;" href="?menu=Setting&action=AC_Head&flag=1&id=<%out.print(hmAcHead.get("HEAD_ID"));%>"><%  out.print(hmAcHead.get("AC_NAME"));%></a></td>
                    <td><%  out.print(hmAcHead.get("BAL_TYPE"));%></td>
                    <td>
                        <a href="?menu=Setting&action=deleteACHD&flag=0&id=<%out.print(hmAcHead.get("HEAD_ID"));%>"><img src="images/core/ico_delete_16.png" alt="Delete"/></a>
                    </td>
                </tr>
                <%}
                    }%>
            </tbody>
        </table>
    </div>
</div>
