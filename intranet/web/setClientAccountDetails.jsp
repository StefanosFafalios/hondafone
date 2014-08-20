<!-- !!!!!FOR INTERNET APP!!!!! -->

<%@page import="java.text.DecimalFormat"%>
<%@page import="account.Account"%>
<jsp:useBean id="DBconnection" class="database.DBconnection" scope="page" />
<jsp:useBean id="user" class="user.client.Client" scope="session" />
<% 
    String msg = "Something went wrong!"; //default error string
    for(Account acc : user.getAccounts()) {
        if(acc.getNumber().equals(request.getParameter("number"))) { //if found fill account's info
            String[] afms = acc.getOwners();
            msg = "<h3 style=\"text-align:center\">Account Information</h3>" + "<ul name=\"details\">" + "<li><span class=\"li\">Number: " + acc.getNumber() + "</span></li>" + "<li><span class=\"li\">Credit: " + new DecimalFormat("#.##").format((double) ( (double) acc.getTime() / 60)) + " &euro;</span></li>" + "<li><span class=\"li\">Time: " + acc.getTime() + " minutes</span></li>" + "<li><span class=\"li\">Owners: " + DBconnection.findClientName(afms[0]) + ((afms[1] == null)?" ":", " + DBconnection.findClientName(afms[1])) + "</span></li>" + "</ul>";
            break;
        }
    }
    response.getWriter().write(msg);
%>