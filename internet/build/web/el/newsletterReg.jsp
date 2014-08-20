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
<title>Εγγραφείτε για τα νέα μας</title>
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
                        out.print("Όνομα χρήστη: " + sessionInfo.getClientInfo().get(0));
                        out.print("</br>Όνομα: " + sessionInfo.getClientInfo().get(2));
                        out.print("</br>Επίθετο: " + sessionInfo.getClientInfo().get(3));
                        out.print("</br>Ημερομηνία γένησης: " + sessionInfo.getClientInfo().get(4));
                        out.print("</br>ΑΦΜ: " + sessionInfo.getClientInfo().get(9));
                        out.print("</br>Τραπεζικός λογαριασμός: " + sessionInfo.getClientInfo().get(10));
                    }
                %></div> | <a href="logout.jsp">Έξοδος</a>');
        }
        
        $("#registerForm").submit(function(e) {
            if($("#fnameReg").val() == "" || $("#lnameReg").val() == "") { //doesn't need email check. html5 does it for us
                e.preventDefault();
                $("#errorMsg").html("Παρακαλώ εισάγετε όλα τα πεδία!");
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
            <li class="first"><a href="index.jsp" accesskey="1" title="Home">Αρχική Σελίδα</a></li>
            <li><a href="news.jsp" accesskey="2" title="News">Nέα</a></li>
            <li><a href="aboutUs.jsp" accesskey="3" title="About Us">Σχετικά με εμάς</a></li>
            <li class="afterlogin" style="display: none;"><a href="myaccounts.jsp" accesskey="4" title="My Accounts">Οι λογαριασμοί μου</a></li>
        </ul>
        <div id="logreg">
            <a href="login.jsp">Είσοδος</a> &nbsp;|&nbsp; <a href="register.jsp">Εγγραφή</a>
        </div>
    </div>
    <!-- start page -->
    <div id="page">
        <p id="errorMsg">
            <%= request.getParameter("registered") != null ? "You successfully subscribed to our newsletter." : "" %>
            <%= request.getParameter("error") != null ? "Error while subscribing. Try again!" : "" %>
        </p>
        <form action="subscribe.jsp" method="post" id="registerForm">
            <table id="lrform">
                <tbody>
                    <tr>
                        <td class="rowtitle">Όνομα:</td>
                        <td class="rowinput"><input type="text" name="fnameReg" id="fnameReg" value='<%= sessionInfo.getClientInfo().isEmpty() ? "" : sessionInfo.getClientInfo().get(2) %>' /></td>
                    </tr>
                    <tr>
                        <td class="rowtitle">Επώνυμο:</td>
                        <td class="rowinput"><input type="text" name="lnameReg" id="lnameReg" value='<%= sessionInfo.getClientInfo().isEmpty() ? "" : sessionInfo.getClientInfo().get(3) %>' /></td>
                    </tr>
                    <tr>
                        <td class="rowtitle">Διεύθυνση Email:</td>
                        <td class="rowinput"><input type="email" name="emailReg" id="emailReg" /></td>
                    </tr>
                    <tr><td colspan="2" id="lrSubTD"><button type="submit" name="lrSub" id="lrSub" >Εγγραφή</button></td></tr>
                </tbody>
            </table>
        </form>
    </div>
    <!-- end page -->
    <div id="footer">
        <p class="legal">Copyright (c) 2014 hondafone.gr All rights reserved.</p>
        <p class="credit">Designed by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a> + <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a></p>
    </div>
    </body>
</html>
