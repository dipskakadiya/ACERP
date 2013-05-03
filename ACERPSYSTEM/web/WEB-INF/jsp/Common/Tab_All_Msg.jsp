<h1>All Message</h1>
<div id="content" style="margin-top: 30px;" class="mws-form-col-5-8">
    <%  ltMsg = (List) request.getAttribute("DataMsg");
         hmMsg = null;
        if (ltMsg != null) {
            for (int i = 0; i < ltMsg.size(); i++) {
                hmMsg = (HashMap) ltMsg.get(i);
    %>
    <div style="border:Solid 2px #B5D56D;margin-bottom: 30px;padding: 10px">
        <legend style="float: right"><a href="All_Msg.htm?menu=AllMessage&action=delete&id=<%out.print(hmMsg.get("MAIL_ID"));%>"><img src='images/core/fancy_close.png'></a></legend>
        <div style="float: left; width: 50%;height: 30px"><h3><% out.print(hmMsg.get("sender"));%></h3></div><div style="float: right; width: 50%;height: 30px"><% out.print(hmMsg.get("mail_date"));%></div>
        <br></br>
        <div style="height: 10px"><b style="font-size: 14px">Subject:-</b><% out.print(hmMsg.get("Subject"));%></div>
        <br></br>
        <div><b style="font-size: 14px">Message:-</b><% out.print(hmMsg.get("MESSAGE"));%></div>
    </div>
    <%}
        }%>
</div>







