<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String departmentId = request.getParameter("departmentId");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
%>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Salary ID</th>
            <th>Employee Name</th>
            <th>Basic Salary</th>
            <th>Allowance</th>
            <th>Total Salary</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");

            String sql = "SELECT salary.id, emp_name, basic_salary, allowance, total " +
                         "FROM salary " +
                         "JOIN addEmployee ON salary.employeeId = addEmployee.id " +
                         "WHERE addEmployee.department_id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(departmentId));
            rs = stmt.executeQuery();

            while (rs.next()) {
                int employeeId = rs.getInt("id");
                String employeeName = rs.getString("emp_name");
                long basicSalary = rs.getLong("basic_salary");
                long allowance = rs.getLong("allowance");
                long totalSalary = rs.getLong("total");
        %>
        <tr>
            <td><%= employeeId %></td>
            <td><%= employeeName %></td>
            <td><%= basicSalary %></td>
            <td><%= allowance %></td>
            <td><%= totalSalary %></td>
            <td>
                <button class="btn btn-danger" onclick="showDeleteModal(<%= employeeId %>)">Delete</button>
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
    </tbody>
</table>
