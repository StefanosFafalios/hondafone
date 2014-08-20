<jsp:useBean id="sessionInfo" class="misc.SessionInfo" scope="session" />
<%-- start web service invocation --%>
<%
try {
    hs.HondafoneServices_Service service = new hs.HondafoneServices_Service();
    hs.HondafoneServices port = service.getHondafoneServicesPort();
     // TODO initialize WS operation arguments here
    java.lang.String afm = sessionInfo.getClientInfo().get(9);
    int numOfAccs = sessionInfo.getAccounts().size();
    // TODO process result here
    java.lang.String result = port.createAccount(afm, numOfAccs, false);
    if(result == null) response.getWriter().write("error");
    else {
        if(!result.equals("approval")) {
            java.util.ArrayList<String> newacc = new java.util.ArrayList();
            newacc.add(result);
            newacc.add(afm);
            newacc.add("");
            newacc.add("0");
            newacc.add("0");
            sessionInfo.getAccounts().add(newacc);
        }
        else {
            try {
                sendmessage.SendMessage_Service service1 = new sendmessage.SendMessage_Service();
                sendmessage.SendMessage port1 = service1.getSendMessagePort();
                 // TODO initialize WS operation arguments here
                java.lang.String fname = sessionInfo.getClientInfo().get(2);
                java.lang.String lname = sessionInfo.getClientInfo().get(3);
                java.lang.String account = null;
                // TODO process result here
                boolean result1 = port1.sendRequest(fname, lname, afm, account);
            } catch (Exception ex) {
                // TODO handle custom exceptions here
            }

        }
        response.getWriter().write(result);
    }
} catch (Exception ex) {
    // TODO handle custom exceptions here
}
%>
<%-- end web service invocation --%>