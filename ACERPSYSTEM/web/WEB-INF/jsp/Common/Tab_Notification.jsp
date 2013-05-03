
<!-- Notifications -->
<div id="mws-user-notif" class="mws-dropdown-menu">
    <a href="#" class="mws-ic ic-information mws-dropdown-trigger">Notifications</a>
    <% List ltnotify = (List) request.getAttribute("Datanotify");
        HashMap hmnotify = null;
        Integer notify_count = 0;
        if (ltnotify != null) {
            /* Message Counter*/
            for (int i = 0; i < ltnotify.size(); i++) {
                hmnotify = (HashMap) ltnotify.get(i);
                if (hmnotify.get("read").toString().equals("0") == true) {
                    notify_count++;
                }
            }
        }%>

    <!-- Unread notification count -->
    <span class="mws-dropdown-notif"><%if (notify_count != null) {
            out.print(notify_count);
        }%></span>

    <!-- Notifications dropdown -->
    <div class="mws-dropdown-box">
        <div class="mws-dropdown-content">
            <ul class="mws-notifications">
                <%
                    /* Display message */
                    Integer limit1 = (notify_count > 5) ? 5 : ltnotify.size();
                    if (ltnotify != null) {
                        for (int i = 0; i < limit1; i++) {
                            hmnotify = (HashMap) ltnotify.get(i);
                %>

                <li class="<%if (hmnotify.get("read").toString().equals("0") == true) {
                        out.print("unread");
                    } else {
                        out.print("read");
                    }%>">

                    <a href="#">
                        <span class="message">
                            <%out.print(hmnotify.get("MESSAGE"));%>
                        </span>
                        <span class="time">
                            <%out.print(hmnotify.get("N_DATE"));%>
                        </span>
                    </a>
                </li>
                
                <%
                        }
                    }
                %>
            </ul>
            <div class="mws-dropdown-viewall" onclick="hi_notify()">
                <a>View All Notification</a>
            </div>
        </div>
    </div>
</div>
<script>
    function hi_notify(id)
    {
        if(id!=null){
            // window.open("All_Msg.htm?menu=AllMessage&action=show&id="+id,"_self");
            $.jGrowl($('#msg'+id).html(), {
                position: "top-right"
            });
        }else{
            window.open("All_Msg.htm?menu=AllMessage&action=show_Notify","_self");
        }
    }
</script>
