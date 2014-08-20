<%@page import="account.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<jsp:useBean id="user" class="user.admin.Manager" scope="session" />
<jsp:useBean id="searchedClient" class="user.client.Client" scope="session" />

<%
    String query = "SELECT * FROM users WHERE password = '"+session.getAttribute("password")+"'";
    user = DBconnection.createManager(query);
%>

<jsp:setProperty name="user" property="fname" value= "<%= user.getFname() %>" />
<jsp:setProperty name="user" property="lname" value= "<%= user.getLname() %>" />
<jsp:setProperty name="user" property="afm" value= "<%= user.getAfm() %>" />
<jsp:setProperty name="user" property="birthDate" value= "<%= user.getBirthDate() %>" />
<jsp:setProperty name="user" property="homeAddress" value= "<%= user.getHomeAddress() %>" />
<jsp:setProperty name="user" property="gender" value= "<%= user.isMale() %>" />
<jsp:setProperty name="user" property="married" value= "<%= user.isMarried() %>" />
<jsp:setProperty name="user" property="bankAccount" value= "<%= user.getBankAccount() %>" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/main.css">
        <script src="jquery-1.10.2.min.js"></script>
        <script>
            $("document").ready(function() {
        
                $(".disabled").prop("disabled", true); //disable functions that require selection first
                
                if(<%= DBconnection.requestsExist() %>) {
                    var decision = confirm("There are requests. Do you want to see them now?");
                    if(decision == true) window.location.href = "requestsList.jsp";
                }
                
                function showInfo() { //show client info when searched
                    if($("#pwd").val()) { //if password was provided
                        $.ajax({
                            type: "GET",
                            url: "searchClient.jsp",
                            data: {password: $("#pwd").val()},
                            dataType: "html",
                            async: true,
                            success: function (data) {
                                $("#cldetails").html(data);
                                if($("#cldetails").find("li").length != 0) {
                                    $("#accounts").show(function() {
                                        $.ajax({ //fill accounts combobox
                                            type: "GET",
                                            url: "getAccounts.jsp",
                                            dataType: "html",
                                            async: true,
                                            success: function (data) {
                                                $("#accounts").html(data);
                                            }
                                        });
                                    });
                                    $("#accountInfo").show();
                                    $("#clientActions .disabled").prop("disabled", false);
                                }
                                else { //if nothing was found hide disabled areas again
                                    $("#accounts").hide();
                                    $("#accountInfo").hide();
                                    $("#clientActions .disabled").prop("disabled", true);
                                }
                            }
                        });
                    }
                    else if($("#fname").val() && $("#lname").val()) { //if name was provided
                        $.ajax({
                            type: "GET",
                            url: "searchClient.jsp",
                            data: {fname: $("#fname").val(), lname: $("#lname").val()},
                            dataType: "html",
                            async: true,
                            success: function (data) {
                                $("#cldetails").html(data);
                                if($("#cldetails").find("li").length != 0) {
                                    $("#accounts").show(function() {
                                        $.ajax({
                                            type: "GET",
                                            url: "getAccounts.jsp",
                                            dataType: "html",
                                            async: true,
                                            success: function (data) {
                                                $("#accounts").html(data);
                                            }
                                        });
                                    });
                                    $("#accountInfo").show();
                                    $("#clientActions .disabled").prop("disabled", false);
                                }
                                else {
                                    $("#accounts").hide();
                                    $("#accountInfo").hide();
                                    $("#clientActions .disabled").prop("disabled", true);
                                }
                            }
                        });
                    }
                }
        
                //if client was searched and came back to this page, show their information automatically
                if(<%= request.getParameter("mod") != null %>) {
                    $("#cldetails").html('<%= (searchedClient.getPassword() != null)?"<h3 style=\"text-align:center\">Client Information</h3><li><span class=\"li\">First Name: " + searchedClient.getFname() + "</span></li><li><span class=\"li\">Last Name: " + searchedClient.getLname() + "</span></li><li><span class=\"li\">Password: " + searchedClient.getPassword() + "</span></li><li><span class=\"li\">Birth Date: " + searchedClient.getStringBirthDate() + "</span></li><li><span class=\"li\">Gender: " + (searchedClient.isMale()?"male":"female") + "</span></li><li><span class=\"li\">Home Address: " + searchedClient.getHomeAddress() + "</span></li><li><span class=\"li\">Work Address: " + searchedClient.getWorkAddress() + "</span></li><li><span class=\"li\">Marital Status: " + (searchedClient.isMarried()?"married":"single") + "</span></li><li><span class=\"li\">AFM: " + searchedClient.getAfm() + "</span></li><li><span class=\"li\">Bank Account: " + searchedClient.getBankAccount() + "</span></li>":"" %>');
                    $("#accounts").show();
                    <% 
                        String msg = "<option value=\"none\">-Choose account-</option>";
                        if(searchedClient.getPassword() != null) {
                            for(Account acc : searchedClient.getAccounts()) {
                                msg += "<option value=\"" + acc.getNumber() + "\">" + acc.getNumber() + "</option>";
                            }
                        }
                    %>
                    $("#accounts").html('<%= msg %>');
                    $("#accountInfo").show();
                    $("#clientActions .disabled").prop("disabled", false);
                }
                
                //show password if registered new client
                if(<%= request.getParameter("pass") != null %>) {
                    alert("Successful registration! Password: "+"<%= request.getParameter("pass") %>");
                }
        
                $("#search").click(function() {
                    showInfo();
                });
                
                $("#accounts").change(function() { //show account's info if one is selected
                    if($(this).find("option:selected").val() != "none") {
                        $.ajax({
                            type: "GET",
                            url: "setChosenClientAccountDetails.jsp",
                            data: {number: $(this).find("option:selected").text()},
                            dataType: "html",
                            async: true,
                            success: function (data) {
                                $("#accdetails").html(data);
                                $("#accountActions .disabled").prop("disabled", false);
                            }
                        });
                    }
                    else {
                        $("#accdetails").html(" ");
                        $("#accountActions .disabled").prop("disabled", true);
                    }
                });
                
                $("#addTimeBtn").click(function() {
                    window.location.href = "addTime.jsp?number="+$("#accounts").find("option:selected").text();
                });

                $("#addCreditBtn").click(function() {
                    window.location.href = "addCredit.jsp?number="+$("#accounts").find("option:selected").text();
                });

                $("#createAccountBtn").click(function() {
                    window.location.href = "createAccount.jsp?number="+$("#accounts").find("option:selected").text();
                });
                
                $("#deleteAccountBtn").click(function() {
                    window.location.href = "deleteAccount.jsp?number="+$("#accounts").find("option:selected").text();
                });
                
                $("#sendMailBtn").click(function() {
                    window.location.href = "sendMail.jsp";
                });
                
                $("#showReq").click(function() {
                    if(<%= DBconnection.requestsExist() %>) window.location.href = "requestsList.jsp";
                    else alert("There are no requests to show!");
                });
            });
        </script>
        <title>Admin Profile - Search Client</title>
    </head>
    <body>
        <div id="wrapper">
            <span style="float:right"><%= user.getLname() + " " + user.getFname() %></span>
            <br>
            <form style="float:right"><button type="submit" formaction="index.jsp">Logout</button></form>
            <button id="sendMailBtn" style="float:right">Inform subscribers</button>
            <button id="showReq" style="float:right">Show requests</button>
            <br><br><br>
            <%= (request.getParameter("added") != null)?"<p align=\"center\">"+request.getParameter("added")+" minutes where successfully added</p>":"" %>
            <%= (request.getParameter("wrong") != null)?"<p align=\"center\">Something went wrong! Please try again</p>":"" %>
            <%= (request.getParameter("number") != null)?"<p align=\"center\">Your account("+request.getParameter("number")+") was successfully created</p>":"" %>
            <h3>Search client:</h3>
            <form name="search" id="searchForm" action="" method="POST">
                First name:<input type="text" id="fname" name="fname"/> or Password:<input type="password" id="pwd" name="pwd"><br>
                Last name:<input type="text" id="lname" name="lname"/><br>
                <input type="button" id="search" value="Search" />
            </form>
            <br><br>
            <div id="clientMenu">
                <div class="details" id="cldetails">
                    
                </div>
                <div class="actions" id="clientActions">
                    <h3>Client Actions</h3>
                    <form>
                        <button name="newClient" formaction="newClient.jsp">Register New Client</button>
                        <br>
                        <br>
                        <button name="modifyInfo" formaction="modifyClientInfo.jsp" class="disabled">Modify Client Information</button>
                        <br>
                        <br>
                        <button name="deleteClient" formaction="deleteClient.jsp" class="disabled">Delete Client</button>
                        <br>
                        <br>
                    </form>
                </div>
            </div>
            <br><br>
            <select id="accounts" style="margin-top:30px; margin-bottom:10px; margin-left:2px;">
                <option value="none">-Choose account-</option>
            </select>
            <script>$("#accounts").hide();</script>
            <div id="accountInfo">
                <div class="details" id="accdetails">
                </div>
                <div class="actions" id="accountActions">
                    <h3>Account Actions</h3>
                    <button id="addTimeBtn" name="addTime" class="disabled">Add Time</button>
                    <br>
                    <br>
                    <button id="addCreditBtn" name="addCredit" class="disabled">Add Credit</button>
                    <br>
                    <br>
                    <button id="createAccountBtn" name="createAccount">Create Account</button>
                    <br>
                    <br>
                    <button id="deleteAccountBtn" name="deleteAccount" class="disabled">Delete Account</button>
                    <br>
                    <br>
                </div> 
            </div>
            <script>$("#accountInfo").hide();</script>
        </div>
    </body>
</html>
