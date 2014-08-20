<%-- start web service invocation --%>
<%
try {
    logreg.Logreg_Service service = new logreg.Logreg_Service();
    logreg.Logreg port = service.getLogregPort();
     // TODO initialize WS operation arguments here
    java.lang.String fname = request.getParameter("fnameReg");
    java.lang.String lname = request.getParameter("lnameReg");
    java.lang.String email = request.getParameter("emailReg");
    // TODO process result here
    boolean result = port.subscribe(fname, lname, email);
    if(result) response.sendRedirect("newsletterReg.jsp?registered=1");
    else response.sendRedirect("newsletterReg.jsp?error=1");
} catch (Exception ex) {
    response.sendRedirect("newsletterReg.jsp?error=1");
}
%>
<%-- end web service invocation --%>