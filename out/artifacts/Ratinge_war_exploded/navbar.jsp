<%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/27/2020
  Time: 3:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("user") == null){
        //System.out.println("No User Session running currently");
%>
        <div class="navbar">
            <ul>
                <li><a href="index.jsp">Ratinge</a></li>
                <li style="float:right"><a class="active" href="signup.jsp">Sign Up</a></li>
                <li style="float:right"><a class="active" href="login.jsp">Login</a></li>
            </ul>
        </div>
<%
    }

    else{
        //System.out.println("User Session running currently");
%>
        <div class="navbar">
            <ul>
                <li><a href="index.jsp">Library Catalog</a></li>
                <li style="float:right"><a class="active" href="logout.jsp">Logout</a></li>
                <li style="float:right"><a class="active" href="wishlist.jsp">Wishlist</a></li>
            </ul>
        </div>
<%
    }
%>

