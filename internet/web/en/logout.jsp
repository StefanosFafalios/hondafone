<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:remove var="sessionInfo" scope="session" />
<% response.sendRedirect("index.jsp"); %>