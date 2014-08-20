<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<%@ page import="java.lang.Math" %>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:useBean id="searchedClient" class="user.client.Client" scope="session" />
<jsp:useBean id="numGenerator" class="utilities.GenerateNumber" scope="page" />

<%
    //check instance of admin. SalesRep cannot give account if client already has 6
    if(user instanceof user.admin.SalesRep){
        if(searchedClient.getAccounts().size() >= 6){
            response.sendRedirect("salesAdmin.jsp");
        }
    }
    
    String number = numGenerator.generateNumber(); //generate unique phone number
    if(number == null) response.sendRedirect("createAccount.jsp");
    
    String createAcc = "INSERT INTO accounts (credit, time, owner1, owner2, phoneNumber) VALUES(0, 0, '"+searchedClient.getAfm()+"', null, '"+number+"');";
    if(DBconnection.setDBdata(createAcc)){
        if(user instanceof user.admin.SalesRep){
            response.sendRedirect("salesAdmin.jsp?number="+number);
        }
        else if(user instanceof user.admin.Manager) {
            response.sendRedirect("masterAdmin.jsp?number="+number);
        }
        else {
            response.sendRedirect("clientMain.jsp?number="+number);
        }
    }
    else{
        if(user instanceof user.admin.SalesRep){
            response.sendRedirect("salesAdmin.jsp?wrong=1");
        }
        else if(user instanceof user.admin.Manager) {
            response.sendRedirect("masterAdmin.jsp?wrong=1");
        }
        else {
            response.sendRedirect("clientMain.jsp?wrong=1");
        }
    }
    
%>