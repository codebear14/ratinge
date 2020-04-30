<%--
  Created by IntelliJ IDEA.
  User: satya
  Date: 4/27/2020
  Time: 3:56 AM
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
    html {
        background: url(assets/people-movie.jpg) center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: 0px -70px !important;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
    }
    * {box-sizing: border-box}

    input[type=text], input[type=password] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }

    input[type=text]:focus, input[type=password]:focus {
        background-color: #ddd;
        outline: none;
    }

    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }

    button {
        background-color: #6E79C0;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    button:hover {
        opacity:1;
    }

    .center{
        width: 30%;
        border-radius: 10px;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 16px;
        background-color: rgba(255,255,255,0.9);
    }

</style>

<body>

<jsp:include page="navbar.jsp"/>

<div class="center">
    <form action="LoginServlet" method="post">
        <h2>Login</h2>

        <br/><label><b>Username</b></label><br/>
        <input type="text" placeholder="Enter Username" name="userName" autocomplete="off" required>

        <br/><label><b>Password</b></label><br/>
        <input type="password" placeholder="Enter Password" name="password" autocomplete="off"s required>

        <button type="submit">Sign Up</button>
    </form>

    <span style="color: red;">${error}</span>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>
