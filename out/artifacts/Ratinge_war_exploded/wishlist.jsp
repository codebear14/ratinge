<%@ page import="models.UserModel" %>
<%@ page import="services.MySQLDb" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Movie" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/30/2020
  Time: 12:11 AM
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

    .user{
        padding: 0px 20px 0px 20px ;
    }

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

    <jsp:include page="sessionCheck.jsp"/>
    <jsp:include page="navbar.jsp"/>
    <br/>

    <%
        String message = "";
        UserModel user = (UserModel) session.getAttribute("user");
        int userId = user.getUserId();
        MySQLDb db = MySQLDb.createInstance();

        if(request.getParameter("movieId") != null){
            int movie_id = Integer.parseInt(request.getParameter("movieId"));

            int movieWishlisted = db.wishlistMovie(userId, movie_id);

            if(movieWishlisted == 1){
               message = "Added a new movie to your wishlist";
            }
            else if (movieWishlisted == 2){
                message = "Movie already present in your wishlist";
            }
            else{
                message = "Cannot add movie to your wishlist";
            }
        }
    %>

    <div class="user">
        <h1>Hello, <%=user.getName()%></h1>
        <%
            if(!message.equals("")){
        %>
            <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                <strong>Message!</strong> <%=message%>.
            </div>
        <%
            }
        %>
    </div>

    <div class="movieList">
        <h2 style="color: #575756">Wishlisted Movies</h2>
        <%
            List<Movie> wishlistedMovies = db.getWishListedMovies(userId);
            DecimalFormat formatter = new DecimalFormat("#,###.00");
            for(Movie movie: wishlistedMovies){
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
                        <br/><b>Gross Income:</b> $<%=formatter.format(movie.getGrossIncome())%> <b>|</b> <a href="comments.jsp?movieId=<%=movie.getId()%>">Comments</a>
                    </p>
                </div>
        <%
            }
        %>

    <jsp:include page="footer.jsp"/>

</body>
</html>
