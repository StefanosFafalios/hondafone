<jsp:useBean id="sessionInfo" class="misc.SessionInfo" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int accNum = Integer.parseInt(request.getParameter("accNum"));
    java.util.ArrayList<String> acc = sessionInfo.getAccounts().get(accNum-1);
    String msg = "<p>Κάτοχος1: "+acc.get(1) +"</p>"+(acc.get(2).isEmpty() ? "<p>Δεν υπάρχει άλλος κάτοχος</p>" : "<p>Κάτοχος2: "+acc.get(2)+"</p>")+"<p>Ποσό: "+acc.get(3)+"</p>"+"<p id=\"timeIn"+accNum+"\">Χρόνος: <span>"+acc.get(4) +"</span></p><p><a style=\"cursor: pointer;\" id=\"showhideHis\" onclick=\"showAccHistory("+accNum+")\">Εμφάνηση ιστορικού συναλλαγής</a></p>";
    response.getWriter().write(msg);
%>