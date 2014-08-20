<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : FronzenAge
Description: A two-column, fixed-width template suitable for business sites and blogs.
Version    : 1.0
Released   : 20071108

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Log in</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script src="../jquery-1.10.2.min.js"></script>
<link href="../style.css" rel="stylesheet" type="text/css" media="screen" />
<script>
    $(document).ready(function() {        
        $("#loginForm").submit(function(e) {
            if($("#usernameLgnInput").val() == "" || $("#passLgnInput").val() == "") {
                e.preventDefault();
                $("#errorMsg").html("Please fill both username and password fields!");
            }
        });
    });
</script>
<!--[if IE]>
<style type="text/css">
#sidebar #calendar {
	background-position: 0px 20px;
}
</style>
<![endif]-->
</head>
<body>
<div id="logo">
    <img alt="logo" src="../images/img11.png" />
    <h1>HondaFone</h1>
</div>
<div id="langBtns">
    <ul>
        <li><a href="/it211030935_DistSys2_Client/en/" ><img src="../images/englishBtn30.png" /></a></li>
        <li><a href="/it211030935_DistSys2_Client/el/" ><img src="../images/greekBtn30.png" /></a></li>
    </ul>
</div>
<div id="menu">
    <ul>
        <li class="first"><a href="index.jsp" accesskey="1" title="Home">Home</a></li>
        <li><a href="news.jsp" accesskey="2" title="News">News</a></li>
        <li><a href="aboutUs.jsp" accesskey="3" title="About Us">About Us</a></li>
        <li class="afterlogin" style="display: none;"><a href="myaccounts.jsp" accesskey="4" title="My Accounts">My Accounts</a></li>
    </ul>
    <div id="logreg">
        <a href="login.jsp">Log-in</a> &nbsp;|&nbsp; <a href="register.jsp">Register</a>
    </div>
</div>
<!-- start page -->
<div id="page">
    <p id="errorMsg"><%= request.getParameter("error") != null ? "Error while logging in. Try again!" : "" %></p>
    <form method="post" action="loginbyWS.jsp" id="loginForm" >
        <table id="lrform">
            <tbody>
                <tr>
                    <td class="rowtitle">Username:</td>
                    <td class="rowinput"><input type="text" name="username" id="usernameLgnInput" value="" /></td>
                </tr>
                <tr>
                    <td class="rowtitle">Password:</td>
                    <td class="rowinput"><input type="password" name="pass" id="passLgnInput" value="" /></td>
                </tr>
                <tr><td colspan="2" id="lrSubTD"><button type="submit" id="lrSub" name="lrSub" >Log in</button></td></tr>
            </tbody>
        </table>
    </form>
</div>
</br></br></br></br></br></br></br></br></br>
<!-- end page -->
<div id="footer">
    <p class="legal">Copyright (c) 2014 hondafone.gr All rights reserved.</p>
    <p class="credit">Designed by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a> + <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a></p>
</div>
</body>
</html>
