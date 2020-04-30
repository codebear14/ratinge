<%@ page import="services.MySQLDb" %>
<%@ page import="models.Movie" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/30/2020
  Time: 9:42 AM
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

    .movieList{
        padding-left: 10px;
        padding-right: 10px;
        margin: auto;
        width: 50%;
        text-align: justify;
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

</style>

<body>

    <jsp:include page="sessionCheckAdmin.jsp"/>
    <jsp:include page="navbar.jsp"/>
    <br/>
    <div class="movieList">
        <h1>Edit Ratings</h1>
    <%
        if(request.getParameter("movieId") != null){
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            MySQLDb db = MySQLDb.createInstance();
            Movie movie = db.getMovie(movieId);
            DecimalFormat formatter = new DecimalFormat("#,###.00");

            if(movie != null){
    %>
            <div class="movie">
                <hr/>
                <h3>
                    <%=movie.getTitle()%>
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

            <form action="#" method="post">
                <label><b>New Rating : </b></label>
                <input type="hidden" name="movieId" value="<%=movie.getId()%>"/>
                <input type="text" type="number" required name="newRating" pattern="^\d*(\.\d{0,2})?$" max="10" min="0" autocomplete="off" style="padding: 2px" size="2"/>
                <span>
                    <img src="assets/enter.png" height="18px" width="18px"/>
                </span>

            </form>

    <%      }
        }
    %>

    </div>

</body>
</html>
