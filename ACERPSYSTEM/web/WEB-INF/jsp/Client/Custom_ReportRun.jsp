<%@page import="java.util.ArrayList"%>
<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-table-1">View All Account</span>
    </div>
    <div style='overflow: auto' class="mws-panel-body">
         <form id="formID" class="mws-form" method="post" action="Report.htm">
         <input name="id" id="id" type="hidden" value="<%=request.getParameter("id")%>"/>
        <table class="mws-datatable-fn mws-table">
            <thead id="TblHeadprint">
                <tr>
                    <% List lt = (List) request.getAttribute("fields");
                        HashMap hm = null;
                        String fld[] = null;
                        if (lt != null) {
                            hm = (HashMap) lt.get(0);
                    
                                      fld = hm.get("ALIES").toString().split(",");
                                      for (int i = 0; i < fld.length; i++) {
                                          out.print("<th>" + fld[i] + "</th>");
                                      }
                                  }
            %>
            </tr>
            </thead>
            <tbody id="Tblprint">
                <%
                    lt = (List) request.getAttribute("Data");
                    fld = hm.get("fields").toString().split(",");
                    if (lt != null) {
                        for (int j = 0; j < lt.size(); j++) {
                            out.print("<tr>");
                            hm = (HashMap) lt.get(j);
                            for (int i = 0; i < fld.length; i++) {
                                out.print("<td>" + hm.get(fld[i]) + "</td>");
                            }
                            out.print("</tr>");
                        }
                    }
                %>
            </tbody>
            <div style="text-align: center" class="mws-button-row">
                    <input type="submit" class="mws-button save green" name="action" value="ExportToCSV" />
                    <input type="Button" class="mws-button save green" onclick="PrintElem()" name="Print" value="Print" />
                </div>
        </table>
         </form>
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