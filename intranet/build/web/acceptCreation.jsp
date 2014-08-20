<%@page import="java.util.ArrayList"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<%-- start web service invocation --%>
<%
try {
    hs.HondafoneServices_Service service = new hs.HondafoneServices_Service();
    hs.HondafoneServices port = service.getHondafoneServicesPort();
     // TODO initialize WS operation arguments here
    java.lang.String afm = request.getParameter("afm");
    java.lang.String id = request.getParameter("id");
    int numOfAccs = 6; //it doesn't matter in this case
    // TODO process result here
    java.lang.String result = port.createAccount(afm, numOfAccs, true);
    if(result == null) response.getWriter().write("fail");
    else {
        try {
            sendmessage.SendMessage_Service service1 = new sendmessage.SendMessage_Service();
            sendmessage.SendMessage port1 = service1.getSendMessagePort();
             // TODO initialize WS operation arguments here
            java.util.List<java.lang.String> receiverMail = new ArrayList<java.lang.String>();
            String email = DBconnection.getEmail(afm);
            if(email == null) {
                DBconnection.deleteRequest(id);
                response.getWriter().write("email");
                return;
            }
            receiverMail.add(email);
            java.lang.String content = "Your new account has been approved. The number is "+result;
            java.lang.String subject = "New account approval";
            // TODO process result here
            boolean result1 = port1.sendMessage(receiverMail, content, subject);
            if(result1) {
                DBconnection.deleteRequest(id);
                response.getWriter().write(result);
                return;
            }
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }

        DBconnection.deleteRequest(id);
        response.getWriter().write("email");
    }
} catch (Exception ex) {
    // TODO handle custom exceptions here
}
%>
<%-- end web service invocation --%>
