<jsp:useBean id="sessionInfo" class="misc.SessionInfo" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int accNum = Integer.parseInt(request.getParameter("accNum"));
    java.util.ArrayList<String> acc = sessionInfo.getAccounts().get(accNum-1);
    String msg = "<h3>Ιστορικό λογαριασμού</h3><h5>Διάταξη:</h5><p>Χρόνος: έτος-μήνας-ημέρα ώρα:λεπτά:δευτερόλεπτα.0</br>Ποσό: \"ποσό-που-προστέθηκε\"</p></br>";
    for(int i=5; i<acc.size(); i++) {
        msg += (i % 2 == 0 ? "Ποσό που προστέθηκε: " : "<p>Χρόνος: ")+acc.get(i)+(i % 2 == 0 ? " &euro;</p>" : "")+"</br>";
    }
    response.getWriter().write(msg);
%>