<jsp:useBean id="sessionInfo" class="misc.SessionInfo" scope="session" />
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
<title>Hondafone News</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script src="../jquery-1.10.2.min.js"></script>
<link href="../style.css" rel="stylesheet" type="text/css" media="screen" />
<script>
    $(document).ready(function() {
        if(<%= !sessionInfo.getClientInfo().isEmpty() %>) {
            $(".afterlogin").css("display", "inline");
            $("#logreg").html('<a id="profile_name"><%= !sessionInfo.getClientInfo().isEmpty() ? sessionInfo.getClientInfo().get(0) : "" %></a><div id="profile_details"><% 
                    if(!sessionInfo.getClientInfo().isEmpty()) { //check is needed again because this code is executed in the server
                        out.print("Username: " + sessionInfo.getClientInfo().get(0));
                        out.print("</br>First name: " + sessionInfo.getClientInfo().get(2));
                        out.print("</br>Last name: " + sessionInfo.getClientInfo().get(3));
                        out.print("</br>Birth date: " + sessionInfo.getClientInfo().get(4));
                        out.print("</br>AFM: " + sessionInfo.getClientInfo().get(9));
                        out.print("</br>Bank account: " + sessionInfo.getClientInfo().get(10));
                    }
                %></div> | <a href="logout.jsp">Log out</a>');
        }
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
<hr />
<div id="banner"><img src="../images/img04.jpg" alt="" width="960" /></div>
<!-- start page -->
<div id="page">
    <div class="post">
        <h2 class="title">Hondafone 2every1</h2>
        <div class="entry">
            <h3>New Hondafone Contract Plans that release the communication to all the networks!</h3>
            <p>The new Hondafone programs offer more minutes to all networks to talk freely and SMS more</p>

            <p>2every1 200: 35&euro;, 200 'to all networks, 10 SMS to all</br>
                2every1 400: 55&euro;, 400 'to all networks, 30 SMS to all</p>
        </div>
        <p class="meta">Posted on January 17, 2014 </p>
    </div>
    <div class="post">
        <h2 class="title">Hondafone charity</h2>
        <div class="entry">
            <h3>We save the dragons of Middle Earth!</h3>
            <p>HONDAFONE continues to be actively against the disappearance of the dragons of Middle Earth. You too can help by donating to any HONDAFONE store. For more information Subscribe to our mail service and we will inform you electronically by email</p>
        </div>
        <p class="meta">Posted on January 17, 2014 </p>
    </div>
    <div class="post">
        <h2 class="title">Hondafone motorbike-cellphone</h2>
        <div class="entry">
            <h3>Make yours one of the brand new motorbike-cellphone!</h3>
            <p>Be the first to buy the new Hondafone technology machine-Mobile with any Honda model&reg;and integrated electronics for speaking while driving without discomforts with prices from 700&euro;</p>
        </div>
        <p class="meta">Posted on January 17, 2014 </p>
    </div>
    <div class="post">
        <h2 class="title">Hondafone stuff</h2>
        <div class="entry">
            <h3>Move your account to Hondafone and win stuff and shit!</h3>
            <p>
Cum to  HONDAFONE, by moving your account(portability) or by logging-in online and win:   
</p>

            <p>&nbsp;&nbsp;&nbsp;up to 50% off fee</br>

           or alternatively</br>

    &nbsp;&nbsp;&nbsp;to 20% discount on an innovative motorbike-cellphone from the collection HONDAFONE SCOOTERS</p>
        </div>
        <p class="meta">Posted on January 17, 2014 </p>
    </div>
    <div class="post">
        <h2 class="title">HONDAFONE + Intenet</h2>
        <div class="entry">
            <h3>Enjoy internet services in your travels!</h3>
            <p>Cum into a store and HONDAFONE will get you an antenna for 3G internet to surf undisturbed or disturbed even while traveling with your mobiles unlimited power-on 25&euro;/month. The antenna is compatible with all models of motorbike-cellphone</p>
        </div>
        <p class="meta">Posted on January 17, 2014 </p>
    </div>
</div>
<!-- end page -->
<div id="footer">
    <p class="legal">Copyright (c) 2014 hondafone.gr All rights reserved.</p>
    <p class="credit">Designed by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a> + <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a></p>
</div>
</body>
</html>


