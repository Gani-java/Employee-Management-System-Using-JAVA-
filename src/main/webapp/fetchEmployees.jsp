<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String departmentId = request.getParameter("departmentId");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");

        String sql = "SELECT id, emp_name FROM addEmployee WHERE department_id=?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(departmentId));
        rs = stmt.executeQuery();

        while (rs.next()) {
            int employeeId = rs.getInt("id");
            String employeeName = rs.getString("emp_name");
%>
    <tr>
        <td>
            <%= employeeName %>
            <input type="hidden" name="employeeId[]" value="<%= employeeId %>">
        </td>
        <td>
            <input type="number" id="basic_salary_<%= employeeId %>" name="basic_salary[]" class="form-control" onchange="calculateTotal('<%= employeeId %>')">
        </td>
        <td>
            <input type="number" id="allowance_<%= employeeId %>" name="allowance[]" class="form-control" onchange="calculateTotal('<%= employeeId %>')">
        </td>
        <td>
            <input type="number" id="total_salary_<%= employeeId %>" name="total_salary[]" class="form-control" readonly>
        </td>
    </tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
