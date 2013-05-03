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
                pnotify_text: 'Category Create Successfully',
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
        <span class="mws-i-24 i-check">Add Item Category</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" action="Item.htm">
            <input name="menu" value="Item" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <input name="id" value="<% out.print(request.getParameter("id"));%>" type="hidden"/>
            <% List ltICtg = (List) request.getAttribute("dataCtg");
                HashMap hmICtg = null;
                if (ltICtg != null) {
                    if (request.getParameter("id") != null) {
                        for (int i = 0; i < ltICtg.size(); i++) {
                            hmICtg = (HashMap) ltICtg.get(i);
                            if (request.getParameter("id").toString().equals(hmICtg.get("Ctg_id").toString())) {
                                break;
                            } else {
                                hmICtg = null;
                            }
                        }
                    }
                }
            %>
            <fieldset>
                <legend style="text-align: center">Item Category Information</legend>
                <div class="mws-form-inline">
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-1-8">
                                </div>

                                <div class="mws-form-col-1-8 alpha">
                                    <label>Category Code</label>
                                    <div class="mws-form-item">
                                        <input type="text" style="text-align: right;" name="Ctg_id" id="Ctg_id" class="mws-textinput" readonly value="<% if (hmICtg != null) {
                                                out.print(hmICtg.get("Ctg_id"));
                                            } else {
                                                out.print(request.getAttribute("Ctg_id"));
                                            }%>" />
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8 omega">
                                    <label>Category Name</label>
                                    <div class="mws-form-item">
                                           <input type="text" name="Ctg_Name" id="Ctg_Name" class="validate[required] mws-textinput" value="<% if (hmICtg != null) {
                                                   out.print(hmICtg.get("Ctg_Name"));
                                               }%>" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mws-button-row">
                    <input type="submit" class="mws-button green  mws-i-24 i-save large" name="action" value="Ctg_Save" />
                    <!--input type="reset" value="Reset" class="mws-button gray" /-->
                </div>
        </form>
    </div>
</div>
