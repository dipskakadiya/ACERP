<h1>All Notification</h1>
<div id="content" style="margin-top: 30px;" class="mws-form-col-5-8">
    <% List ltnt = (List) request.getAttribute("Datanotify");
       HashMap hmnt = null;
        if (ltnt != null) {
            for (int i = 0; i < ltnt.size(); i++) {
                hmnt = (HashMap) ltnt.get(i);
    %>
    <div style="border:Solid 2px #B5D56D; padding: 10px; height: 30px;">
        <div style="float: left; width: 80%;">Message:<% out.print(hmnt.get("MESSAGE"));%></div>
        <div style="float: right; width: 20%"><% out.print(hmnt.get("N_DATE"));%></div>
    </div>
    <%}
        }%>
</div>
