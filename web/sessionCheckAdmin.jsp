<%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/30/2020
  Time: 6:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String error = "Please log in using admin credentials";
    String redirect = "login.jsp";
    if(session.getAttribute("admin") == null){
        request.setAttribute("error",error);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(redirect);
        requestDispatcher.forward(request, response);
    }
%>

