<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String employeeId = request.getParameter("employeeId");

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");

        String sql = "DELETE FROM salary WHERE id=?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(employeeId));
        stmt.executeUpdate();

        out.println("Employee salary record deleted successfully!");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
