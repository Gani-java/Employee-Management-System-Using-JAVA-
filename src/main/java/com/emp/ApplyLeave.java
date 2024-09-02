package com.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myLeave")
public class ApplyLeave extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve leave request parameters
        String reason = request.getParameter("reason");
        String leaveFrom = request.getParameter("leave_from");
        String leaveTo = request.getParameter("leave_to");
        String description = request.getParameter("description");

        // Retrieve employeeId from session
        HttpSession session = request.getSession();
        String employeeId = (String) session.getAttribute("employeeId");

        Connection con = null;
        PreparedStatement ps = null;
        String url = "jdbc:mysql://localhost:3306/ems";
        String user = "root";
        String password = "Gani@2000";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

            String query = "INSERT INTO leavetable (employee_id, leave_reason, leave_from, leave_to, description) VALUES (?, ?, ?, ?, ?);";
            ps = con.prepareStatement(query);
            ps.setString(1, employeeId);
            ps.setString(2, reason);
            ps.setString(3, leaveFrom);
            ps.setString(4, leaveTo);
            ps.setString(5, description);

            int a = ps.executeUpdate();

            if (a > 0) {
                request.setAttribute("showSuccessModal", "true");
            } else {
                request.setAttribute("showSuccessModal", "false");
            }
            request.getRequestDispatcher("ApplyLeave.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
