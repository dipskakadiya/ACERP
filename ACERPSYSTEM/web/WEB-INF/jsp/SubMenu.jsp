<%
    UST = session.getAttribute("User_Type");
%>


<!-- Sub menu for Account -->
<% if (request.getParameter("menu").equals("Account") == true) {%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(0);
    }
%>

<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_ADD").toString().equals("1")))) {%>
<a class="mws-report" href="Account.htm?action=show&menu=Account&flag=0&id=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-script-add"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Add Account</span>
    </span>
</a>
<%}%>

<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
<a class="mws-report" href="Account.htm?action=show_All&menu=Account&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-storage"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">All Account</span>
    </span>
</a>
<%}%>






<!-- Sub menu for Item -->
<%} else if (request.getParameter("menu").equals("Item") == true) {%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(1);
    }
%>

<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_ADD").toString().equals("1")))) {%>
<a class="mws-report" href="Item.htm?action=show_Cat&menu=Item&flag=0&id=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-award-star-add"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Add Category</span>
    </span>
</a>
<%}%>

<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
<a class="mws-report" href="Item.htm?action=show_CatAll&menu=Item&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-page-white-stack"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">All Category</span>
    </span>
</a>
<%}%>

<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_ADD").toString().equals("1")))) {%>
<a class="mws-report" href="Item.htm?action=show&menu=Item&flag=0&id=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-award-star-add"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Add Item</span>
    </span>
</a>
<%}%>

<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
<a class="mws-report" href="Item.htm?action=show_All&menu=Item&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-page-white-stack"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">All Item</span>
    </span>
</a>
<%}%>







<!-- Sub menu for Trade -->
<%} else if (request.getParameter("menu").equals("Trade") == true) {%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(2);
    }
%>
<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_ADD").toString().equals("1")))) {%>
<a class="mws-report" href="Trade.htm?action=show&menu=Trade&flag=0&id=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-installer-box"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Trading</span>
    </span>
</a>
<%}%>

<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
<a class="mws-report" href="Trade.htm?action=show_All&menu=Trade&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-storage"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">All Trade</span>
    </span>
</a>
<%}%>
<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_ADD").toString().equals("1")))) {%>
<a class="mws-report" href="Trade.htm?action=Item3dtag&menu=Trade&flag=0">
     <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-page-white-stack"></span>
      <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Show Position</span>
    </span>
</a>
<%}%>







<!-- Sub menu for Bank -->
<%} else if (request.getParameter("menu").equals("Bank") == true) {%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(3);
    }
%>
<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_ADD").toString().equals("1")))) {%>
<a class="mws-report" href="Bank.htm?action=show&menu=Bank&flag=0&id=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-computer-link"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Transection</span>
    </span>
</a>
<%}%>

<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
<a class="mws-report" href="Bank.htm?action=show_All&menu=Bank&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-page-white-stack"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">View All</span>
    </span>
</a>
<%}%>









<!-- Sub menu for Cash -->
<%} else if (request.getParameter("menu").equals("Cash") == true) {%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(4);
    }
%>
<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_ADD").toString().equals("1")))) {%>
<a class="mws-report" href="Cash.htm?action=show&menu=Cash&flag=0&id=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-aol-mail"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Transection</span>
    </span>
</a>
<%}%>

<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
<a class="mws-report" href="Cash.htm?action=show_All&menu=Cash&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-storage"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">View All</span>
    </span>
</a>
<%}%>





<!-- Sub menu for JVEntry -->
<%} else if (request.getParameter("menu").equals("S_JvEntry") == true) {%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(5);
    }
%>
<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_ADD").toString().equals("1")))) {%>
<a class="mws-report" href="S_JvEntry.htm?menu=S_JvEntry&flag=0&action=show&id=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-text-align-justity"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Single-Entry</span>
    </span>
</a>
<%}%>

<% if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {%>
<a class="mws-report" href="S_JvEntry.htm?menu=S_JvEntry&flag=0&action=show_All">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-page-white-stack"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">All Single Entry</span>
    </span>
</a>
<%}%>







