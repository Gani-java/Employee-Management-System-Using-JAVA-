package com.admin;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/dept")
public class AddDepartment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String departmentName = request.getParameter("departmentName");
        if (departmentName != null && !departmentName.trim().isEmpty()) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            String sql = "INSERT INTO department_tbl (department_name) VALUES (?)";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, departmentName);
                int result = pstmt.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("addDepartment.jsp?success=true");
                } else {
                    response.sendRedirect("addDepartment.jsp?success=false");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }
}
