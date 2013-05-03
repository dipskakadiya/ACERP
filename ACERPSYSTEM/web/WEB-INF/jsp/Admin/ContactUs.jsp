<hr/>
<div id="Block" style="margin-top: 25px;">
    <div class="mws-panel grid_8">
        <div class="mws-panel-header">
            <span class="mws-ic ic-email-add">Contact Us Detail (Visitor Request)</span>
        </div>
        <div class="mws-panel-body">
            <table class="mws-datatable-fn mws-table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Company Name</th>
                        <th>Email Id</th>
                        <th>Contact No.</th>
                        <th>Message</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% List ltreq = (List) request.getAttribute("dataRq");
                                HashMap hmreq = null;

                                if (ltreq != null) {
                                    for (int i = 0; i < ltreq.size(); i++) {
                                        hmreq = (HashMap) ltreq.get(i);
                    %>
                    <tr class="gradeX">
                        <td><%  out.print(hmreq.get("Name"));%></td>
                        <td><%  out.print(hmreq.get("Company"));%></td>
                        <td><%  out.print(hmreq.get("Email_Id"));%></td>
                        <td><%  out.print(hmreq.get("Contact_No"));%></td>
                        <td><%  out.print(hmreq.get("Message"));%></td>
                        <td>
                            <ul id="icons-16" class="clearfix">
                                <a href="Send_Mail.htm?menu=Send_Mail&action=show_CReplay&flag=0&id=<%out.print(hmreq.get("Contact_Id"));%>"><li class="mws-ic ic-email-to-friend" title="Response"></li></a>
                            </ul>
                        </td>
                    </tr>
                    <% }
                                }%>
                </tbody>
            </table>
        </div>
    </div>
</div>
