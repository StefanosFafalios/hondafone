<jsp:useBean id="sessionInfo" class="misc.SessionInfo" scope="session" />
<%
    int accNum = Integer.parseInt(request.getParameter("accNum"));
    java.util.ArrayList<String> acc = sessionInfo.getAccounts().get(accNum-1);
    String msg = "<p>Owner1: "+acc.get(1) +"</p>"+(acc.get(2).isEmpty() ? "<p>No other owner</p>" : "<p>Owner2: "+acc.get(2)+"</p>")+"<p>Credit: "+acc.get(3)+"</p>"+"<p id=\"timeIn"+accNum+"\">Time: <span>"+acc.get(4) +"</span></p><p><a style=\"cursor: pointer;\" id=\"showhideHis\" onclick=\"showAccHistory("+accNum+")\">Show transaction history</a></p>";
    response.getWriter().write(msg);
%>