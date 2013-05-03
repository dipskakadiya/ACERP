<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-table-1">Item Stocks</span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead id="TblHeadprint">
                <tr>
                    <th>Item Name</th>
                    <th>Opening Stock</th>
                    <th>Total Purchase</th>
                    <th>Total Sales</th>
                    <th>Total Purchase Return</th>
                    <th>Total Sales Return</th>
                    <th>Stock</th>
                    <th>Stock Values</th>
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
                    <td><%  out.print(hm.get("ITEM_NAME"));%></td>
                    <td><a style="color: black;" href="Report.htm?menu=Report&action=ItStDt&id=<%=hm.get("ITEM_id")%>&ty=OPENING STOCK"><% if(hm.get("OP_STOCK")!=null){ out.print(hm.get("OP_STOCK"));}else{out.print("0");}%></a></td>
                    <td><a style="color: black;" href="Report.htm?menu=Report&action=ItStDt&id=<%=hm.get("ITEM_id")%>&ty=Purchase Bill"><% if(hm.get("PURCHASE")!=null){ out.print(hm.get("PURCHASE"));}else{out.print("0");}%></a></td>
                    <td><a style="color: black;" href="Report.htm?menu=Report&action=ItStDt&id=<%=hm.get("ITEM_id")%>&ty=Sales Bill"><% if(hm.get("SALES")!=null){ out.print(hm.get("SALES"));}else{out.print("0");}%></a></td>
                    <td><a style="color: black;" href="Report.htm?menu=Report&action=ItStDt&id=<%=hm.get("ITEM_id")%>&ty=Purchase Return Bill"><% if(hm.get("PURCHASE_RTN")!=null){ out.print(hm.get("PURCHASE_RTN"));}else{out.print("0");}%></a></td>
                    <td><a style="color: black;" href="Report.htm?menu=Report&action=ItStDt&id=<%=hm.get("ITEM_id")%>&ty=Sales Return Bill"><% if(hm.get("SALES_RTN")!=null){ out.print(hm.get("SALES_RTN"));}else{out.print("0");}%></a></td>
                    <td><% if(hm.get("Stock")!=null){ out.print(hm.get("Stock"));}else{out.print("0");}%></td>
                    <td><% if(hm.get("ItemValues")!=null){ out.print(hm.get("ItemValues"));}else{out.print("0");}%></td>
                </tr>
                <%}
                    }%>
            </tbody>
            <form id="formID" class="mws-form" method="post" action="Report.htm">
                <div align="center" class="mws-button-row">
                    <input type="submit" class="mws-button save green" name="action" value="ExportItemStock" />
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