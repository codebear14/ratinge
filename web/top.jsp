<%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/29/2020
  Time: 5:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="models.Movie" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="services.MySQLDb" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Ratinge</title>
    <link rel="stylesheet" type="text/css" href="ratinge.css">
    <link rel="stylesheet" type="text/css" href="navbar.css">
    <link rel="stylesheet" type="text/css" href="footer.css">
</head>

<style>

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

    <jsp:include page="navbar.jsp"/>

    <br/>

    <div class="movieList">
        <h2 style="color: #575756">Top 25 Rated Movies</h2>
    <%
        MySQLDb db = MySQLDb.createInstance();
        String qFetchTopMovies = "SELECT * FROM ratinge.movies m, ratinge.top_rated t WHERE t.movie_id=m.movie_id ORDER BY t.top_id";
        List<Movie> movies = db.getMovies(qFetchTopMovies);
        pageContext.setAttribute("listOfTopMovies", movies);
    %>
        <c:forEach items="${listOfTopMovies}" var="movie">
            <div class="movie">
                <hr/>
                <h3>
                    ${movie.getTitle()}
                    <span>
                    <a href="wishlist.jsp?movieId=${movie.getId()}"> <img src="assets/wishlist.png" height="18px" width="18px"/> </a>
                </span>
                </h3>
                <p>
                    <span style="color: goldenrod; font-size: 15px;">&bigstar;</span> <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="1" value="${movie.getRating()}"/> <b>|</b> ${movie.getRunningTime()} <b>|</b> ${movie.getGenres()}
                    <br/>${movie.getPlot()}
                    <br/><b>Directors:</b> ${movie.getDirectors()}
                    <br/><b>Writers:</b> ${movie.getWriters()}
                    <br/><b>Cast:</b> ${movie.getCast()}
                    <br/><b>Gross Income:</b> <fmt:formatNumber maxFractionDigits="0" value = "${movie.getGrossIncome()}" type = "currency"/>
                </p>
            </div>
        </c:forEach>

    </div>


    <jsp:include page="footer.jsp"/>

</body>
</html>