<!-- Sub menu for Reports -->
<%} else if (request.getParameter("menu").equals("Report") == true) {%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(6);
    }
    if (User_Type.equals("Admin") || (User_Type.equals("User") && (hper.get("P_ADD").toString().equals("1") || hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {
%>
<a class="mws-report" href="Report.htm?menu=Report&action=show">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-storage"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Ledger</span>
    </span>
</a>

<a class="mws-report" href="Report.htm?menu=Report&action=Show_Item_Stock">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-storage"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Item Stock</span>
    </span>
</a>

<a class="mws-report" href="Report.htm?menu=Report&action=show_CReportAll">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-storage"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Custom Reports</span>
    </span>
</a>
<%}%>






<!-- Sub menu for User -->
<%} else if (request.getParameter("menu").equals("User") == true) {%>
<% if (UST.equals("Admin")) {%>
<a class="mws-report" href="User.htm?menu=User&flag=0&action=show">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-vcard-add"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Add User</span>
    </span>
</a>
<a class="mws-report" href="User.htm?menu=User&flag=0&action=show_All">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-page-white-stack"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">All User</span>
    </span>
</a>
<%}%>



<!-- Sub menu for Setting -->
<%} else if (request.getParameter("menu").equals("Setting") == true) {%>
<% if (UST.equals("Admin")) {%>
<a class="mws-report" href="Setting.htm?menu=Setting&flag=0&action=Add_Bank">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-house-link"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Add New Bank</span>
    </span>
</a>
<a class="mws-report" href="Setting.htm?menu=Setting&flag=0&action=Add_Tax">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-text-signature"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Add New Tax</span>
    </span>
</a>
<a class="mws-report" href="Setting.htm?menu=Setting&action=AC_Head&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-database-add"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Account Head</span>
    </span>
</a>
<a class="mws-report" href="Setting.htm?menu=Setting&action=show&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-database-add"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">BackUp</span>
    </span>
</a>
<a class="mws-report" href="Setting.htm?menu=Setting&action=show_Rcovery">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-database-delete"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Recovery</span>
    </span>
</a>
<!--<a class="mws-report" href="Setting.htm?menu=Setting&action=show_Year">
     Statistic Icon (edit to change icon) 
    <span class="mws-report-icon mws-ic ic-script-link"></span>
     Statistic Content 
    <span class="mws-report-content">
        <span class="mws-report-value">Add New Year</span>
    </span>
</a>-->
<%}%>


<!-- Sub menu for Trash -->
<%} else if (request.getParameter("menu").equals("Trash") == true) {%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(7);
    }
    if (User_Type.equals("Admin") || (User_Type.equals("User") && (hper.get("P_ADD").toString().equals("1") || hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {
%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(0);
    }
    if (User_Type.equals("Admin") || (User_Type.equals("User") && (hper.get("P_TRASH").toString().equals("1")))) {
%>
<a class="mws-report" href="Trash.htm?action=show&menu=Trash&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-script-add"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Account</span>
    </span>
</a>
<%}%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(1);
    }
    if (User_Type.equals("Admin") || (User_Type.equals("User") && (hper.get("P_TRASH").toString().equals("1")))) {
%>
<a class="mws-report" href="Trash.htm?action=show_Item&menu=Trash&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-award-star-add"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Item</span>
    </span>
</a>
<%}%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(2);
    }
    if (User_Type.equals("Admin") || (User_Type.equals("User") && (hper.get("P_TRASH").toString().equals("1")))) {
%>
<a class="mws-report" href="Trash.htm?action=show_Trade&menu=Trash&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-installer-box"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Trading</span>
    </span>
</a>
<%}%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(3);
    }
    if (User_Type.equals("Admin") || (User_Type.equals("User") && (hper.get("P_TRASH").toString().equals("1")))) {
%>
<a class="mws-report" href="Trash.htm?action=show_Bank&menu=Trash&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-computer-link"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Bank</span>
    </span>
</a>
<%}%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(4);
    }
    if (User_Type.equals("Admin") || (User_Type.equals("User") && (hper.get("P_TRASH").toString().equals("1")))) {
%>
<a class="mws-report" href="Trash.htm?action=show_Cash&menu=Trash&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-aol-mail"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">Cash</span>
    </span>
</a>
<%}%>
<%
    if (lper != null) {
        hper = (HashMap) lper.get(5);
    }
    if (User_Type.equals("Admin") || (User_Type.equals("User") && (hper.get("P_TRASH").toString().equals("1")))) {
%>
<a class="mws-report" href="Trash.htm?action=show_JVEntry&menu=Trash&flag=0">
    <!-- Statistic Icon (edit to change icon) -->
    <span class="mws-report-icon mws-ic ic-text-align-justity"></span>
    <!-- Statistic Content -->
    <span class="mws-report-content">
        <span class="mws-report-value">JVEntry</span>
    </span>
</a>

<%}
    }
}%>


