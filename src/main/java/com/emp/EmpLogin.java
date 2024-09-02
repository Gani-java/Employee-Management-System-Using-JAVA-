package com.emp;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/emp")
public class EmpLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String pass = request.getParameter("pass");
	    
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");
	        
	        String sql = "SELECT id,pic,emp_name FROM addEmployee WHERE email = ? AND password = ?";
	        stmt = conn.prepareStatement(sql);
	        stmt.setString(1, email);
	        stmt.setString(2, pass);
	        
	        
	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            String empName = rs.getString("emp_name");
                String imgFileName = rs.getString("pic");
                String empId = rs.getString("id");
	            
                HttpSession session = request.getSession();
	            session.setAttribute("empName", empName);
	            session.setAttribute("profileImage", imgFileName);
	            session.setAttribute("employeeId", empId);
	            
	            
	            response.sendRedirect("EmployeeDashboard.jsp");
	          
	        } else {
	            request.setAttribute("errorMessage", "Invalid email or password");
	            request.getRequestDispatcher("EmpLogin.jsp").forward(request, response);
	        }
	        
	        rs.close();
	        stmt.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
