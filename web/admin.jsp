<%@ page import="models.UserModel" %>
<%@ page import="models.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/30/2020
  Time: 6:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ratinge</title>
    <link rel="stylesheet" type="text/css" href="ratinge.css">
    <link rel="stylesheet" type="text/css" href="navbar.css">
    <link rel="stylesheet" type="text/css" href="footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
</head>

<style>

    .adminScreen{
        padding: 0px 20px 0px 20px;
    }

    .alert {
        padding: 20px;
        background-color: #e04c29;
        color: white;
    }

    .closebtn {
        margin-left: 15px;
        color: white;
        font-weight: bold;
        float: right;
        font-size: 22px;
        line-height: 20px;
        cursor: pointer;
        transition: 0.3s;
    }

    .closebtn:hover {
        color: black;
    }

    .button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
    }

    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    tr:hover {background-color:#f5f5f5;}

</style>

<body>

    <jsp:include page="sessionCheckAdmin.jsp"/>
    <jsp:include page="navbar.jsp"/>

    <br/>
    <div class="adminScreen">

        <h1>Howdy, Admin?</h1>
        <div class="alert">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Please perform all actions with caution!</strong>.
        </div>

        <form action="GetXMLRatingsServlet" method="post">
            <input class="button" type="submit" value="Change Movie Rating"/>
        </form>

        <table>
            <tr>
                <th>Sr. No</th>
                <th>Name</th>
                <th>Rating</th>
                <th>Action</th>
            </tr>
            <%
                if(request.getAttribute("listOfMoviesXML") != null){
                    List<Movie> listmv = (ArrayList)request.getAttribute("listOfMoviesXML");
                    ListIterator<Movie> iterator = listmv.listIterator();
                    DecimalFormat formatter = new DecimalFormat("#,###.0");
                    int i=0;
                    while(iterator.hasNext())
                    {
                        Movie mv=iterator.next();
            %>
                    <tr>
                        <td><%=++i%></td>
                        <td><%= mv.getTitle()%></td>
                        <%
                            if(mv.getRating() == 0){
                        %>
                                <td>0</td>
                        <%
                            }
                            else{
                        %>
                                <td>
                                    <%= formatter.format(mv.getRating())%>
                                </td>
                        <%
                            }
                        %>
                        <td>
                            <span>
                                <a href="editRating.jsp?movieId=<%=mv.getId()%>"> <img src="assets/edit.png" height="18px" width="18px"/> </a>
                            </span>
                        </td>
                    </tr>
            <%
                    }
                }
            %>

        </table>

    </div>

</body>
</html>
