<!-- !!!!!FOR INTERNET APP!!!!! -->

<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="request" />
<jsp:useBean id="generator" class="utilities.GeneratePassword" scope="request"/>

<%
    String fname = request.getParameter("fnameReg");
    String lname = request.getParameter("lnameReg");
    String bdate = request.getParameter("byear")+"-"+request.getParameter("bmonth")+"-"+request.getParameter("bday");
    String gender = request.getParameter("genderReg");
    String hadd = request.getParameter("haddReg");
    String wadd = request.getParameter("waddReg");
    String married = request.getParameter("marriedReg");
    String afm = request.getParameter("afmReg");
    String bacc = request.getParameter("baccReg");
    
    String password = generator.genPass(); //generate unique password
    
    System.out.println(password);
    
    String query = "INSERT INTO users (password, name, surname, birthDate, gender, homeAddress, workAddress, isMarried, afm, bankAccount) VALUES('"+password+"', '"+fname+"', '"+lname+"', '"+bdate+"', "+gender+", '"+hadd+"', '"+wadd+"', "+married+", '"+afm+"', '"+bacc+"');";
    if(DBconnection.setDBdata(query)){
       response.sendRedirect("index.jsp?pass="+password);
    }
    else{
        response.sendRedirect("register.jsp?wrong=1");
    }
            
%>