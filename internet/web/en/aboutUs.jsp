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
<title>About Hondafone</title>
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
<!-- start page -->
<div id="page">
    <div class="post">
        <h2 class="title">About us</h2>
        <div class="entry">
            <h3>About our company</h3>
            <p>The Hondafone company, was enstablished in 2014 from : G. Vasalos, S. Fafalios and C. Dragonakis.   It is a mobile phone company, that spends most of it's resources for the mass production and provision of the pioneering invention "Motorbike-cellphone".</p>
            <p><i>Activities</i> :</br>
            We economically support non-profit organisations such as: "Save the dragons of middle earth: Stop the killing", "Anomimous", "Hunt down the unicorns" etc. </br>
We have also supported non-governental activities like: "Free Obama bin Landen" which failed and the successful "Kill The Kennedys".</br>
    Furthermore Hondafone is the founder of the Greek nonprofit M.K.O(ΜΠΙΖΝΕΣ ΚΑΛΑ ΟΡΓΑΝΩΜΕΝΗ) in english: (BUSINESS WELL REGULATED).
    For more information about the activities, please contact us at: 2310-52-1010.24/24</p>
            <p><i>Where you will find us(stores)</i> :</br>
            Information technology building, 2nd floor lab from 11:00 to 20:00. Address: Homer 9 Taurus</br></br>
            
     Shisha coffee 21:00 - 07:00. Address: Nea Smyrna Squares</br></br>
     
     Canteen Harokopio University 12:00 to 16:00. Address: Theseus (Eleftherios Venizelos) 70 Kallithea</br></br>

    Omonia Branch 13:00 to 19:00. Address: 128 University, Omonia </br></br>
</p>
            <p><i>Comunication</i> :</br>
            email : hondafonedist@gmail.com</br>
phone : 699-102-100-3α</br>
    Contact hours : 03:00-06:30</p>
        </div>
        <p class="meta">
If you want to keep up with the news of Hondafone make a <a href="newsletterReg.jsp">registration</a> to our newsletter!</p>
    </div>
</div>
<!-- end page -->
<div id="footer">
    <p class="legal">Copyright (c) 2014 hondafone.gr All rights reserved.</p>
    <p class="credit">Designed by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a> + <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a></p>
</div>
</body>
</html>


