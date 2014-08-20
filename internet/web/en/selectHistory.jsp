<jsp:useBean id="sessionInfo" class="misc.SessionInfo" scope="session" />
<%
    int accNum = Integer.parseInt(request.getParameter("accNum"));
    java.util.ArrayList<String> acc = sessionInfo.getAccounts().get(accNum-1);
    String msg = "<h3>Account History</h3><h5>Format:</h5><p>Time: year-month-day hour:mins:secs.0</br>Credit: \"credit-added\"</p></br>";
    for(int i=5; i<acc.size(); i++) {
        msg += (i % 2 == 0 ? "Credit added: " : "<p>Time: ")+acc.get(i)+(i % 2 == 0 ? " &euro;</p>" : "")+"</br>";
    }
    response.getWriter().write(msg);
%>