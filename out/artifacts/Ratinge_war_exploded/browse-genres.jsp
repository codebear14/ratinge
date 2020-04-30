<%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/29/2020
  Time: 6:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ratinge</title>
    <link rel="stylesheet" type="text/css" href="ratinge.css">
    <link rel="stylesheet" type="text/css" href="navbar.css">
    <link rel="stylesheet" type="text/css" href="footer.css">
</head>

<style>

    .center{
        margin: auto;
        width: 50%;
        margin-bottom: 100px;
    }

    .column {
        float: left;
        width: 30%;
        padding: 0 10px;
    }

    .row {
        margin: 0 -5px;
        padding: 20px;
    }

    .row:after {
        content: "";
        display: table;
        clear: both;
    }

    @media screen and (max-width: 600px) {
        .column {
            width: 100%;
            display: block;
            margin-bottom: 20px;
        }
    }

    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        padding: 15px;
        text-align: center;
        background-color: #ff4d4d;
    }
</style>

<body>

    <jsp:include page="navbar.jsp"/>

    <br/>
    <div class="center">
        <h2 style="padding: 20px;color: #575756;">Browse By Genre</h2>
        <div class="row">
            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Drama" style="text-decoration: none; color: #fff">Drama</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Crime" style="text-decoration: none; color: #fff">Crime</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Action" style="text-decoration: none; color: #fff">Action</a></h3>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Biography" style="text-decoration: none; color: #fff">Biography</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=History" style="text-decoration: none; color: #fff">History</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Adventure" style="text-decoration: none; color: #fff">Adventure</a></h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Fantasy" style="text-decoration: none; color: #fff">Fantasy</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Western" style="text-decoration: none; color: #fff">Western</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=War" style="text-decoration: none; color: #fff">War</a></h3>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Mystery" style="text-decoration: none; color: #fff">Mystery</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Comedy" style="text-decoration: none; color: #fff">Comedy</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Romance" style="text-decoration: none; color: #fff">Romance</a></h3>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Horror" style="text-decoration: none; color: #fff">Horror</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Animation" style="text-decoration: none; color: #fff">Animation</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Family" style="text-decoration: none; color: #fff">Family</a></h3>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Thriller" style="text-decoration: none; color: #fff">Thriller</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Music" style="text-decoration: none; color: #fff">Music</a></h3>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <h3><a href="genres.jsp?genreType=Film-Noir" style="text-decoration: none; color: #fff">Film-Noir</a></h3>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"/>

</body>
</html>
