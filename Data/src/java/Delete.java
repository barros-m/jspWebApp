/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mbarr
 */
import java.sql.*;
public class Delete {
    public void delete_value(String table, String keyAtt, String keyValue) throws ClassNotFoundException, SQLException {        
        try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/assignment2?zeroDateTimeBehavior=convertToNull";
        String username = "root";
        String password = "jovem";
        String sql = "DELETE FROM " + table + " WHERE " + keyAtt + " = " + keyValue;
        Connection conn = DriverManager.getConnection(url, username, password);
        
        PreparedStatement ps = null;
        ps=conn.prepareCall(sql);
        ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Could not delete");
        }
    }
}
