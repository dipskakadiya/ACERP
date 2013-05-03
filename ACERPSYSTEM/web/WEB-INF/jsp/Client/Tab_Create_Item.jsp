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
                pnotify_text: 'Item Create Successfully',
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
        <span class="mws-i-24 i-check">Add Item</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" method="post" enctype="multipart/form-data" class="mws-form" onsubmit="Save()" action="Item.htm">
            <input name="menu" value="Item" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <input name="id" value="<% out.print(request.getParameter("id"));%>" type="hidden"/>
            <%  List ltItem = (List) request.getAttribute("dataItem");
                HashMap hmItem = null;
                if (ltItem != null) {
                    if (request.getParameter("id") != null) {
                        for (int i = 0; i < ltItem.size(); i++) {
                            hmItem = (HashMap) ltItem.get(i);
                            if (request.getParameter("id").toString().equals(hmItem.get("Item_id").toString())) {
                                break;
                            } else {
                                hmItem = null;
                            }
                        }
                    }
                }
            %>
            <div class="mws-form-inline">
                <fieldset>
                    <legend style="text-align: center">Item Information</legend>
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-1-8">
                                </div>
                                <div class="mws-form-col-3-8 alpha">
                                    <div class="mws-form-col-3-8 alpha">
                                        <label>Item Code</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" name="Item_Code" id="Item_Code" class="mws-textinput" readonly value="<% if (hmItem != null) {
                                                    out.print(hmItem.get("Item_id"));
                                                } else {
                                                    out.print(request.getAttribute("ItemId"));
                                                }%>" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-5-8">
                                        <label>Item Category</label>
                                        <div style="color: black" class="mws-form-item">
                                            <select class="chzn-select" name='Ctg_id' id='Ctg_id'>
                                                <% List ltICtg = (List) request.getAttribute("dataCtg");
                                                    HashMap hmICtg = null;
                                                    if (ltICtg != null) {
                                                        for (int j = 0; j < ltICtg.size(); j++) {
                                                            hmICtg = (HashMap) ltICtg.get(j);%>
                                                <option value="<%out.print(hmICtg.get("Ctg_id"));%>"<%if (hmICtg != null && hmItem != null) {
                                                        if (hmItem.get("Ctg_id").toString().equals(hmICtg.get("Ctg_id").toString()) == true) {
                                                            out.print("selected");
                                                        }
                                                    }%>><%out.print(hmICtg.get("Ctg_Name"));%></option>
                                                <% }
                                                    }%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mws-form-col-8-8 omega">
                                        <label>Item Name</label>
                                        <div class="mws-form-item">
                                            <input type="text" name="Item_Name" id="Item_Name" class="validate[required] mws-textinput" value="<% if (hmItem != null) {
                                                    out.print(hmItem.get("ITEM_NAME"));
                                                }%>" />
                                        </div>
                                    </div>
                                </div>
                                <div align="center" class="mws-form-col-3-8">
                                    <img src="images/Product/<% if (hmItem != null) {
                                            out.print(hmItem.get("item_id") + "" + hmItem.get("pimage"));
                                        }%>" alt="User Photo" height="120" width="200" />
                                    <input type="hidden" name="Imagealt" value="<% if (hmItem != null) {
                                            out.print(hmItem.get("image"));
                                        } else {
                                            out.print("productDefault.png");
                                        }%>"/>                                           
                                    <input type="file" name="Image"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <fieldset>
                        <legend style="text-align: center">Item Detail Information</legend>
                        <div class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <div class="mws-form-col-1-8">
                                    </div>

                                    <div class="mws-form-col-1-8 alpha">
                                        <label>Op. Stock</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="0" name="Op_Stock" id="Op_Stock" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmItem != null) {
                                                    out.print(hmItem.get("Op_Stock"));
                                                } else {
                                                    out.print("0");
                                                }%>" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8">
                                        <label>Op. Rate</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="0" name="Op_Rate" id="Op_Rate" class="validate[required,custom[number]] mws-textinput" value="<% if (hmItem != null) {
                                                    out.print(hmItem.get("Op_Rate"));
                                                } else {
                                                    out.print("0");
                                                }%>" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-2-8">
                                        <label>Op. Amount</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="0" name="Op_Amount" id="Op_Amount" class="validate[required,custom[number]] mws-textinput" readonly value="<% if (hmItem != null) {
                                                    out.print(hmItem.get("Op_Amount"));
                                                } else {
                                                    out.print("0");
                                                }%>" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8">
                                        <label>Sales Rate</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="0" name="Sales_Rate" id="Sales_Rate" class="validate[required,custom[number]] mws-textinput" value="<% if (hmItem != null) {
                                                    out.print(hmItem.get("Sales_Rate"));
                                                } else {
                                                    out.print("0");
                                                }%>" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8 omega">
                                        <label>Item MRP</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="0" name="Item_Mrp" id="Item_Mrp" class="validate[required,custom[number]] mws-textinput" value="<% if (hmItem != null) {
                                                    out.print(hmItem.get("Item_Mrp"));
                                                } else {
                                                    out.print("0");
                                                }%>" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <div class="mws-form-col-1-8">
                                    </div>
                                    <div class="mws-form-col-1-8 alpha">
                                        <label>ReOrder Leval</label>
                                        <div class="mws-form-item">
                                            <input type="text" style="text-align: right;" placeholder="0" name="Reorder_Level" id="Reorder_Level" class="validate[required,custom[integer]] mws-textinput" value="<% if (hmItem != null) {
                                                    out.print(hmItem.get("Reorder_Level"));
                                                } else {
                                                    out.print("0");
                                                }%>" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8" >
                                        <label>Item Label Print</label>
                                        <ul class="mws-form-list inline">
                                            <li><input type="radio" id="Lable_Print1" name="Lable_Print" value="1" <% if (hmItem != null) {
                                                    if (hmItem.get("Label_Print").toString().equals("1")) {
                                                        out.print("checked");
                                                    }
                                                }%> /> <label>Yes</label></li>
                                            <li><input type="radio" id="Lable_Print2" name="Lable_Print" value="0" <% if (hmItem != null) {
                                                    if (hmItem.get("Label_Print").toString().equals("0")) {
                                                        out.print("checked");
                                                    }
                                                }%>/> <label>No</label></li>
                                        </ul>
                                    </div>
                                    <div class="mws-form-col-1-8" >
                                        <label>Taxes Applicable</label>
                                        <ul class="mws-form-list inline">
                                            <li><input type="radio" id="Tax_Applicable1" name="Tax_Applicable" value="1" <% if (hmItem != null) {
                                                    if (hmItem.get("Tax_Applicable").toString().equals("1")) {
                                                        out.print("checked");
                                                    }
                                                }%> /> <label>Yes</label></li>
                                            <li><input type="radio" id="Tax_Applicable2" name="Tax_Applicable" value="0" <% if (hmItem != null) {
                                                    if (hmItem.get("Tax_Applicable").toString().equals("0")) {
                                                        out.print("checked");
                                                    }
                                                }%>/> <label>No</label></li>
                                        </ul>
                                    </div>
                                    <div class="mws-form-col-2-8" >
                                        <div style="width: 65%; float: left">
                                            <label>Tax Name</label>
                                            <div class="mws-form-item">
                                                <select name="Tax" id="Tax">
                                                    <% List ltAt = (List) request.getAttribute("dataAllTax");
                                                        HashMap hmAt = null;
                                                        if (ltAt != null) {
                                                            for (int j = 0; j < ltAt.size(); j++) {
                                                                hmAt = (HashMap) ltAt.get(j);%>
                                                    <option value="<%out.print(hmAt.get("Tax_id"));%>"><%out.print(hmAt.get("Tax_Name"));%></option>
                                                    <% }
                                                        }%>

                                                </select>

                                            </div>
                                        </div>
                                        <div style="width: 25%; float: right">
                                            <label>Tax in Percentage</label>
                                            <input type="text" name="Tax_Per" id="Tax_Per" class="validate[custom[integer],max[100],min[1]] mws-textinput" />
                                        </div>
                                    </div>
                                    <div class="mws-form-col-1-8 omega">
                                        <label></label>
                                        <div class="mws-form-item">
                                            <input  style="margin-top: 30px;" type="button" style="margin-top:30px" class="mws-button save blue" name="Add_Tax" value="Add Tax" id="AddTax"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="mws-form-row">
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-item large">
                                    <div   class="mws-form-col-1-8"></div> 
                                    <div align="center"  class="mws-form-col-3-8 alpha">

                                    </div>
                                    <div class="mws-form-col-4-8 omega">
                                        <!--- BANK DATA IN TABLE -->
                                        <fieldset>
                                            <legend style="text-align: center">Tax Information</legend>

                                            <table border="5">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 150px;">Tax Name</th>
                                                        <th style="width: 150px;">Persontage(%)</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="TblTax"></tbody>
                                            </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <span id="tax_data">&nbsp;</span>
                        </div>
                        <div class="mws-button-row">
                            <input type="submit" class="mws-button orange  mws-i-24 i-save large" name="action" value="Save" />
                            <!--input type="reset" value="Reset" class="mws-button gray" /-->
                        </div>
                        </form>
                        </div>
                        </div>
                        <script type="text/javascript">
                            var i=1;
                            $("#AddTax").click(function(){
                                if($("#Tax_Per").val()!=""&& $("#Tax_Per").val()>0 && $("#Tax_Per").val()<100){
                                    $("#TblTax").append("<tr><td>"+$('#Tax option:selected').text()+"<%out.print("<input type='hidden' name='mygrid' value='");%>"+$('#Tax').val()+"<%out.print("'/>");%></td><td>"+$('#Tax_Per').val()+"<%out.print("<input type='hidden' name='mygrid' value='");%>"+$('#Tax_Per').val()+"<%out.print("'/>");%></td><td><img src='images/core/fancy_close.png' id='"+i+"' onClick='RemoveBank("+i+");'></td></tr>");
                                    i+=1;
                                }else{
                                    jQuery('#Tax_Per').validationEngine('showPrompt', 'please Enter Tax Persentage valid', 'fail')
                                }
                            });
                            function RemoveBank(i){
                                var li=$('#'+i).parent().parent();
                                li.remove();
                            }
                            function AddTax(){
                            <%
                                List ltTax = (List) request.getAttribute("dataTax");
                                HashMap hmTax = null;
                                if (ltTax != null) {
                                    if (request.getParameter("id") != null) {
                                        for (int i = 0; i < ltTax.size(); i++) {
                                            hmTax = (HashMap) ltTax.get(i);
                                            if (request.getParameter("id").toString().equals(hmTax.get("ITEM_ID").toString())) {
                            %>
                                    $("#TblTax").append("<tr><td><% out.print(hmTax.get("TAX_NAME"));
                                        out.print("<input type='hidden' name='mygrid' value='" + hmTax.get("TAX_id") + "'/>");%></td><td><% out.print(hmTax.get("TAX_PER"));
                                            out.print("<input type='hidden' name='mygrid' value='" + hmTax.get("TAX_PER") + "'/>");%></td><td><img src='images/core/fancy_close.png' id='"+i+"' onClick='RemoveBank("+i+");'></td></tr>");
                                                    i++;
                            <%                        }
                                        }
                                    }
                                }
                            %>
                                }
                        </script>

                        <script type="text/javascript">
                            $(document).ready(function(){
                                $("#Op_Rate").change(function(){
                                    var qty=$("#Op_Stock").val();
                                    var rate=$("#Op_Rate").val();
                                    $("#Op_Amount").val(qty*rate);
                                });
                                $("#Op_Stock").change(function(){
                                    var qty=$("#Op_Stock").val();
                                    var rate=$("#Op_Rate").val();
                                    $("#Op_Amount").val(qty*rate);
                                });
                            });
                        </script>
