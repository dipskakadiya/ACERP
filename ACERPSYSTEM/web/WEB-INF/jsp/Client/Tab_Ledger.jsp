<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Show Ledger</span>
    </div>
    <div class="mws-panel-body">
        <form id="mws-validate" class="mws-form" method="post" action="Report.htm">
            <input name="menu" value="Report" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <div id="mws-validate-error" class="mws-form-message error" style="display:none;"></div>
            <div class="mws-form-inline">
                <div class="mws-form-row">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-2-8 alpha">
                                <label>Account / Ledger / party Name</label>
                                <div style="color: black;" class="mws-form-item">
                                    <select class="chzn-select"  name="Account_No" id="Account_No">
                                        <% List ltAC = (List) request.getAttribute("dataAC");
                                            HashMap hmAC = null;
                                            if (ltAC != null) {
                                                for (int j = 0; j < ltAC.size(); j++) {
                                                    hmAC = (HashMap) ltAC.get(j);%>
                                        <option value="<%out.print(hmAC.get("Ac_id"));%>" <%if (request.getAttribute("AcNo") != null && hmAC != null) {
                                                if (request.getAttribute("AcNo").toString().equals(hmAC.get("Ac_Id").toString()) == true) {
                                                    out.print("selected");
                                                }
                                            }%>><%out.print(hmAC.get("Ac_name"));%></option>
                                        <% }
                                            }%>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mws-button-row">
                <input type="submit" class="mws-button save green" name="action" value="Show_Ledger" />
                <!--input type="reset" value="Reset" class="mws-button gray" /-->
            </div>
    </div>
</div>
<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-table-1">Ledger</span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead id="TblHeadprint">
                <tr>
                    <th class="sorting_asc">Tr No</th>
                    <th >Bill Date</th>
                    <th >Bill No</th>
                    <th>Perticuler</th>
                    <th>Amount</th>
                    <th>Total</th>
                    <th>DR/CR</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody id="Tblprint">
                <% List ltLdg = (List) request.getAttribute("dataLedger");
                    HashMap hmLdg = null;
                    Double Amount = 0.0, total = 0.0;
                    String Amtype = "";
                    if (ltLdg != null) {
                        for (int i = 0; i < ltLdg.size(); i++) {
                            hmLdg = (HashMap) ltLdg.get(i);
                            Amount = Double.parseDouble(hmLdg.get("AC_AMOUNT").toString());
                            if (hmLdg.get("TYPE").toString().equals("Cr") == true) {
                                total -= Amount;
                            } else {
                                total += Amount;
                            }
                            if (total >= 0) {
                                Amtype = "Cr";
                            } else {
                                Amtype = "Dr";
                            }

                %>
                <tr class="gradeX">
                    <td><%  out.print(hmLdg.get("tr_id"));%></td>
                    <td><%if (hmLdg.get("BILL_DATE") != null) {
                            out.print(hmLdg.get("BILL_DATE").toString().substring(0, 10));
                        }%></td>
                    <td><%  out.print(hmLdg.get("BILL_NO"));%></td>
                    <td><%  out.print(hmLdg.get("PERTICULER"));%></td>
                    <td><%  out.print(hmLdg.get("AC_AMOUNT"));%></td>
                    <td><%  out.print(total);%></td>
                    <td><%  out.print(Amtype);%></td>
                    <td><% out.print(hmLdg.get("DESCRIPTION"));%></td>
                </tr>
                <%}
                    }%>
            </tbody>
                <div align="center" class="mws-button-row">
                    <input type="submit" class="mws-button save green" name="action" value="ExportLegder" />
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






