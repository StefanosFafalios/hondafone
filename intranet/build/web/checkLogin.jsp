<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />

<% 
    String password = request.getParameter("pwd"); //get password
    session.setAttribute("password", password);
    //check the instance of the user (SalesRep, Manager or Client)
    String query = "SELECT instanceof FROM users WHERE password = '"+password+"'";
    ResultSet res = DBconnection.getDBdata(query);
    
    if(!res.next()){ //if wasn't found
        response.sendRedirect("index.jsp?wrong=1");
    }
    else {        
        if(res.getString("instanceof").equals("manager")) {
            response.sendRedirect("masterAdmin.jsp");
        }
        else if(res.getString("instanceof").equals("salesrep")) {
            response.sendRedirect("salesAdmin.jsp");
        }
        else {
            response.sendRedirect("clientMain.jsp");
        }
    }
%>