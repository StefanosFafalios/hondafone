<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/main.css">
        <script src="jquery-1.10.2.min.js"></script>
        <script>
            $(document).ready(function() {
                $("#main").click(function() {
                    window.location.href = "<%= user instanceof user.admin.Manager ? "masterAdmin.jsp" : "salesAdmin.jsp" %>";
                });
            });
            
            function acceptReq(accepted) {
                $("#message").text(" ");
                if($("#action"+accepted).text() == "c") {
                    $.ajax({
                        type: "POST",
                        url: "acceptCreation.jsp",
                        data: {afm: $("#afm"+accepted).text(), id: $("#id"+accepted).text()},
                        dataType: "html",
                        async: true,
                        success: function (data) {
                            if($.trim(data) == "fail") $("#message").text("Request was not fulfilled!");
                            else if($.trim(data) == "email") {
                                $("#message").text("Request was fulfilled but no email was sent!");
                                $("#done"+accepted).html("&#10003;");
                                $("#accept"+accepted).text(" ");
                                $("#decline"+accepted).text(" ");
                            }
                            else {
                                $("#message").text("Account "+$.trim(data)+" was created.")
                                $("#done"+accepted).html("&#10003;");
                                $("#accept"+accepted).text(" ");
                                $("#decline"+accepted).text(" ");
                            }
                        }
                    });
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "acceptDeletion.jsp",
                        data: {number: $("#action"+accepted).text(), afm: $("#afm"+accepted).text(), id: $("#id"+accepted).text()},
                        dataType: "html",
                        async: true,
                        success: function (data) {
                            if($.trim(data) == "fail") $("#message").text("Request was not fulfilled!");
                            else if($.trim(data) == "email") {
                                $("#message").text("Request was fulfilled but no email was sent!");
                                $("#done"+accepted).html("&#10003;");
                                $("#accept"+accepted).text(" ");
                                $("#decline"+accepted).text(" ");
                            }
                            else {
                                $("#message").text("Account "+$("#action"+accepted).text()+" was deleted.")
                                $("#done"+accepted).html("&#10003;");
                                $("#accept"+accepted).text(" ");
                                $("#decline"+accepted).text(" ");
                            }
                        }
                    });
                }
            }

            function declineReq(declined) {
                $("#message").text(" ");
                var creation = $("#action"+declined).text() == "c";
                $.ajax({
                    type: "POST",
                    url: "declineRequest.jsp",
                    data: {afm: $("#afm"+declined).text(), id: $("#id"+declined).text(), number: creation?"creation":$("#action"+declined).text()},
                    dataType: "html",
                    async: true,
                    success: function (data) {
                        if($.trim(data) == "email") {
                            $("#message").text("Request was denied but no email was sent!");
                            $("#done"+declined).html("&#10003;");
                            $("#accept"+declined).text(" ");
                            $("#decline"+declined).text(" ");
                        }
                        else {
                            $("#message").text("Request was denied.")
                            $("#done"+declined).html("&#10003;");
                            $("#accept"+declined).text(" ");
                            $("#decline"+declined).text(" ");
                        }
                    }
                });
            }
        </script>
        <title>Requests</title>
    </head>
    <body>
        <div id="wrapper" style="text-align: center;" method="post">
            <span style="float:right"><%= user.getLname() + " " + user.getFname() %></span>
            <br>
            <form style="float:right"><button type="submit" formaction="index.jsp">Logout</button></form>
            <button id="main" style="float:right">Main menu</button></br></br></br>
            <p id="message"></p>
            <%
                ArrayList<String[]> requests = DBconnection.getRequests();
                if(requests == null) out.print("<p>Something went wrong! Please try again later.</p>");
                else {
                    int i = 1;
                    for(String[] requestItem : requests) {
                        out.println("<span id=\""+i+"\">");
                        out.println("<span id=\"done"+i+"\"></span>");
                        out.println("<span class=\"order\">"+i+". </span>");
                        out.println("<span id=\"fname"+i+"\">"+requestItem[0]+"</span>");
                        out.println("<span id=\"lname"+i+"\">"+requestItem[1]+"</span>");
                        out.println("<span id=\"todo\">"+(requestItem[2].equals("0000000000")?"wants to create a new account":"wants to delete account: "+requestItem[2])+"</span>");
                        out.println("<span> | </span>");
                        out.println("<span id=\"accept"+i+"\"><a href=\"#\" onclick=\"acceptReq("+i+")\"><font color=\"blue\">accept request</font></a></span>");
                        out.println("<span> | </span>");
                        out.println("<span id=\"decline"+i+"\"><a href=\"#\" onclick=\"declineReq("+i+")\"><font color=\"red\">decline request</font></a></span>");
                        out.println("<span> | </span>");
                        out.println("<span id=\"action"+i+"\" style=\"display: none;\">"+(requestItem[2].equals("0000000000")?"c":requestItem[2])+"</span>");
                        out.println("<span id=\"afm"+i+"\" style=\"display: none;\">"+requestItem[3]+"</span>");
                        out.println("<span id=\"id"+i+"\" style=\"display: none;\">"+requestItem[4]+"</span>");
                        out.println("</span>");
                        out.println("</br>");
                        i++;
                    }
                }
            %>
        </div>
    </body>
</html>
