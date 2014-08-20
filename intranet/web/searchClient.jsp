<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<jsp:useBean id="searchedClient" class="user.client.Client" scope="session" />

<%
    String msg = "There is no client with these information! Try something else!"; //default error message
    
    //build query
    String query = "SELECT * FROM users WHERE ";
    if(request.getParameter("password") != null) {
        query += "password = '" + request.getParameter("password") + "'";
    }
    else {
        query += "name = '" + request.getParameter("fname") + "' AND surname = '" + request.getParameter("lname") + "'";
    }
    
    searchedClient = DBconnection.createClient(query);
    if(searchedClient != null) { //if found fill client info
        searchedClient.setAccounts(DBconnection.getAccounts(searchedClient.getAfm()));
        msg = "<h3 style=\"text-align:center\">Client Information</h3><li><span class=\"li\">First Name: " + searchedClient.getFname() + "</span></li><li><span class=\"li\">Last Name: " + searchedClient.getLname() + "</span></li><li><span class=\"li\">Password: " + searchedClient.getPassword() + "</span></li><li><span class=\"li\">Birth Date: " + searchedClient.getStringBirthDate() + "</span></li><li><span class=\"li\">Gender: " + (searchedClient.isMale()?"male":"female") + "</span></li><li><span class=\"li\">Home Address: " + searchedClient.getHomeAddress() + "</span></li><li><span class=\"li\">Work Address: " + searchedClient.getWorkAddress() + "</span></li><li><span class=\"li\">Marital Status: " + (searchedClient.isMarried()?"married":"single") + "</span></li><li><span class=\"li\">AFM: " + searchedClient.getAfm() + "</span></li><li><span class=\"li\">Bank Account: " + searchedClient.getBankAccount() + "</span></li>";
    }
    
    response.getWriter().write(msg);
%>
<!-- if found fill session bean -->
<c:if test="<%= !(msg.equals("There is no client with these information! Try something else!")) %>" >
    <jsp:setProperty name="searchedClient" property="fname" value= "<%= searchedClient.getFname() %>" />
    <jsp:setProperty name="searchedClient" property="lname" value= "<%= searchedClient.getLname() %>" />
    <jsp:setProperty name="searchedClient" property="afm" value= "<%= searchedClient.getAfm() %>" />
    <jsp:setProperty name="searchedClient" property="birthDate" value= "<%= searchedClient.getBirthDate() %>" />
    <jsp:setProperty name="searchedClient" property="homeAddress" value= "<%= searchedClient.getHomeAddress() %>" />
    <jsp:setProperty name="searchedClient" property="workAddress" value= "<%= searchedClient.getWorkAddress() %>" />
    <jsp:setProperty name="searchedClient" property="gender" value= "<%= searchedClient.isMale() %>" />
    <jsp:setProperty name="searchedClient" property="married" value= "<%= searchedClient.isMarried() %>" />
    <jsp:setProperty name="searchedClient" property="accounts" value= "<%= searchedClient.getAccounts() %>" />
    <jsp:setProperty name="searchedClient" property="bankAccount" value= "<%= searchedClient.getBankAccount() %>" />
    <jsp:setProperty name="searchedClient" property="relations" value= "<%= searchedClient.getRelations() %>" />
    <jsp:setProperty name="searchedClient" property="password" value= "<%= searchedClient.getPassword() %>" />
</c:if>