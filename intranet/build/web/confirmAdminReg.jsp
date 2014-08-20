<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="request" />
<jsp:useBean id="generator" class="utilities.GeneratePassword" scope="request"/>
<jsp:useBean id="user" class="user.User" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
    
    String query = "INSERT INTO users (password, name, surname, birthDate, gender, homeAddress, workAddress, isMarried, afm, bankAccount) VALUES('"+password+"', '"+fname+"', '"+lname+"', '"+bdate+"', "+gender+", '"+hadd+"', '"+wadd+"', "+married+", '"+afm+"', '"+bacc+"');";
    if(DBconnection.setDBdata(query)){
       if(user instanceof user.admin.SalesRep){
            response.sendRedirect("salesAdmin.jsp?pass="+password); 
        }else{
            response.sendRedirect("masterAdmin.jsp?pass="+password);
        }
    }
    else{
        response.sendRedirect("newClient.jsp?wrong=1");
    }
%>