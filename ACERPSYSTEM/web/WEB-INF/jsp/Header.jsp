
<% if (request.getParameter("recover") != null) {
            Integer status = Integer.parseInt(request.getParameter("recover"));
            if (status == 1) {%>
    <script>
        $(document).ready(function(){
            history.go(0);
            window.open("Setting.htm?menu=Setting&action=show_Rcovery","_self");
        });
    </script>
    <%}
    }%>
<!-- Header -->
<div id="mws-header" class="clearfix">

    <!-- Logo Container -->
    <div id="mws-logo-container">
        <img style="margin-top: 20px; margin-left: 20px" src="images/OAS6.png" alt="mws admin" />
        <img style="margin-left: 25px;height: 25px; width: 150px;" src="images/ERP System.png" alt="mws admin" />
        <!-- Logo Wrapper, images put within this wrapper will always be vertically centered -->
        <!--        <div id="mws-logo-wrap">
                    <img src="images/OAS4.png" alt="mws admin" />
                </div>-->
        <!--        <div id="mws-logo-wrap2">
                    <h1 style="margin-bottom: 0px;margin-left: 5px;">ONLINE ACCOUNT SYSTEM</h1>
                    <h6 style="margin-bottom: 0px;margin-left: 9px;">ERP SYSTEM</h6>
                </div>-->

    </div>

  

    <!-- User Tools (notifications, logout, profile, change password) -->
    <div id="mws-user-tools" class="clearfix">
        <!-- Notificationn -->
         <%if (session.getAttribute("User_Type").equals("Admin") == true) {%>
        <%@include file="Common/Tab_Notification.jsp" %>
        <%}%>
        <!-- Messages -->
        <%@include file="Common/Tab_Message.jsp" %>
        <!-- User Information and functions section -->
        <%@include file="Common/Tab_User_Info.jsp" %>
    </div>
</div>
<%@include file="ShortCut.jsp" %>
