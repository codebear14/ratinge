<%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/27/2020
  Time: 3:29 AM
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
    .alert {
        padding: 20px;
        background-color: #f1a73d;
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
</style>

<body>

    <jsp:include page="navbar.jsp"/>

    <br/>

    <div class="search__container">
        <p class="search__title">
            &nbsp;Search a Movie Title
        </p>
        <form action="SearchMovieServlet" method="post">
            <input class="search__input" type="text" placeholder="Search" name="movieTitle" autocomplete="off">
        </form>
        <span style="color: red;">${error}</span>
    </div>

    <div class="cards">
        <div class="card">
            <img class="card__image" src="assets/top.jpg">
            <div class="card__content">
                <h3><a href="top.jsp" style="text-decoration: none; color: #111111">Top Rated Movies</a></h3>
            </div>
        </div>

        <div class="card">
            <img class="card__image" src="assets/dollar.jpg">
            <div class="card__content">
                <h3><a href="boxoffice.jsp" style="text-decoration: none; color: #111111">Top Box Office</a></h3>
            </div>
        </div>

        <div class="card">
            <img class="card__image" src="assets/mask.jpg">
            <div class="card__content">
                <h3><a href="browse-genres.jsp" style="text-decoration: none; color: #111111">Browse by Genre</a></h3>
            </div>
        </div>

        <div class="card">
            <img class="card__image" src="assets/coming-soon.jpg">
            <div class="card__content">
                <h3><a href="coming.jsp" style="text-decoration: none; color: #111111">Coming Soon</a></h3>
            </div>
        </div>

    </div>
    <jsp:include page="footer.jsp"/>

</body>
</html>
