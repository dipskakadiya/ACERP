<hr/>
<div id="Block" style="margin-top: 25px;">
    <div class="mws-panel grid_8">
        <div class="mws-panel-header">
            <span class="mws-i-24 i-table-1">Total Currency</span>
        </div>
        <div class="mws-panel-body">
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <table class="mws-datatable-fn mws-table">
                <thead>
                    <tr>
                        <th>Request Id</th>
                        <th>User Name</th>
                        <th>Date</th>
                        <th>Question</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% List ltreq = (List) request.getAttribute("dataReq");
                              HashMap  hmreq = null;

                                if (ltreq != null) {
                                    for (int i = 0; i < ltreq.size(); i++) {
                                        hmreq = (HashMap) ltreq.get(i);
                    %>
                    <tr class="gradeX">
                        <td><%  out.print(hmreq.get("Req_Id"));%></td>
                        <td><%  out.print(hmreq.get("User_Id"));%></td>
                        <td><%  out.print(hmreq.get("REQ_DATE"));%></td>
                        <td><%  out.print(hmreq.get("QUESTION"));%></td>
                        <td>
                            <ul id="icons-16" class="clearfix">
                                <a href="Send_Mail.htm?menu=Send_Mail&action=show&flag=0&id=<%out.print(hmreq.get("Req_Id"));%>"><li class="mws-ic ic-email-to-friend" title="Block"></li></a>
                            </ul>
                        </td>
                    </tr>
                    <%}
                                }%>
                </tbody>
            </table>
        </div>
    </div>
</div>
