
<%if (request.getParameter("action").equals("Item3dtagsave") == true) {%>
<%out.print(request.getAttribute("id"));%>
<%}else{%>
<%out.print("Deleted Successfully");%>
<%}%>