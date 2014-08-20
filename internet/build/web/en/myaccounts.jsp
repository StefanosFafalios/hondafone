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
<title>My Accounts</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script src="../jquery-1.10.2.min.js"></script>
<link href="../style.css" rel="stylesheet" type="text/css" media="screen" />
<script>
    
    var selectedAcc = 0;
    var newAccounts = 0;
    
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
        
        $("#newAccService").click(function() {
            $.ajax({
                type: "GET",
                url: "createAccount.jsp",
                data: {},
                dataType: "html",
                async: true,
                success: function (data) {
                    if($.trim(data) == "error") {
                        $("#accountInfo").html("An error accurred! Please try again later.");
                    }
                    else if($.trim(data) == "approval") {
                        $("#accountInfo").html("You already have 6 accounts. Your request has been sent for approval. We will send you an email with the outcome.");
                    }
                    else {
                        newAccounts++;
                        $("#accounts ul").html($("#accounts ul").html()+"<li id=\"account"+(<%=sessionInfo.getAccounts().size()%>+newAccounts)+"\"><p><a style=\"cursor: pointer;\" onclick=\"showAccountInfo("+(<%=sessionInfo.getAccounts().size()%>+newAccounts)+")\">"+$.trim(data)+"</a></p></li>");
                        $("#accountInfo").html("Your new account number is: "+data);
                    }
                }
            });
        });
        
        $("#addCreditService").click(function(e) {
            if(selectedAcc == 0) {
                alert("Please select an account first!");
                return;
            }
            var credit = prompt("Enter the amount of credit you want to add to "+$("#account"+selectedAcc).text(), "");
            if(credit != null) {
                if(credit < 10) {
                    alert("You cannot add less than 10 \u20AC");
                    return;
                }
                $.ajax({
                type: "GET",
                url: "addCreditTime.jsp",
                data: {credit: credit, time: null, number: $("#account"+selectedAcc).text(), timeInAcc: $("#timeIn"+selectedAcc+" span").text()},
                dataType: "html",
                async: true,
                success: function (data) {
                        if($.trim(data) == "success") {
                            showAccountInfo(selectedAcc);
                        }
                        else {
                            $("#accountInfo").html(data);
                            selectedAccount = 0;
                        }
                    }
                });
            }
        });
        
        $("#addTimeService").click(function() {
            if(selectedAcc == 0) {
                alert("Please select an account first!");
                return;
            }
            var time = prompt("Enter the time you want to add to "+$("#account"+selectedAcc).text(), "");
            if(time != null) {
                if(time < 600) {
                    alert("You cannot add less than 600' (10 \u20AC)");
                    return;
                }
                $.ajax({
                type: "GET",
                url: "addCreditTime.jsp",
                data: {credit: null, time: time, number: $("#account"+selectedAcc).text(), timeInAcc: $("#timeIn"+selectedAcc+" span").text()},
                dataType: "html",
                async: true,
                success: function (data) {
                        if($.trim(data) == "success") {
                            showAccountInfo(selectedAcc);
                        }
                        else {
                            $("#accountInfo").html(data);
                            selectedAccount = 0;
                        }
                    }
                });
            }
        });
        
        $("#deleteAccService").click(function() {
            if(selectedAcc == 0) {
                alert("You should select an account first.");
                return;
            }
            var decision = confirm("Do you really want to delete your account?");
            if(decision == false) return;
            $.ajax({
                type: "GET",
                url: "deleteAccount.jsp",
                data: {number: $("#account"+selectedAcc).text()},
                dataType: "html",
                async: true,
                success: function (data) {
                    
                }
            });
            $("#accountInfo").html("Your request has been sent for approval. We will send you an email with the outcome.");
        });
        
    });
        
    function showAccountInfo(accNum) {
        $("#accHistory").html("");
        selectedAcc = accNum;
        $.ajax({
            type: "GET",
            url: "selectInfo.jsp",
            data: {accNum: accNum},
            dataType: "html",
            async: true,
            success: function (data) {
                $("#accountInfo").html(data);
            }
        });
    }
    
    function showAccHistory(accNum) {
        if($("#showhideHis").text() == "Hide transaction history") {
            $("#accHistory").html("");
            $("#showhideHis").text("Show transaction history");
        }
        else {
            $.ajax({
                type: "GET",
                url: "selectHistory.jsp",
                data: {accNum: accNum},
                dataType: "html",
                async: true,
                success: function (data) {
                    $("#showhideHis").text("Hide transaction history");
                    $("#accHistory").html(data);
                }
            });
        }
    }
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
    <div id="left">
        <div id="accounts">
            <ul>
                <%
                    for(int i=0; i<sessionInfo.getAccounts().size(); i++) {
                        out.println("<li id=\"account"+(i+1)+"\"><p><a style=\"cursor: pointer;\" onclick=\"showAccountInfo("+(i+1)+")\">"+sessionInfo.getAccounts().get(i).get(0)+"</a></p></li>");
                    }
                %>
            </ul>
        </div>
        <div id="accServices">
            <ul>
                <li><p><a id="newAccService" style="cursor: pointer;">Create new account</a></p></li>
                <li><p><a id="addCreditService" style="cursor: pointer;">Add credit</a></p></li>
                <li><p><a id="addTimeService" style="cursor: pointer;">Add time</a></p></li>
                <li><p><a id="deleteAccService" style="cursor: pointer;">Delete account</a></p></li>
            </ul>
        </div>
    </div>
    <div id="accountInfo"></div>
    <div id="accHistory"></div>
</div>
<!-- end page -->
<div id="footer">
    <p class="legal">Copyright (c) 2014 hondafone.gr All rights reserved.</p>
    <p class="credit">Designed by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a> + <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a></p>
</div>
</body>
</html>


