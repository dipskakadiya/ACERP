<%-- 
    Document   : Logout
    Created on : Mar 9, 2012, 12:41:12 AM
    Author     : sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
          session.invalidate();
          response.sendRedirect("index.htm?action=show");


%>
    </body>
</html>
