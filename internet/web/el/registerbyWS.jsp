<%-- start web service invocation --%>
<%
try {
    logreg.Logreg_Service service = new logreg.Logreg_Service();
    logreg.Logreg port = service.getLogregPort();
     // TODO initialize WS operation arguments here
    java.lang.String fname = request.getParameter("fnameReg");
    java.lang.String lname = request.getParameter("lnameReg");
    java.lang.String email = request.getParameter("emailReg");
    java.lang.String username = request.getParameter("usernameReg");
    String bdate = request.getParameter("byear")+"-"+request.getParameter("bmonth")+"-"+request.getParameter("bday");
    String gender = request.getParameter("genderReg");
    String hadd = request.getParameter("haddReg");
    String wadd = request.getParameter("waddReg");
    String married = request.getParameter("marriedReg");
    String afm = request.getParameter("afmReg");
    String bacc = request.getParameter("baccReg");
    // TODO process result here
    java.lang.String result = port.register(username, fname, lname, email, bdate, gender, hadd, wadd, married, afm, bacc);
    if(result == null) {
        response.sendRedirect("register.jsp?error=1");
        return;
    }
    try {
	sendmessage.SendMessage_Service service1 = new sendmessage.SendMessage_Service();
	sendmessage.SendMessage port1 = service1.getSendMessagePort();
	 // TODO initialize WS operation arguments here
	java.util.List<java.lang.String> receiverMail = new java.util.ArrayList();
        receiverMail.add(email);
	java.lang.String content = "Your Hondafone password is: "+result;
	java.lang.String subject = "Hondafone registration password";
	// TODO process result here
	if(port1.sendMessage(receiverMail, content, subject)) {
            response.sendRedirect("register.jsp?registered=1");
            return;
        }
        response.sendRedirect("register.jsp?nomail=1");
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
} catch (Exception ex) {
    // TODO handle custom exceptions here
}
%>
<%-- end web service invocation --%>
