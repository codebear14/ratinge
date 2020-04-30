<%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/30/2020
  Time: 12:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String error = "This action requires you to log in";
    String redirect = "login.jsp";
    if(session.getAttribute("user") == null){
        request.setAttribute("error",error);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(redirect);
        requestDispatcher.forward(request, response);
    }
%>
