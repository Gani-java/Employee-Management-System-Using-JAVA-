package com.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/addEmployee")
public class AddEmployee extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String department = request.getParameter("department");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");

        String dob = request.getParameter("dob");
        String doj = request.getParameter("doj");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String address = request.getParameter("address");
        String pssword = request.getParameter("pass");
        String confirm_password = request.getParameter("confirmPass");

        Part file = request.getPart("Image");
        String imageFileName = file.getSubmittedFileName();

        String uploadImage = "G:/Git-Hub (My Projects)/Web Based EMS Project/EMS-Project/src/main/webapp/UsersImages/" + imageFileName;
        
        try {
            FileOutputStream fos = new FileOutputStream(uploadImage);
            InputStream is = file.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);

            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");
            

            String query = "insert into addEmployee (emp_name, department_id, gender, email, mobile, pic, dob, doj, city, state, country,address,password,confirm_password)values(?,?,?,?,?,?,?,?,?, ?,?,?,?,?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, fullName);
            pstmt.setString(2, department);
            pstmt.setString(3, gender);
            pstmt.setString(4, email);
            pstmt.setString(5, mobile);
            pstmt.setString(6, imageFileName);
            pstmt.setString(7, dob);
            pstmt.setString(8, doj);
            pstmt.setString(9, city);
            pstmt.setString(10, state);
            pstmt.setString(11, country);
            pstmt.setString(12, address);
            pstmt.setString(13, pssword);
            pstmt.setString(14, confirm_password);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
            	response.sendRedirect("addEmployee.jsp?success=true");
            } else {
            	response.sendRedirect("adminDashboard.jsp?success=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
