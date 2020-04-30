<%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/29/2020
  Time: 6:42 AM
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
    <h2 style="color: #575756">Coming soon to theaters near you</h2>
    <%
        MySQLDb db = MySQLDb.createInstance();
        String qFetchComingMovies = "SELECT * FROM ratinge.movies WHERE gross_income = 0 AND movie_rating = 0";
        List<Movie> movies = db.getMovies(qFetchComingMovies);
        pageContext.setAttribute("listOfComingMovies", movies);
    %>
    <c:forEach items="${listOfComingMovies}" var="movie">
        <div class="movie">
            <hr/>
            <h3>
                ${movie.getTitle()}
                <span>
                    <a href="wishlist.jsp?movieId=${movie.getId()}"> <img src="assets/wishlist.png" height="18px" width="18px"/> </a>
                </span>
            </h3>
            <p>
                ${movie.getGenres()}
                <br/>${movie.getPlot()}
                <br/><b>Directors:</b> ${movie.getDirectors()}
                <br/><b>Writers:</b> ${movie.getWriters()}
                <br/><b>Cast:</b> ${movie.getCast()}
            </p>
        </div>
    </c:forEach>

</div>


<jsp:include page="footer.jsp"/>

</body>
</html>

