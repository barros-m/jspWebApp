<%-- 
    Document   : searchBook
    Created on : Dec 6, 2017, 11:40:10 AM
    Author     : mbarr
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            
            // Try to get user input
            String bookTitle = request.getParameter("bookTitle");
            // Search Book by title, show inventory availability, brach, author name, and publisher Information
            //String sql = "SELECT * FROM BOOK WHERE TITLE='" + bookTitle +"'"; 
            String sql = "SELECT title, OnHand, branchName, authorLast, authorFirst, publisherName FROM book NATURAL JOIN inventory NATURAL JOIN branch NATURAL JOIN author NATURAL JOIN publisher NATURAL JOIN wrote WHERE title = '" + bookTitle + "'";      
            //String sqlCount = "SELECT COUNT(*) FROM book NATURAL JOIN inventory NATURAL JOIN branch NATURAL JOIN author NATURAL JOIN publisher NATURAL JOIN wrote WHERE title = '" + bookTitle + "'";
            try {
                // Connect to Database
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/assignment2?zeroDateTimeBehavior=convertToNull";
            String username = "root";
            String password = "jovem";
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();
               
            ResultSet rs = stmt.executeQuery(sql);
            System.out.println("HELLO");
            //ResultSet count = stmt.executeQuery(sqlCount);
            %>
            <table border ="1">
                <th>Book Title</th>
                <th>Availability</th>
                <th>Branch Name</th>
                <th>Author Last Name</th>
                <th>Author First Name</th>
                <th>Publisher Name</th>
            <%
                    while(rs.next()) { %>
                    <tr>
                        <td><%=rs.getString("title")%></td>
                        <td><%=rs.getString("onHand")%></td>
                        <td><%=rs.getString("branchName")%></td>
                        <td><%=rs.getString("authorLast")%></td>
                        <td><%=rs.getString("authorFirst")%></td>
                        <td><%=rs.getString("publisherName")%></td>
                    </tr>
                    <%
                    }
            %></table><%
            }
            catch (Exception e) {
                out.println("ERROR: " + e.getMessage());
                out.println("Try another key, or check the error message");
            }
        %>
    </body>
</html>
