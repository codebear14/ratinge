<%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 5/1/2020
  Time: 1:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="services.MySQLDb" %>
<%@ page import="models.Movie" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="models.UserModel" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Comment" %>
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

    .movieList{
        padding-left: 10px;
        padding-right: 10px;
        margin: auto;
        width: 50%;
        text-align: justify;
        margin-bottom: 100px;
        margin-bottom: 100px;
    }

    .movieList .movie h3{
        line-height: 0;
        color: #6E79C0
    }

    .movieList .movie p{
        font-size: 13.5px;
        line-height: 1.8;
    }

    input[type=text], textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-top: 6px;
        margin-bottom: 16px;
        resize: vertical;
    }

    input[type=submit] {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background-color: #45a049;
    }

    .container {
        border-radius: 5px;
        background-color: #f2f2f2;
        padding: 20px;
    }

    .comment{
        font-size: 13.5px;
        line-height: 1.5;
    }

</style>

<body>
    <jsp:include page="navbar.jsp"/>
    <br/>
    <div class="movieList">
        <%
            UserModel user = null;
            MySQLDb db = MySQLDb.createInstance();
            if(request.getParameter("movieId") != null){
                int movieId = Integer.parseInt(request.getParameter("movieId"));
                Movie movie = db.getMovie(movieId);
                DecimalFormat formatter = new DecimalFormat("#,###.00");

                if(movie != null){
        %>
        <div class="movie">
            <h3>
                <%=movie.getTitle()%>
                <span>
                        <a href="wishlist.jsp?movieId=<%=movie.getId()%>"> <img src="assets/wishlist.png" height="18px" width="18px"/> </a>
                    </span>
            </h3>
            <p>
                <span style="color: goldenrod; font-size: 15px;">&bigstar;</span> <%=String.format("%.1f",movie.getRating())%> <b>|</b> <%=movie.getRunningTime()%> <b>|</b> <%=movie.getGenres()%>
                <br/><%=movie.getPlot()%>
                <br/><b>Directors:</b> <%=movie.getDirectors()%>
                <br/><b>Writers:</b> <%=movie.getDirectors()%>
                <br/><b>Cast:</b> <%=movie.getCast()%>
                <br/><b>Gross Income:</b> $<%=formatter.format(movie.getGrossIncome())%>
            </p>
        </div>

        <div class="container">
            <form action="CommentServlet" method="post">
                <input type="hidden" name="movieId" value="<%=movieId%>"/>
                <%
                    if(session.getAttribute("user") != null){
                        user = (UserModel) session.getAttribute("user");
                %>
                        <input type="hidden" name="userId" value="<%=user.getUserId()%>"/>
                        <input type="hidden" name="userName" value="<%=user.getName()%>"/>
                <%
                    }
                %>

                <textarea id="subject" name="comment" placeholder="Write something.." style="height:100px"></textarea>
                <input type="submit" value="Submit">
                <span>${message}</span>
            </form>
        </div>
        <hr/>
        <h2 style="color: #575756">What other's think about it?</h2>

        <div class="comment">

            <%
                List<Comment> comments = db.getComments(movieId);
                for(Comment comment : comments){
            %>
            <p>
                <b><%=comment.getUserFullName()%></b>(<%=comment.getUserName()%>) | <i><%=comment.getDateTime()%></i>
                <span style="font-size: 20px"><br/><%=comment.getComment()%></span>
            </p>
            <%
                    //System.out.println(comment.getUserFullName() + " : " + comment.getUserName() + " : " + comment.getComment() + " : " + comment.getDateTime());
                }
            %>

        </div>
        <%      }
            }
        %>


    </div>

    <jsp:include page="footer.jsp"/>

</body>
</html>
