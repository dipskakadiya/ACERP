<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-table-1">View All Account</span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead id="TblHeadprint">
                <tr>
                    <th>BILL NO</th>
                    <th>BILL DATE</th>
                    <th>QTY</th>
                    <th>DESCRIPTION</th>
                    <th>RATE</th>
                </tr>
            </thead>
            <tbody id="Tblprint">
                <% List lt = (List) request.getAttribute("dataStock");
                    HashMap hm = null;
                    if (lt != null) {
                        for (int i = 0; i < lt.size(); i++) {
                            hm = (HashMap) lt.get(i);
                %>
                <tr class="gradeX">
                    <td><%=hm.get("BILL_NO")%></td>
                    <td><%=hm.get("BILL_DATE")%></td>
                    <td><%=hm.get("Qty")%></td>
                    <td><%=hm.get("DESCRIPTION")%></td>
                    <td><%=hm.get("RATE")%></td>
                </tr>
                <%}
                    }%>
            </tbody>
            <form id="formID" class="mws-form" method="post" action="Report.htm">
                <div align="center" class="mws-button-row">
<!--                    <input type="submit" class="mws-button save green" name="action" value="ExportItemStock" />-->
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