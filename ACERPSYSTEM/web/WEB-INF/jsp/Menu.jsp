<%@page import="java.util.ArrayList"%>
<!-- Necessary markup, do not remove -->
<div id="mws-sidebar-stitch"></div>
<div id="mws-sidebar-bg"></div>

<!-- Sidebar Wrapper -->
<div id="mws-sidebar">
    <% List lper = (List) request.getAttribute("Dataper");
        HashMap hper = null;
Object UST=null;
    %>
    <!-- Main Navigation -->
    <div id="mws-navigation">
        <ul>
            <%  Object User_Type = session.getAttribute("User_Type");
                if (User_Type.equals("S_Admin") == true) {%>

            <li <% if (request.getParameter("menu").equals("Dashboard") == true) {
                    out.println("class='active'");
                }%>><a href="Admin_Dashboard.htm?menu=Dashboard&action=show" class="mws-ic ic-house">Dashboard</a></li>

            <li <% if (request.getParameter("menu").equals("Structure") == true) {
                    out.println("class='active'");
                }%>><a href="Structure.htm?menu=Structure&action=show" class="mws-ic ic-house">Structure</a></li>


            <li <% if (request.getParameter("menu").equals("Request") == true) {
                    out.println("class='active'");
                }%>><a href="Request.htm?menu=Request&flag=0&action=show" class="mws-i-24 i-list">Request</a></li>

            <li <% if (request.getParameter("menu").equals("Blog") == true) {
                    out.println("class='active'");
                }%>><a href="Blog.htm?menu=Blog&flag=0&action=show" class="mws-ic ic-email-edit">Blog</a></li>

            <li <% if (request.getParameter("menu").equals("Block") == true) {
                    out.println("class='active'");
                }%>><a href="Block.htm?menu=Block&action=show&flag=0" class="mws-ic ic-group-gear">Block</a></li>

            <li <% if (request.getParameter("menu").equals("Responce_For_Help") == true) {
                    out.println("class='active'");
                }%>><a href="Help_Response.htm?menu=Help_Response&action=show" class="mws-ic ic-user-comment">Help Response</a></li>

            <li <% if (request.getParameter("menu").equals("All_Company_Info") == true) {
                    out.println("class='active'");
                }%>><a href="All_Company_Info.htm?menu=All_Company_Info&flag=0&action=show" class="mws-ic ic-reseller-programm">All Company Info</a></li>

            <% } else {
                if (User_Type.equals("Admin") || User_Type.equals("User")) {%>
            
                <li <% if (request.getParameter("menu").equals("Dashboard") == true) {
                    out.println("class='active'");
                }%>><a href="Dashboard.htm?menu=Dashboard&action=show" class="mws-ic ic-color-wheel">Dashboard</a></li>
          
                
                
                <%}
                if (lper != null) {
                    hper = (HashMap) lper.get(0);
                }
                if (User_Type.equals("Admin") || (User_Type.equals("User")&&(hper.get("P_ADD").toString().equals("1") || hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
           
                <li <% if (request.getParameter("menu").equals("Account") == true) {
                    out.println("class='active'");
                }%>><a href="<%if (User_Type.equals("Admin") || (User_Type.equals("User") && hper.get("P_ADD").toString().equals("1"))) {%>Account.htm?menu=Account&flag=0&action=show&id=0<%}else{%>Account.htm?action=show_All&menu=Account&flag=0<%}%>" class="mws-ic ic-billiard-marker">Account</a></li>
            
                
                
                
                
                <%}
                if (lper != null) {
                    hper = (HashMap) lper.get(1);
                }
                if (User_Type.equals("Admin") || (User_Type.equals("User")&&(hper.get("P_ADD").toString().equals("1") || hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>

            <li <% if (request.getParameter("menu").equals("Item") == true) {
                    out.println("class='active'");
                }%>><a href="<%if (User_Type.equals("Admin") || (User_Type.equals("User") && hper.get("P_ADD").toString().equals("1"))) {%>Item.htm?menu=Item&flag=0&action=show_Cat&id=0<%}else{%>Item.htm?action=show_CatAll&menu=Item&flag=0<%}%>" class="mws-ic ic-award-star-bronze-2">Item</a></li>
            
            
            
            
            <%}
                if (lper != null) {
                    hper = (HashMap) lper.get(2);
                }
                if (User_Type.equals("Admin") || (User_Type.equals("User")&&(hper.get("P_ADD").toString().equals("1") || hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>

            <li <% if (request.getParameter("menu").equals("Trade") == true) {
                    out.println("class='active'");
                }%>><a href="<%if (User_Type.equals("Admin") || (User_Type.equals("User") && hper.get("P_ADD").toString().equals("1"))) {%>Trade.htm?menu=Trade&flag=0&action=show&id=0<%}else{%>Trade.htm?action=show_All&menu=Trade&flag=0<%}%>" class="mws-ic ic-basket-put">Trade</a></li>

            
            
            
            
            <%}
                if (lper != null) {
                    hper = (HashMap) lper.get(3);
                }
                if (User_Type.equals("Admin") || (User_Type.equals("User")&&(hper.get("P_ADD").toString().equals("1") || hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
            <li <% if (request.getParameter("menu").equals("Bank") == true) {
                    out.println("class='active'");
                }%>><a href="<%if (User_Type.equals("Admin") || (User_Type.equals("User") && hper.get("P_ADD").toString().equals("1"))) {%>Bank.htm?menu=Bank&flag=0&action=show&id=0<%}else{%>Bank.htm?action=show_All&menu=Bank&flag=0<%}%>" class="mws-ic ic-house-link">Bank Transection</a></li>

            
            
            
            <%}
                if (lper != null) {
                    hper = (HashMap) lper.get(4);
                }
                if (User_Type.equals("Admin") || (User_Type.equals("User")&&(hper.get("P_ADD").toString().equals("1") || hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
            <li <% if (request.getParameter("menu").equals("Cash") == true) {
                    out.println("class='active'");
                }%>><a href="<%if (User_Type.equals("Admin") || (User_Type.equals("User") && hper.get("P_ADD").toString().equals("1"))) {%>Cash.htm?menu=Cash&flag=0&action=show&id=0<%}else{%>Cash.htm?action=show_All&menu=Cash&flag=0<%}%>" class="mws-ic mws-ic ic-money-bag">Cash Transection</a></li>

            
            
            
            
            <%}
                if (User_Type.equals("Admin") || (User_Type.equals("User"))) {%>
            <li <% if (request.getParameter("menu").equals("Currency") == true) {
                    out.println("class='active'");
                }%>><a href="Currency.htm?menu=Currency&flag=0&action=show" class="mws-ic ic-coins">Currency</a></li>

            
            
            
            <%}
                if (lper != null) {
                    hper = (HashMap) lper.get(5);
                }
                if (User_Type.equals("Admin") || (User_Type.equals("User")&&(hper.get("P_ADD").toString().equals("1") || hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
            <li <% if (request.getParameter("menu").equals("S_JvEntry") == true) {
                    out.println("class='active'");
                }%> ><a href="<%if (User_Type.equals("Admin") || (User_Type.equals("User") && hper.get("P_ADD").toString().equals("1"))) {%>S_JvEntry.htm?menu=S_JvEntry&flag=0&action=show&id=0<%}else{%>S_JvEntry.htm?menu=S_JvEntry&flag=0&action=show_All<%}%>" class="mws-ic ic-price-comparison">Jv Entry</a>
            </li>

            
            
            
            
            <%}
                if (lper != null) {
                    hper = (HashMap) lper.get(6);
                }
                if (User_Type.equals("Admin") || (User_Type.equals("User")&&(hper.get("P_ADD").toString().equals("1") || hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
            <li <% if (request.getParameter("menu").equals("Report") == true) {
                    out.println("class='active'");
                }%>><a href="Report.htm?menu=Report&action=show" class="mws-ic mws-ic ic-report">Reports</a></li>

            
            
            
            <%}
                if (User_Type.equals("Admin") && Integer.parseInt(session.getAttribute("demo").toString())==1) {%>
            <li <% if (request.getParameter("menu").equals("User") == true) {
                    out.println("class='active'");
                }%>><a href="User.htm?menu=User&flag=0&action=show" class="mws-ic ic-group">Users</a></li>

            
            
            
            
            <%}
                if (lper != null) {
                    hper = (HashMap) lper.get(7);
                }
                if (User_Type.equals("Admin") || (User_Type.equals("User")&&(hper.get("P_ADD").toString().equals("1") || hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
            <li <% if (request.getParameter("menu").equals("Trash") == true) {
                    out.println("class='active'");
                }%>><a href="Trash.htm?menu=Trash&flag=0&action=show" class="mws-ic ic-group">Trash</a></li>

            <%}
                }%>
        </ul>
    </div>
</div>
