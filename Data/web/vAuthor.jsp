<%-- 
    Document   : view
    Created on : Dec 5, 2017, 7:42:42 PM
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
        <h1>All Books</h1>
        
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/assignment2?zeroDateTimeBehavior=convertToNull";
                String username = "root";
                String password = "jovem";
                String sql = "SELECT * FROM AUTHOR";
                Connection conn = DriverManager.getConnection(url, username, password);
                Statement stmt = conn.createStatement();
                
                ResultSet rs = stmt.executeQuery(sql);
                %>
                    <table border ="1">
                    <th>Author Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Delete</th>
                    <th>Edit</th>
            <%
                while(rs.next()) { %>
                
                    <tr>
                        <td><%=rs.getString("authorNum")%></td>
                        <td><%=rs.getString("authorLast")%></td>
                        <td><%=rs.getString("authorFirst")%></td>
                        <td><a href="dAuthor?authorNum=<%=rs.getString("authorNum")%>">Delete</a></td>
                        <td><a href="eAuthor.jsp?authorNum=<%=rs.getString("authorNum")%>">Edit</a></td>
                    </tr>
                
                    <%
                }
                %></table><%
            }
            catch(Exception ex) {
                System.err.println(ex.getMessage());
            }
        %>
    </body>
</html>
