<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    String[] employeeIds = request.getParameterValues("employeeId[]");
    String[] basicSalaries = request.getParameterValues("basic_salary[]");
    String[] allowances = request.getParameterValues("allowance[]");
    String[] totalSalaries = request.getParameterValues("total_salary[]");

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");

        String sql = "INSERT INTO salary (employeeId, basic_salary, allowance, total, added_by, updated_on) VALUES (?, ?, ?, ?, ?, ?)";

        for (int i = 0; i < employeeIds.length; i++) {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(employeeIds[i]));
            stmt.setLong(2, Long.parseLong(basicSalaries[i]));
            stmt.setLong(3, Long.parseLong(allowances[i]));
            stmt.setLong(4, Long.parseLong(totalSalaries[i]));
            stmt.setInt(5, 1); // Assuming 'added_by' is the admin with ID 1
            stmt.setDate(6, new java.sql.Date(System.currentTimeMillis())); // 'updated_on' is set to the current date

            stmt.executeUpdate();
        }

        out.println("<h3 style='margin-top:140px;margin-left:260px;background-color:rgb(75,181,67);width:500px'>Salaries added successfully!..</h3>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3 style='margin-top:140px;margin-left:260px;background-color:rgb(255,51,51);width:500px'>Error adding salaries!</h3>");
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
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
        <h1>Salary</h1>
    </div>
       <div class="breadcrumb">
        <span class="breadcrumb-item">
            <i class="fas fa-home"></i> Home
        </span>
        <span class="breadcrumb-item">Dashboard</span>
        <span class="breadcrumb-item">Manage Employee Salaries</span>
    </div>
</div>


<div class="container" style="margin-top:80px;margin-left:257px">
    <a href="addSalary.jsp" class="btn btn-primary">Back to add Salaries</a>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
