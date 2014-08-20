<!-- !!!!!FOR INTERNET APP!!!!! -->

<%@page import="account.Account"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<jsp:useBean id="user" class="user.client.Client" scope="session" />
<jsp:useBean id="searchedClient" class="user.client.Client" scope="session" />

<%
    String query = "SELECT * FROM users WHERE password = '"+session.getAttribute("password")+"'";
    user = DBconnection.createClient(query);
    user.setAccounts(DBconnection.getAccounts(user.getAfm()));
    searchedClient = user; //searchedClient needed for addTime and addCredit
%>

<jsp:setProperty name="user" property="fname" value= "<%= user.getFname() %>" />
<jsp:setProperty name="user" property="lname" value= "<%= user.getLname() %>" />
<jsp:setProperty name="user" property="afm" value= "<%= user.getAfm() %>" />
<jsp:setProperty name="user" property="birthDate" value= "<%= user.getBirthDate() %>" />
<jsp:setProperty name="user" property="homeAddress" value= "<%= user.getHomeAddress() %>" />
<jsp:setProperty name="user" property="workAddress" value= "<%= user.getWorkAddress() %>" />
<jsp:setProperty name="user" property="gender" value= "<%= user.isMale() %>" />
<jsp:setProperty name="user" property="married" value= "<%= user.isMarried() %>" />
<jsp:setProperty name="user" property="accounts" value= "<%= user.getAccounts() %>" />
<jsp:setProperty name="user" property="bankAccount" value= "<%= user.getBankAccount() %>" />
<jsp:setProperty name="user" property="relations" value= "<%= user.getRelations() %>" />

<jsp:setProperty name="searchedClient" property="fname" value= "<%= user.getFname() %>" />
<jsp:setProperty name="searchedClient" property="lname" value= "<%= user.getLname() %>" />
<jsp:setProperty name="searchedClient" property="afm" value= "<%= user.getAfm() %>" />
<jsp:setProperty name="searchedClient" property="birthDate" value= "<%= user.getBirthDate() %>" />
<jsp:setProperty name="searchedClient" property="homeAddress" value= "<%= user.getHomeAddress() %>" />
<jsp:setProperty name="searchedClient" property="workAddress" value= "<%= user.getWorkAddress() %>" />
<jsp:setProperty name="searchedClient" property="gender" value= "<%= user.isMale() %>" />
<jsp:setProperty name="searchedClient" property="married" value= "<%= user.isMarried() %>" />
<jsp:setProperty name="searchedClient" property="accounts" value= "<%= user.getAccounts() %>" />
<jsp:setProperty name="searchedClient" property="bankAccount" value= "<%= user.getBankAccount() %>" />
<jsp:setProperty name="searchedClient" property="relations" value= "<%= user.getRelations() %>" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/main.css">
        <script src="jquery-1.10.2.min.js"></script>
        <script>
            $("document").ready(function() {

                $(".disabled").prop("disabled", true); //disable functions that require selection first

                $("#accounts").change(function() { //when user selects

                    if($(this).find("option:selected").val() != "none") {
                        $.ajax({
                            type: "GET",
                            url: "setClientAccountDetails.jsp",
                            data: {number: $(this).find("option:selected").text()},
                            dataType: "html",
                            async: true,
                            success: function (data) {
                                $(".details").html(data);
                                if($(".details").find("li").length != 0) {
                                    $(".actions .disabled").prop("disabled", false);
                                }
                                else {
                                    $(".actions .disabled").prop("disabled", true);
                                }
                            }
                        });
                    }
                    else { //if selected nothing disable again
                        $(".details").html(" ");
                        $(".actions .disabled").prop("disabled", true);
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

            });
        </script>
        <title>Profile</title>
    </head>
    <body>
        <div id="wrapper">
            <span style="float:right"><%= user.getLname()+" "+user.getFname() %></span>
            <br>
            <form style="float:right"><button type="submit" formaction="index.jsp">Logout</button></form>
            <br>
            <br>
            <br>
            <%= (request.getParameter("added") != null)?"<p align=\"center\">"+request.getParameter("added")+"  minutes where successfully added</p>":"" %>
            <%= (request.getParameter("number") != null)?"<p align=\"center\">Your account("+request.getParameter("number")+") was successfully created</p>":"" %>
            Choose your account:
            <%
                //fill combobox with accounts
                out.println("<select id=\"accounts\">");
                out.println("<option value=\"none\">-Choose Account-</option>"); //default option
                for(Account acc : user.getAccounts()) {
                    out.println("<option value=\"" + acc.getNumber() + "\">" + acc.getNumber() + "</option>");
                }
                out.println("</select>");
            %>
            <br>
            <br>
            <div class="details">
                
            </div>
            <div class="actions">
                <h3>Account Actions</h3>
                <button name="addTime" id="addTimeBtn" class="disabled">Add Time</button>
                <br>
                <br><button id="addCreditBtn" name="addCredit" class="disabled">Add Credit</button>
                <br>
                <br>
                <button id="createAccountBtn" name="createAccount">Create Account</button>
                <br>
                <br>
            </div>
        </div>
    </body>
</html>