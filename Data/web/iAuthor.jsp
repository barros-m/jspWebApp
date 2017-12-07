<%-- 
    Document   : iAuthor
    Created on : Dec 5, 2017, 10:58:51 PM
    Author     : mbarr
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert</title>
    </head>
    <body>
        <%
            
            // Try to get user input
            String authorNum = request.getParameter("authorNum");
            String authorLast = request.getParameter("authorLast");
            String authorFirst = request.getParameter("authorFirst");
            
            String sql = "INSERT INTO AUTHOR(authorNum, authorLast, authorFirst) VALUES ('" 
                    + authorNum + "','" + authorLast+ "','" + authorFirst+ "')"; 
                    
            try {
                // Connect to Database
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/assignment2?zeroDateTimeBehavior=convertToNull";
            String username = "root";
            String password = "jovem";
            Connection conn = DriverManager.getConnection(url, username, password);
            
                int action = conn.createStatement().executeUpdate(sql);
                conn.setAutoCommit(true);
                
                if (action>=1) {
                    out.println("Good Job... try to View your new information");
                }
                else{
                    out.println("Cannot save... duplicated... check Author Id");
                }
            }
            catch (Exception e) {
                out.println("ERROR: " + e.getMessage());
                out.println("Try another key, or check the error message");
            }
        %>
    </body>
</html>
