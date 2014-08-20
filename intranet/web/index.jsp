<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- remove session variables to start a new session -->
<c:remove var="user" scope="session" />
<c:remove var="searchedClient" scope="session" />

<jsp:useBean id="DBconnection" class="database.DBconnection" scope="request" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="style/main.css" />
        <script src="jquery-1.10.2.min.js"></script>
        <script>
            $("document").ready(function() {
                
                /*!!!!!FOR INTERNET APP!!!!!*/
                if(<%= request.getParameter("pass") != null %>) { //show password when clients registers
                    alert("Successful registration! Password: "+"<%= request.getParameter("pass") %>");
                }
                
            });
        </script>
        <title>Login</title>
    </head>
    <body>
        <div id="wrapper">
            <p id="test"></p>
            <h1 align="center">Log In</h1>
            <%= (request.getParameter("wrong") != null)?"<p align=\"center\">Wrong password! Please try again</p>":"" %>
            <br>
            <br>
            <form align="center" action="checkLogin.jsp" method="POST">
                Password:<input type="password" name="pwd"/><br>
                <input type="submit" id="loginBtn" name="submitLogin" value="Log In"/>
                <!-- !!!!!FOR INTERNET APP!!!!! register link for client
                &nbsp or &nbsp
                register client for internet app
                <a href="register.jsp" id="registerLink">Register</a>
                -->
            </form>
        </div>
    </body>
</html>
