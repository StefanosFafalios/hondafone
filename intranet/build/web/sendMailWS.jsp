<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<%-- start web service invocation --%>
<%
try {
    sendmessage.SendMessage_Service service = new sendmessage.SendMessage_Service();
    sendmessage.SendMessage port = service.getSendMessagePort();
     // TODO initialize WS operation arguments here
    java.util.List<java.lang.String> receiverMail = DBconnection.getSubscribers();
    if(receiverMail == null) response.getWriter().write("Something went wrong while sending emails!");
    java.lang.String content = request.getParameter("content");
    java.lang.String subject = request.getParameter("title");
    // TODO process result here
    boolean result = port.sendMessage(receiverMail, content, subject);
    if(result) response.getWriter().write("Emails sent to subscribers");
    else response.getWriter().write("Something went wrong while sending emails!");
} catch (Exception ex) {
    // TODO handle custom exceptions here
}
%>
<%-- end web service invocation --%>
