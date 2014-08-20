<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<jsp:useBean id="searchedClient" class="user.client.Client" scope="session" />
<%
    if(DBconnection.deleteClient(searchedClient)) response.sendRedirect("masterAdmin.jsp");
    else response.sendRedirect("masterAdmin.jsp?wrong=1");
%>
<c:remove var="searchedClient" scope="session" />