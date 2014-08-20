<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="request" />
<jsp:useBean id="generator" class="utilities.GeneratePassword" scope="request"/>
<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:useBean id="searchedClient" class="user.client.Client" scope="session" />

<%
    String fname = request.getParameter("fnameMod");
    String lname = request.getParameter("lnameMod");
    String bdate = request.getParameter("byear")+"-"+request.getParameter("bmonth")+"-"+request.getParameter("bday");
    String gender = request.getParameter("genderMod");
    String hadd = request.getParameter("haddMod");
    String wadd = request.getParameter("waddMod");
    String married = request.getParameter("marriedMod");
    String afm = request.getParameter("afmMod");
    String bacc = request.getParameter("baccMod");
    Date date = new SimpleDateFormat("yyyy-MM-dd").parse(bdate);
    boolean genderb = gender.equals("1");
    boolean marriedb = married.equals("1");
    
    String query = "UPDATE users SET name='"+fname+"', surname='"+lname+"', birthDate='"+bdate+"', gender="+gender+", homeAddress='"+hadd+"', workAddress='"+wadd+"', isMarried="+married+", afm='"+afm+"', bankAccount='"+bacc+"' WHERE password='"+searchedClient.getPassword()+"';";
    
    if(DBconnection.setDBdata(query)){
       if(user instanceof user.admin.SalesRep){
            response.sendRedirect("salesAdmin.jsp?mod=1"); 
        }else{
            response.sendRedirect("masterAdmin.jsp?mod=1");
        }
    }
    else{
        response.sendRedirect("modifyClientInfo.jsp?wrong=1");
    }
%>
<!-- update session bean -->
<jsp:setProperty name="searchedClient" property="fname" value= "<%= fname %>" />
<jsp:setProperty name="searchedClient" property="lname" value= "<%= lname %>" />
<jsp:setProperty name="searchedClient" property="afm" value= "<%= afm %>" />
<jsp:setProperty name="searchedClient" property="birthDate" value= "<%= date %>" />
<jsp:setProperty name="searchedClient" property="homeAddress" value= "<%= hadd %>" />
<jsp:setProperty name="searchedClient" property="workAddress" value= "<%= wadd %>" />
<jsp:setProperty name="searchedClient" property="gender" value= "<%= genderb %>" />
<jsp:setProperty name="searchedClient" property="married" value= "<%= marriedb %>" />
<jsp:setProperty name="searchedClient" property="bankAccount" value= "<%= bacc %>" />