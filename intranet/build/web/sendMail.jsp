<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="user.User" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/main.css">
        <script src="jquery-1.10.2.min.js"></script>
        <script>
            $(document).ready(function() {
                $("#mailForm").submit(function(e) {
                    $("#message").text(" ");
                    e.preventDefault();
                    if($("#mailTitle").val() == "" || $("#mailContent").text() == "") {
                        $("#message").text("Fill both title and content before sending!");
                        return;
                    }
                    $.ajax({
                        type: "POST",
                        url: "sendMailWS.jsp",
                        data: {title: $("#mailTitle").val(), content: $("#mailContent").text()},
                        dataType: "html",
                        async: true,
                        success: function (data) {
                                $("#message").text(data);
                            }
                    });
                });
                
                $("#main").click(function() {
                    window.location.href = "<%= user instanceof user.admin.Manager ? "masterAdmin.jsp" : "salesAdmin.jsp" %>";
                });
            });
        </script>
        <title>Send mail</title>
    </head>
    <body>
        <div id="wrapper" style="text-align: center;" method="post">
            <span style="float:right"><%= user.getLname() + " " + user.getFname() %></span>
            <br>
            <form style="float:right"><button type="submit" formaction="index.jsp">Logout</button></form>
            <button id="main" style="float:right">Main menu</button></br></br></br>
            <p id="message"></p>
            <form id="mailForm">
                Title: <input type="text" id="mailTitle" name="mailTitle" /></br></br>
                Content <div contenteditable="true" id="mailContent" name="mailContent" style="width: 800px; height: 400px; background-color: white; text-align: left; margin-left: auto; margin-right: auto; border: 2px; border-style: inset; overflow: auto;"></div></br>
                <input type="submit" id="sendMail" value="Send mail" />
            </form>
        </div>
    </body>
</html>
