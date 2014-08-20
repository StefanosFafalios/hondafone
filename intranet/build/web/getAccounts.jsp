<%@page import="account.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<jsp:useBean id="searchedClient" class="user.client.Client" scope="session" />
<%
    String msg = "<option value=\"none\">-Choose account-</option>"; //default option
    String afm = searchedClient.getAfm();
    ArrayList<Account> accounts = DBconnection.getAccounts(afm);
    
    for(Account acc : accounts) {
        msg += "<option value=\"" + acc.getNumber() + "\">" + acc.getNumber() + "</option>";
    }
    
    response.getWriter().write(msg);
%>