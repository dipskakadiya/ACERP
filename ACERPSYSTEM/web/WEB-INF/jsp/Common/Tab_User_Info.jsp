
<div id="mws-user-info" class="mws-inset">
    <!-- Username and Functions -->
    <div id="mws-user-functions">
        <div id="mws-username"mws style="font-size: 18px;">
            Hello, <% out.print(session.getAttribute("User_Id"));%>
            <ul id="icons-16">
                <a href="User_Detail.htm?menu=User_Detail&flag=0&action=show"><li  class="mws-ic ic-user-red" title="User Profile"></li></a>
                <%if (session.getAttribute("User_Type").equals("Admin") == true) {%>
                     <%if(Integer.parseInt(session.getAttribute("demo").toString())==1){%>
                     <a href="Company_Detail.htm?menu=Company_Detail&flag=0&action=show"><li class="mws-ic ic-building-edit" title="Company Profile"></li></a>
                     <%}%>
                     <a href="Setting.htm?menu=Setting&flag=0&action=Add_Bank"><li  class="mws-ic ic-setting-tools" title="Setting"></li></a>
                <%}%>
                <a href="Send_Mail.htm?menu=Send_Mail&flag=0&action=show"><li  class="mws-ic ic-email-go" title="Send Mail"></li></a>
                <%if (session.getAttribute("User_Type").equals("S_Admin") != true) {%>
                <a href="Help.htm?menu=Help&action=show&flag=0"><li  class="mws-ic ic-help" title="Help"></li></a>
                <%}%>
                <a href="Chang_Password.htm?menu=Chang_Password&flag=0&action=show"><li  class="mws-ic ic-key" title="Password Change"></li></a>
                <a href="Login.htm?menu=Login&action=logout"><li class="mws-ic ic-lock" title="Log Out"></li></a>
            </ul>
        </div>
        <div id="mws-user-photo">
            <img src="images/profile/<% if (session.getAttribute("Image") != null) {
                    out.print(session.getAttribute("User_count"));
                    out.print(session.getAttribute("Image"));
                 }%>" alt="User Photo" />
        </div>
    </div>
    <!-- User Photo -->

</div>