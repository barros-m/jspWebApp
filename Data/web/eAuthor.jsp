<%-- 
    Document   : eAuthor
    Created on : Dec 6, 2017, 5:23:44 PM
    Author     : mbarr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update Author</h1>
        
        <form name="updateServlet" method="post">
            <%String authorId = request.getParameter("authorNum");%>
            Author Last Name: <input type="text" name="aLast">
            Author First Name: <input type="text" name="aFirst">
            <button type="submit">Update</button>
        </form>
    </body>
</html>

<%
    

%>