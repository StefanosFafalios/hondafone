<jsp:useBean id="sessionInfo" class="misc.SessionInfo" scope="session" />
<%-- start web service invocation --%>
<%
try {
        logreg.Logreg_Service service = new logreg.Logreg_Service();
        logreg.Logreg port = service.getLogregPort();
         // TODO initialize WS operation arguments here
        java.lang.String username = request.getParameter("username");
        java.lang.String password = request.getParameter("pass");
        // TODO process result here
        java.util.List<java.lang.String> result = port.login(username, password);
        if(result.size() == 0) {
            response.sendRedirect("login.jsp?error=1");
        }
        else {
            java.util.ArrayList temparray = new java.util.ArrayList();
            int i;
            for(i=0; !result.get(i).startsWith("account") && !result.get(i).equals("no more accounts!"); i++) {
                temparray.add(result.get(i));
            }
            sessionInfo.setClientInfo(temparray);
            
            if(!result.get(i).equals("no more accounts!")) {
                java.util.ArrayList<java.util.ArrayList<String>> temparray1 = new java.util.ArrayList();
                int j=0;
                i++;
                temparray1.add(new java.util.ArrayList<String>());
                while(!result.get(i).equals("no more accounts!")) {
                    if(result.get(i).startsWith("account") && !result.get(i).startsWith("accountInfo")) {
                        j++;
                        temparray1.add(new java.util.ArrayList<String>());
                        i++;
                        continue;
                    }
                    if(result.get(i).startsWith("accountInfo")) {
                        i++;
                        continue;
                    }
                    temparray1.get(j).add(result.get(i));
                    i++;
                }
                sessionInfo.setAccounts(temparray1);
            }
            
            response.sendRedirect("index.jsp");
        }
} catch (Exception ex) {
    // TODO handle custom exceptions here
}
%>
<%-- end web service invocation --%>