<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<jsp:useBean id="user" class="user.admin.Manager" scope="session" />
<jsp:useBean id="searchedClient" class="user.client.Client" scope="session" />
<%
    if(DBconnection.deleteAccount(request.getParameter("number"))) {
        searchedClient.deleteAccount(request.getParameter("number"));
        response.sendRedirect("masterAdmin.jsp");
    }
    else response.sendRedirect("masterAdmin.jsp?wrong=1");
%>
<jsp:setProperty name="searchedClient" property="accounts" value= "<%= searchedClient.getAccounts() %>" />