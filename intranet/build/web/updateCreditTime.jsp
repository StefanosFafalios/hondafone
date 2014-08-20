<%@page import="account.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:useBean id="searchedClient" class="user.client.Client" scope="session" />

<%
    //check if came here from addTime or addCredit
    int credit; 
    if(request.getParameter("creditToAdd") != null) {
        credit = Integer.valueOf(request.getParameter("creditToAdd"));
    }
    else {
        int time = Integer.valueOf(request.getParameter("timeToAdd"));
        credit = time/60;
    }
     
    Account selectedAccount = searchedClient.getAccount(request.getParameter("number"));
    
    if(DBconnection.updateTimeCredit(selectedAccount, credit)) {
        if(user instanceof user.admin.SalesRep){
            response.sendRedirect("salesAdmin.jsp?mod=1&added="+credit*60); 
        }
        else if(user instanceof user.admin.Manager){
            response.sendRedirect("masterAdmin.jsp?mod=1&added="+credit*60);
        }
        else {
            response.sendRedirect("clientMain.jsp?mod=1&added="+credit*60);
        }
    }
    else{
        response.sendRedirect("addTime.jsp?wrong=1");
    }
%>