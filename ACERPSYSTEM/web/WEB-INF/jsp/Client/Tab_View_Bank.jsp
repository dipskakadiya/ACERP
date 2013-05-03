<hr/>
<div>
    <%/* Success notification */
        Integer status = Integer.parseInt(request.getParameter("flag"));
        if (status != 0) {
            if (status == 2) {
    %>
    <script>
        $(document).ready(function() {
            $.pnotify({
                pnotify_title: 'Success Notification',
                pnotify_text: 'Bank Transection Move To Trash Successfully',
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
                pnotify_text: 'Bank Transection Updated Successfully',
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
    <script>
        $(document).ready(function() {
            var notice = $.pnotify({
                pnotify_text: $('#form_notice').html(),
                pnotify_notice_icon: '',
                pnotify_width: 'auto',
                pnotify_hide: false,
                pnotify_closer: false,
                pnotify_sticker: false,
                pnotify_insert_brs: false
            });
        });
       
    </script>
       <%}
        }%>
</div>
<!-- ASK for Print  -->
<div style="display: none"><div id="form_notice">
        Do You Want to Printout The  Bill?<br/>
        <div style="float: right"> <input type="button" class="mws-button blue  mws-i-24" onclick="print_bill()" value="Yes" />
            <input type="button" class="mws-button red  mws-i-24" onclick="print_cancle()" value="No" />
        </div>
    </div>
    <script>
        function print_bill(){
            window.open("Bank.htm?action=show&menu=Bank&flag=0&id=0","_self");
            window.open("Bank.htm?menu=Bank&action=print_bill&pid=<%out.print(request.getParameter("pid"));%>","_blank");
        }
        function print_cancle(){
            window.open("Bank.htm?action=show&menu=Bank&flag=0&id=0","_self");
        }
    </script>
</div>
<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-table-1">View All Bank Transection</span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead>
                <tr id="TblHeadprint">
                    <th>Transection Type</th>
                    <th>Entry Date</th>
                    <th>Account Name</th>
                    <th>Total Amount</th>
                    <th>Check No</th>
                    <th>Check Date</th>
                    <%
                        if (lper != null) {
                            hper = (HashMap) lper.get(3);
                        }
                        UST = session.getAttribute("User_Type");
                        if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_Delete").toString().equals("1")))) {
                    %>
                    <th>Action</th>
                    <%}%>
                </tr>
            </thead>
            <tbody id="Tblprint">
                <% List ltBtr = (List) request.getAttribute("dataBtr");
                    HashMap hmBtr = null;
                    if (ltBtr != null) {
                        for (int i = 0; i < ltBtr.size(); i++) {
                            hmBtr = (HashMap) ltBtr.get(i);
                %>
                <tr>
                    <td><% out.print(hmBtr.get("TR_TYPE"));%></td>
                    <td><% out.print(hmBtr.get("ENTRY_DATE").toString().substring(0, 10));%></td>
                    <td style="text-align: center;">
                        <%
                            if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1")))) {
                        %>
                        <a style="color: black;" href="?menu=Bank&action=show&flag=1&id=<%out.print(hmBtr.get("TR_ID"));%>">
                            <%}%>
                            <% List ltAC = (List) request.getAttribute("dataAC");
                                HashMap hmAC = null;
                                if (ltAC != null) {
                                    for (int j = 0; j < ltAC.size(); j++) {
                                        hmAC = (HashMap) ltAC.get(j);
                                        if (hmBtr.get("Ac_id").toString().equals(hmAC.get("Ac_Id").toString()) == true) {
                                            out.print(hmAC.get("Ac_Name"));
                                        }
                                    }

                                }%>
                            <%
                                if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1")))) {
                            %>      
                        </a>
                        <%}%>
                    </td>
                    <td><% out.print(hmBtr.get("TOTAL_AMOUNT"));%></td>
                    <td><% out.print(hmBtr.get("CHK_NO"));%></td>
                    <td><% out.print(hmBtr.get("CHK_DATE").toString().substring(0, 10));%></td>
                    <% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_Delete").toString().equals("1")))) {%>
                    <td>
                        <a href="?menu=Bank&action=delete&flag=0&id=<%out.print(hmBtr.get("TR_Id"));%>"><img src="images/core/ico_delete_16.png" alt="Delete"/></a>
                    </td>
                    <%}%>
                </tr>
                <%
                        }
                    }%>
            </tbody>
            <form id="formID" class="mws-form" method="post" action="Bank.htm">
                <div align="center" class="mws-button-row">
                    <input type="submit" class="mws-button save green" name="action" value="ExportToCSV" />
                    <input type="Button" class="mws-button save green" onclick="PrintElem()" name="Print" value="Print" />
                </div>
            </form>
        </table>
    </div>
</div>

<script>
    function PrintElem()
    {
        Popup();
        //	print();
    }

    function Popup() 
    {
        var mywindow = window.open('', 'Assesment Score', 'height=700,width=600');
        mywindow.document.write('<html><head><title>my div</title>');
   
        mywindow.document.write('</head><body><table>');
        mywindow.document.write(document.getElementById('TblHeadprint').innerHTML);
        mywindow.document.write(document.getElementById('Tblprint').innerHTML);
        mywindow.document.write('</table></body></html>');
        mywindow.document.close();
        mywindow.print();
        mywindow.document.close();
        return true;
    }

                
</script>