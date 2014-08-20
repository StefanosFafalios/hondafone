<jsp:useBean id="sessionInfo" class="misc.SessionInfo" scope="session" />
<%-- start web service invocation --%>
<%
try {
    sendmessage.SendMessage_Service service = new sendmessage.SendMessage_Service();
    sendmessage.SendMessage port = service.getSendMessagePort();
     // TODO initialize WS operation arguments here
    java.lang.String fname = sessionInfo.getClientInfo().get(2);
    java.lang.String lname = sessionInfo.getClientInfo().get(3);
    java.lang.String afm = sessionInfo.getClientInfo().get(9);
    java.lang.String account = request.getParameter("number");
    // TODO process result here
    boolean result = port.sendRequest(fname, lname, afm, account);
} catch (Exception ex) {
    // TODO handle custom exceptions here
}
%>
<%-- end web service invocation --%>
