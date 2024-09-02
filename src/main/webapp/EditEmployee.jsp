<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.*"%>

<%
    String empId = request.getParameter("id");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs3 = null;
    Statement stmt = null;
    Statement stmt2 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;

    List<String[]> departments = new ArrayList<>();
    List<String[]> countries = new ArrayList<>();

    String emp_name = "", department_id = "", city = "", state = "", country = "", address = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");

        // Fetch employee details
        String sql = "SELECT * FROM addEmployee WHERE id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, empId);
        rs3 = pstmt.executeQuery();

        if (rs3.next()) {
            emp_name = rs3.getString("emp_name");
            department_id = rs3.getString("department_id");
            city = rs3.getString("city");
            state = rs3.getString("state");
            country = rs3.getString("country");
            address = rs3.getString("address");
        }

        // Fetch departments
        String sqlDept = "SELECT id, department_name FROM department_tbl";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sqlDept);

        while (rs.next()) {
            String dept_id = rs.getString("id");
            String dept_name = rs.getString("department_name");
            departments.add(new String[] {dept_id, dept_name});
        }

        // Fetch countries
        String sqlCountry = "SELECT id, country_name FROM country_tbl";
        stmt2 = conn.createStatement();
        rs2 = stmt2.executeQuery(sqlCountry);

        while (rs2.next()) {
            String cn_id = rs2.getString("id");
            String cn_name = rs2.getString("country_name");
            countries.add(new String[] {cn_id, cn_name});
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs3 != null) try { rs3.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (rs2 != null) try { rs2.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt2 != null) try { stmt2.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/Navbar_Header_Footer.css">
    <style>
        .custom-container {
            background-color: white;
            margin-left: 275px;
            margin-top: 120px;
            width: 1050px;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .custom-container h3 {
            color: #007bff;
            margin-bottom: 20px;
        }

        .custom-container hr {
            border-top: 3px solid #007bff;
            margin-top: 0;
        }

        .custom-container .form-group label {
            font-weight: bold;
        }

        .custom-container .btn-submit {
            background-color: #28a745;
            color: white;
        }
    </style>
</head>
<body>
<div class="vertical-nav">
    <div class="admin-profile">
        <img src="images/Image.JPG" alt="Admin Avatar" class="hov">
        <div>
            <h4>Administrator</h4>
            <p class="hov"><i class="fas fa-circle" style="color: #28a745; font-size: 10px;"></i> Online</p>
        </div>
    </div>

    <div class="navbar-header">MAIN NAVIGATION</div>

    <ul class="nav flex-column">
                <li class="nav-item">
            <a class="nav-link" href="adminDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#departmentMenu" role="button" aria-expanded="false" aria-controls="departmentMenu">
                <i class="fas fa-building"></i> Department
            </a>
            <div class="collapse" id="departmentMenu">
                <a class="nav-link" href="addDepartment.jsp"><i class="fas fa-plus-circle"></i> Add Department</a>
                <a class="nav-link" href="ManageDepartment.jsp"><i class="fas fa-cogs"></i> Manage Department</a>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#staffMenu" role="button" aria-expanded="false" aria-controls="staffMenu">
                <i class="fas fa-user-tie"></i> Employee
            </a>
            <div class="collapse" id="staffMenu">
                <a class="nav-link" href="addEmployee.jsp"><i class="fas fa-user-plus"></i> Add Employee</a>
                <a class="nav-link" href="ManageEmployee.jsp"><i class="fas fa-users-cog"></i> Manage Employee</a>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#salaryMenu" role="button" aria-expanded="false" aria-controls="salaryMenu">
                <i class="fas fa-money-check-alt"></i> Salary
            </a>
            <div class="collapse" id="salaryMenu">
                <a class="nav-link" href="addSalary.jsp"><i class="fas fa-dollar-sign"></i> Add Salary</a>
                <a class="nav-link" href="ManageSalary.jsp"><i class="fas fa-wallet"></i> Manage Salary</a>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#leaveMenu" role="button" aria-expanded="false" aria-controls="leaveMenu">
                <i class="fas fa-calendar-alt"></i> Leave
            </a>
            <div class="collapse" id="leaveMenu">
                <a class="nav-link" href="Manage Employee Leave.jsp"><i class="fas fa-user-clock"></i> Manage Employee Leave</a>
                <a class="nav-link" href="LeaveHistory.jsp"><i class="fas fa-history"></i> Leave History</a>
            </div>
        </li>
        
       
    </ul>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
    <a class="navbar-brand" href="#">Employee Management System</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="adminDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="images/Image.JPG" alt="Admin Avatar" class="rounded-circle" style="width: 30px; height: 30px; margin-right: 10px;">
                    Admin
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="adminDropdown">
                    <a class="dropdown-item" href="#">
                        <img src="images/Image.JPG" alt="Admin Avatar" class="rounded-circle" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="index.jsp">Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<div class="page-header d-flex justify-content-between align-items-center">
    <div>
        <h1>Employees</h1>
    </div>
    <div class="breadcrumb">
        <span class="breadcrumb-item">
            <i class="fas fa-home"></i> Home
        </span>
        <span class="breadcrumb-item">Dashboard</span>
        <span class="breadcrumb-item">Manage Employees</span>
    </div>
</div>


<div class="custom-container">
    <hr>
    <h2>Edit Employee</h2>
    <form method="post" action="UpdateEmployee.jsp">
        <input type="hidden" name="id" value="<%= empId %>">
        
        <div class="form-row">
            <div class="form-group col-md-6">
                <label>Name</label>
                <input type="text" class="form-control" name="emp_name" value="<%= emp_name %>">
            </div>

            <div class="form-group col-md-6">
                <label>Department</label>
                <select id="department" name="department" class="form-control" required>
                    <option value="" disabled>Select a department</option>
                    <% for (String[] dept : departments) { %>
                        <option value="<%= dept[0] %>" <%= dept[0].equals(department_id) ? "selected" : "" %>>
                            <%= dept[1] %>
                        </option>
                    <% } %>
                </select>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label>City</label>
                <input type="text" class="form-control" name="city" value="<%= city %>">
            </div>
            <div class="form-group col-md-6">
                <label>State</label>
                <input type="text" class="form-control" name="state" value="<%= state %>">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="country">Country</label> 
                <select id="country" name="country" class="form-control" required>
                    <option value="" disabled>Select a country</option>
                    <% for (String[] cnt : countries) { %>
                        <option value="<%= cnt[0] %>" <%= cnt[0].equals(country) ? "selected" : "" %>>
                            <%= cnt[1] %>
                        </option>
                    <% } %>
                </select>
            </div>

            <div class="form-group col-md-6">
                <label>Address</label>
                <textarea class="form-control" name="address"><%= address %></textarea>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
