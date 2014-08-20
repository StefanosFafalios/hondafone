<%@page import="java.util.ArrayList"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<%
    java.lang.String afm = request.getParameter("afm");
    java.lang.String id = request.getParameter("id");
    java.lang.String number = request.getParameter("number");
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
	java.lang.String content = number.equals("creation")?"Your request for another account has been denied.":"Your request to delete your account with number "+number+" has been denied.";
	java.lang.String subject = "Request denial";
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
%>
