/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author mbarr
 */
@WebServlet(urlPatterns = {"/dAuthor"})
public class dAuthor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String authorNum = request.getParameter("authorNum");
            // Search Book by title, show inventory availability, brach, author name, and publisher Information
            //String sql = "SELECT * FROM BOOK WHERE TITLE='" + bookTitle +"'"; 
            String sql = "DELETE FROM author WHERE authorNum = " + authorNum;
        
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/assignment2?zeroDateTimeBehavior=convertToNull";
            String username = "root";
            String password = "jovem";
            Connection conn = DriverManager.getConnection(url, username, password);

            PreparedStatement ps = conn.prepareStatement(sql);
            int i = ps.executeUpdate();
            if (i > 0) {
                // Go back to the same webpage
                RequestDispatcher rd = request.getRequestDispatcher("vAuthor.jsp");
                rd.forward(request, response);
                System.out.println("IT WORKED " + i + " " + authorNum);
            }
            else {
                System.out.println("NO");
            }
        }
        catch (Exception ex) {
           System.out.println("ERROR: " + ex.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
