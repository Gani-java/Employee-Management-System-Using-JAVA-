<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard</title>
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

<%
    session = request.getSession(false);
    String empName = (String) session.getAttribute("empName");
    String profileImage = (String) session.getAttribute("profileImage");
    if (profileImage == null || profileImage.isEmpty()) {
        profileImage = "images/UserLogin.png"; // Fallback image if none provided
    }
%>         
<div class="vertical-nav">
    <div class="admin-profile">
        <img src="<%= profileImage %>" alt="Employee Avatar" class="hov" style="width: 50px; height: 50px;"> 
        <div>
            <h4><%= empName != null ? empName : "MyProfile" %></h4>
            <p class="hov"><i class="fas fa-circle" style="color: #28a745; font-size: 10px;"></i> Online</p>
        </div>
    </div>
    
    <div class="navbar-header">MAIN NAVIGATION</div>
    
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link" href="EmployeeDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#salaryMenu" role="button" aria-expanded="false" aria-controls="salaryMenu">
                <i class="fas fa-money-check-alt"></i> Salary
            </a>
            <div class="collapse" id="salaryMenu">
                <a class="nav-link" href="ViewSalary.jsp"><i class="fas fa-wallet"></i> View Salary</a>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#leaveMenu" role="button" aria-expanded="false" aria-controls="leaveMenu">
                <i class="fas fa-calendar-alt"></i> Leave
            </a>
            <div class="collapse" id="leaveMenu">
                <a class="nav-link" href="ApplyLeave.jsp"><i class="fas fa-user-clock"></i> Apply Leave</a>
                <a class="nav-link" href="MyLeaveHistory.jsp"><i class="fas fa-history"></i> My Leave History</a>
            </div>
        </li>
    </ul>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
    <a class="navbar-brand" href="#">Employee Management System</a>
    <div style="margin-left:700px;">
        <a href="index.jsp" class="btn btn-outline-light">Logout</a>
    </div>
</nav>

<div class="page-header">
    <div style="display:flex; justify-content: space-between;">
        <h1>Dashboard</h1>
        <h4>Control Panel</h4>
    </div>
    <div class="breadcrumb">
        <span class="breadcrumb-item">
            <i class="fas fa-home"></i> Home
        </span>
        <span class="breadcrumb-item active">Dashboard</span>
    </div>
</div>

<%
String employeeId = session.getAttribute("employeeId").toString();  // Assuming employeeId is stored in session after login

    int leaveRequestCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");
        
        // Count leave requests
        String sqlLeave = "SELECT COUNT(*) FROM leavetable where employee_id=?;";
        PreparedStatement stmtLeave = conn.prepareStatement(sqlLeave);
        stmtLeave.setString(1,employeeId);
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
<div class="container-box" style="width:350px;margin-top:120px;">
    <div class="box green">
        <i class="fas fa-calendar-day"></i>
        <h2><%= leaveRequestCount %></h2>
        <p>Leave Requests</p>
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
