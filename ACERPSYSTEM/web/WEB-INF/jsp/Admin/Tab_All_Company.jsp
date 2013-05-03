<hr/>
<div id="All Company" style="margin-top: 25px;">
    <div class="mws-panel grid_8">
        <div class="mws-panel-header">
            <span class="mws-i-24 i-table-1">All Company Information</span>
        </div>
        <div class="mws-panel-body">
            <table class="mws-datatable-fn mws-table">
                <thead>
                    <tr>
                        <th>Com. Name</th>
                        <th>Com. Address</th>
                        <th>City/State/Country</th>
                        <th>Phone No</th>
                        <th>Mobile No</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <% List ltCom = (List) request.getAttribute("dataCom");
                               HashMap  hmCom = null;
                                if (ltCom != null) {
                                    for (int i = 0; i < ltCom.size(); i++) {
                                        hmCom = (HashMap) ltCom.get(i);
                    %>
                    <tr class="gradeX">
                        <td><%  out.print(hmCom.get("Com_Name"));%></td>
                        <td><%  out.print(hmCom.get("C_Address")+ "," + hmCom.get("Area"));%></td>
                        <td><%  out.print(hmCom.get("Ci_Name") + "," + hmCom.get("S_Name") + "," + hmCom.get("C_Name"));%></td>
                        <td><%  out.print(hmCom.get("Phone_No"));%></td>
                        <td><%  out.print(hmCom.get("CONTACT_NO"));%></td>
                        <td><%  out.print(hmCom.get("Email_id"));%></td>
                    </tr>
                    <%}
                                }%>
                </tbody>
            </table>
        </div>
    </div>
</div>
