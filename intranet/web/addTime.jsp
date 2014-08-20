<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:useBean id="searchedClient" class="user.client.Client" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/main.css">
        <script src="jquery-1.10.2.min.js"></script>
        <script>
            $("document").ready(function() {
                
                $("#addTimeBtn").click(function() {
                    var error = false;
                    if($("#timeToAdd").val()) {
                        if($("#timeToAdd").val() < 600) { //must add at least 600 minutes (10 euros)
                            error = true;
                        }
                        else {
                            window.location.href = "updateCreditTime.jsp?number="+"<%= request.getParameter("number") %>"+"&timeToAdd="+$("#timeToAdd").val();
                        }
                    }
                    else {
                        error = true;
                    }
                    if(error) {
                        $("#errorP").html("Cannot add less than 600 minutes!");
                    }
                });
                
                $("#cancelBtn").click(function() {
                    window.location.href = "<% 
                        if(user instanceof user.admin.Manager) {
                            out.print("masterAdmin.jsp?mod=1");
                        }
                        else if(user instanceof user.admin.SalesRep) {
                            out.print("salesAdmin.jsp?mod=1");
                        }
                        else {
                            out.print("clientMain.jsp");
                        }
                        %>";
                });
                
            });
        </script>
        <title>Add Time</title>
    </head>
    <body>
        <div id="wrapper" style="text-align: center">
            <h1>Add Time</h1>
            <%= (request.getParameter("wrong") != null)?"<p align=\"center\">Something went wrong! Please try again</p>":"" %>
            <p align="center" id="errorP"></p>
            <form action="" name="addTimeForm" id="addTimeForm">
                <table style=" margin-left: auto; margin-right: auto">
                    <td>
                        <tr>Add Time(must be multiple of 60):</tr>
                        <tr><input type="number" name="timeToAdd" id="timeToAdd"/></tr>
                    </td>
                </table>
                <input type="button" id="addTimeBtn" value="Add Time" name="addTimeSubmit"/>
                <button type="button" id="cancelBtn">Cancel</button>
            </form>
        </div>
    </body>
</html>
