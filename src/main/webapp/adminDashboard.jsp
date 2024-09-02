<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/Navbar_Header_Footer.css">
<style>
.container-box {
    display: flex;
    justify-content: space-between;
    padding: 20px;
    gap: 20px;
    margin-left: 260px;
    margin-top: 150px; 
}

.box {
    background: white;
    border-radius: 5px;
    box-shadow: 0 8px 16px gray;
    flex: 1;
    padding: 20px;
    color: white;
    text-align: left;
    position: relative;
}

.box h2 {
    margin: 0;
    font-size: 36px;
}

.box p {
    margin: 10px 0;
    font-size: 14px;
}

.box .more-info {
    color: #ffffff;
    text-decoration: none;
    font-size: 14px;
}

.box.blue {
    background-color: #007bff;
}

.box.pink {
    background-color: #e83e8c;
}

.box.orange {
    background-color: #fd7e14;
}

.box.green {
    background-color: #28a745;
}

.box i {
    font-size: 24px;
    position: absolute;
    top: 20px;
    right: 20px;
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

<div class="page-header">
    <div style="display:flex">
        <div><h1>Dashboard</h1></div>
        <div><h4>Control Panel</h4></div>
    </div>
	<div class="breadcrumb">
    <span class="breadcrumb-item">
        <i class="fas fa-home"></i> Home
    </span>
    <span class="breadcrumb-item">Dashboard</span>
	</div>
</div>


<%@ page import="java.sql.*" %>
<% 
    int departmentCount = 0;
    int employeeCount = 0;
    long totalSalary = 0;  // Use long to accommodate large salary values
    int leaveRequestCount = 0; // Variable to store the number of leave requests

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");

        // Count departments
        String sqlDept = "SELECT COUNT(*) FROM department_tbl";
        PreparedStatement stmtDept = conn.prepareStatement(sqlDept);
        ResultSet rsDept = stmtDept.executeQuery();
        if (rsDept.next()) {
            departmentCount = rsDept.getInt(1);
        }
        rsDept.close();
        stmtDept.close();

        // Count employees
        String sqlEmp = "SELECT COUNT(*) FROM addEmployee";
        PreparedStatement stmtEmp = conn.prepareStatement(sqlEmp);
        ResultSet rsEmp = stmtEmp.executeQuery();
        if (rsEmp.next()) {
            employeeCount = rsEmp.getInt(1);
        }
        rsEmp.close();
        stmtEmp.close();

        // Total salary paid
        String sqlSal = "SELECT SUM(total) FROM salary";
        PreparedStatement stmtSal = conn.prepareStatement(sqlSal);
        ResultSet rsSal = stmtSal.executeQuery();
        if (rsSal.next()) {
            totalSalary = rsSal.getLong(1);
        }
        rsSal.close();
        stmtSal.close();

        // Count leave requests
        String sqlLeave = "SELECT COUNT(*) FROM leavetable";
        PreparedStatement stmtLeave = conn.prepareStatement(sqlLeave);
        ResultSet rsLeave = stmtLeave.executeQuery();
        if (rsLeave.next()) {
            leaveRequestCount = rsLeave.getInt(1);
        }
        rsLeave.close();
        stmtLeave.close();

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<div class="container-box">
    <div class="box blue">
        <i class="fas fa-building"></i>
        <h2><%= departmentCount %></h2>
        <p>Departments</p>
        <a href="#" class="more-info">More Info</a>
    </div>
    <div class="box pink">
        <i class="fas fa-users"></i>
        <h2><%= employeeCount %></h2>
        <p>Employees</p>
        <a href="#" class="more-info">More Info</a>
    </div>
    <div class="box orange">
        <i class="fas fa-calendar-day"></i>
        <h2><%= leaveRequestCount %></h2> <!-- Updated to show total leave requests -->
        <p>Leave Requests</p>
        <a href="#" class="more-info">More Info</a>
    </div>
    <div class="box green">
        <i class="fas fa-money-bill-wave"></i>
        <h2><%= totalSalary %></h2>
        <p>Salary Paid</p>
        <a href="#" class="more-info">More Info</a>
    </div>
</div>


<div class="footer">
    <div class="left">&copy; 2024 Employee Management System</div>
    <div class="right">Ganesh, Nikhil</div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>



