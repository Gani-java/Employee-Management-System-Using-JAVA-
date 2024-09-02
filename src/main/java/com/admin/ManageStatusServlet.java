package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ManageStatusServlet")
public class ManageStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String departmentName = request.getParameter("department_name");
        String employeeId = request.getParameter("employee_id");
        String status = request.getParameter("status");

        Connection con = null;
        PreparedStatement ps = null;
        String url = "jdbc:mysql://localhost:3306/ems";
        String user = "root";
        String password = "Gani@2000";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

            String query = "UPDATE leavetable SET status = ? WHERE employee_id = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, employeeId);
            
            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("LeaveHistory.jsp");
            } else {
                response.getWriter().println("Failed to update the leave request.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
