<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- File call for css and jquery -->
        <%@include file="Css_Jq.jsp" %>
        <title>ERP - Item</title>
    </head>

    <body>
        <div id="outer-main" class="main">
            <div id="main" class="main">
                <!-- File call for Theamer -->
                <!-- File call for Header -->
                <%@include file="Header.jsp" %>

                <!-- Start Main Wrapper -->
                <div id="mws-wrapper">

                    <!-- File call for Header -->
                    <%@include file="Menu.jsp" %>

                    <!-- Main Container Start -->
                    <div id="mws-container" class="clearfix">

                        <!-- Inner Container Start -->
                        <div class="container">

                            <!-- Panels Start -->
                            <%
                                if (lper != null) {
                                    hper = (HashMap) lper.get(1);
                                }

                                UST = session.getAttribute("User_Type");
                                if (UST.equals("Admin") || (UST.equals("User") && (hper.get("P_UPDATE").toString().equals("1") || hper.get("P_DELETE").toString().equals("1") || hper.get("P_VIEW").toString().equals("1")))) {
                            %>
                            <%@include file="SubMenu.jsp" %>
                            <%@include file="Client/Tab_View_Item.jsp" %>
                            <%}else{%>
                            <%@include file="Client/permission_Denite.jsp" %>
                            <%}%>

                        </div>

                        <!-- Panels End -->

                    </div>
                    <!-- Inner Container End -->

                    <!-- Footer -->
                    <%@include file="Footer.jsp" %>

                </div>
                <!-- Main Container End -->

            </div>
        </div>
    </body>

</html>





