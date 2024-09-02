package com.admin;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin")
public class AdminLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM admin WHERE user_name = ? AND password = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid username or password. Please try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminLogin.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
