<div id="mws-user-message" class="mws-dropdown-menu">
    <a href="#" class="mws-ic ic-email mws-dropdown-trigger">Messages</a>

    <% List ltmsg = (List) request.getAttribute("DataMsg");
        HashMap hmmsg = null;
        Integer msg_count = 0;
        if (ltmsg != null) {
            /* Message Counter*/
            for (int i = 0; i < ltmsg.size(); i++) {
                hmmsg = (HashMap) ltmsg.get(i);
                if (hmmsg.get("read").toString().equals("0") == true) {
                    msg_count++;
                }
            }
        }%>
    <!-- Unred messages count -->
    <span class="mws-dropdown-notif"><%if (msg_count != null) {
            out.print(msg_count);
        }%></span>

    <!-- Messages dropdown -->
    <div class="mws-dropdown-box">
        <div class="mws-dropdown-content">
            <ul class="mws-messages">
                <%
                    /* Display message */
                    Integer limit = (msg_count > 5) ? 5 : ltmsg.size();
                    if (ltmsg != null) {
                        for (int i = 0; i < limit; i++) {
                            hmmsg = (HashMap) ltmsg.get(i);
                %>
                <li onclick="hi(<%out.print(hmmsg.get("mail_id"));%>)" class="<%if (hmmsg.get("read").toString().equals("0") == true) {
                        out.print("unread");
                    } else {
                        out.print("read");
                    }%>">
                    <a>
                        <span class="sender"><% out.print(hmmsg.get("sender"));%></span>
                        <span class="message">
                            <%out.print(hmmsg.get("Subject"));%>
                        </span>
                        <span class="time">
                            <%out.print(hmmsg.get("mail_date"));%>
                        </span>
                    </a>
                </li>
                <%
                        }
                    }
                %>
            </ul>
            <div class="mws-dropdown-viewall" onclick="hi()">
                <a>View All Messages</a>
            </div>
        </div>
    </div>
</div>
<script>
    function hi(id)
    {
        if(id!=null){
            // window.open("All_Msg.htm?menu=AllMessage&action=show&id="+id,"_self");
            $.jGrowl($('#msg'+id).html(), {
                position: "top-right"
            });
        }else{
            window.open("All_Msg.htm?menu=AllMessage&action=show","_self");
        }
    }
</script>

<div style="margin-top: 30px; display: none;" class="mws-form-col-5-8">
    <% List ltMsg = (List) request.getAttribute("DataMsg");
        HashMap hmMsg = null;
        if (ltMsg != null) {
            for (int i = 0; i < ltMsg.size(); i++) {
                hmMsg = (HashMap) ltMsg.get(i);
    %>
    <div id="msg<%out.print(hmMsg.get("MAIL_ID"));%>" style="border:Solid 2px #B5D56D;margin-bottom: 30px;padding: 10px">
        <div style="float: left; width: 50%;height: 30px"><h3><% out.print(hmMsg.get("sender"));%></h3></div><div style="float: right; width: 50%;height: 30px"><% out.print(hmMsg.get("mail_date"));%></div>
        <br></br>
        <div style="height: 10px"><b style="font-size: 14px">Subject:-</b><% out.print(hmMsg.get("Subject"));%></div>
        <br></br>
        <div><b style="font-size: 14px">Message:-</b><% out.print(hmMsg.get("MESSAGE"));%></div>
    </div>
    <%}
        }%>
</div>
