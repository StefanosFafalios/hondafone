<jsp:useBean id="sessionInfo" class="misc.SessionInfo" scope="session" />
<%-- start web service invocation --%>
<%
try {
    hs.HondafoneServices_Service service = new hs.HondafoneServices_Service();
    hs.HondafoneServices port = service.getHondafoneServicesPort();
     // TODO initialize WS operation arguments here
    java.lang.String creditToAdd = request.getParameter("credit");
    creditToAdd = creditToAdd.isEmpty() ? null : creditToAdd;
    java.lang.String timeToAdd = request.getParameter("time");
    timeToAdd = timeToAdd.isEmpty() ? null : timeToAdd;
    java.lang.String number = request.getParameter("number");
    java.lang.String timeInAcc = request.getParameter("timeInAcc");
    // TODO process result here
    int result = port.updateCreditTime(creditToAdd, timeToAdd, number, timeInAcc);
    if(result == -1) {
        response.getWriter().write("An error occured!");
        return;
    }
    java.util.ArrayList<java.util.ArrayList<String>> accounts = sessionInfo.getAccounts();
    for(java.util.ArrayList<String> a : accounts) {
        if(a.get(0).equalsIgnoreCase(number)) {
            
            a.set(3, String.valueOf(result/60+Integer.parseInt(timeInAcc)/60));
            a.set(4, String.valueOf(result+Integer.parseInt(timeInAcc)));
            
            java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            java.util.Date date = new java.util.Date();
            String curr_date = dateFormat.format(date);
            
            a.add(curr_date);
            a.add(String.valueOf(result/60));
            
            break;
        }
    }
    
    response.getWriter().write("success");
} catch (Exception ex) {
    response.getWriter().write("An error occured!");
}
%>
<%-- end web service invocation --%>
