<div class="mws-panel grid_6">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-table-1">View All Account</span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">

            <thead>
                <tr>
                    <%
                        if (lper != null) {
                            hper = (HashMap) lper.get(6);
                        }
                        UST = session.getAttribute("User_Type");
                        if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_Add").toString().equals("1")))) {
                    %>
                    <th colspan="3">
                        <a href="Report.htm?menu=Report&action=show_CReport"><input type="button" class="mws-button orange" name="action" value="Create New Reports" /></a>
                    </th>
                    <%}%>
                </tr>
                <tr>
                    <th>Reports Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% List ltAc = (List) request.getAttribute("Data");
                    HashMap hmAc = null;
                    if (ltAc != null) {
                        for (int i = 0; i < ltAc.size(); i++) {
                            hmAc = (HashMap) ltAc.get(i);
                %>
                <tr class="gradeX">
                    <td> <% out.print(hmAc.get("R_Name"));%></td>
                    <td>
                        <a style="color: orangered; text-decoration: none" href="?menu=Report&action=Run&flag=1&id=<%out.print(hmAc.get("R_id"));%>"><input type="button" class="mws-button blue" name="action" value="Run Report" /></a>
                            <% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_Delete").toString().equals("1")))) {%>
                        <a style="color: orangered; text-decoration: none" href="?menu=Report&action=Delete&flag=1&id=<%out.print(hmAc.get("R_id"));%>"><input type="button" class="mws-button green" name="action" value="Delete" /></a>
                            <%}%>
                    </td>
                </tr>
                <%}
                    }%>
            </tbody>
        </table>
    </div>
</div>

