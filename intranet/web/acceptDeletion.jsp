<%@page import="java.util.ArrayList"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<%
    String number = request.getParameter("number");
    String afm = request.getParameter("afm");
    String id = request.getParameter("id");
    if(!DBconnection.deleteAccount(number)) response.getWriter().write("fail");
    else {
        try {
            sendmessage.SendMessage_Service service = new sendmessage.SendMessage_Service();
            sendmessage.SendMessage port = service.getSendMessagePort();
             // TODO initialize WS operation arguments here
            java.util.List<java.lang.String> receiverMail = new ArrayList<java.lang.String>();
            String email = DBconnection.getEmail(afm);
            if(email == null) {
                DBconnection.deleteRequest(id);
                response.getWriter().write("email");
                return;
            }
            receiverMail.add(email);
            java.lang.String content = "Your account with number "+number+" has been deleted.";
            java.lang.String subject = "Account deletion approval";
            // TODO process result here
            boolean result = port.sendMessage(receiverMail, content, subject);
            if(result) {
                DBconnection.deleteRequest(id);
                response.getWriter().write("success");
                return;
            }
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }
        
        DBconnection.deleteRequest(id);
        response.getWriter().write("email");
    }
%>