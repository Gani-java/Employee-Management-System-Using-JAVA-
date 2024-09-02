<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employee</title>
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

        .table-responsive {
            max-height: 400px; /* Adjust this height to limit the visible rows */
            overflow-y: auto;
        }

        .table th, .table td {
            text-align: center;
            white-space: nowrap;
        }

        .table td img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .pagination {
            justify-content: center;
        }
    </style>
</head>
<body>
<%
    session = request.getSession(false);
    String empName = (String) session.getAttribute("empName");
    String profileImage = (String) session.getAttribute("profileImage");
    String empId = session.getAttribute("employeeId").toString();  // Assuming employeeId is stored in session after login
    if (profileImage == null || profileImage.isEmpty()) {
        profileImage = "images/UserLogin.png"; // Fallback image if none provided
    }
%>         

<div class="vertical-nav">
    <div class="admin-profile">
        <img src="<%= profileImage %>" alt="Admin Avatar" class="hov" style="width: 50px; height: 50px;"> 
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
                <a class="nav-link" href=ViewSalary.jsp><i class="fas fa-wallet"></i> View Salary</a>
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

<div class="page-header d-flex justify-content-between align-items-center">
    <div>
        <h1>Leave History</h1>
    </div>
    <div class="breadcrumb">
        <span class="breadcrumb-item">
            <i class="fas fa-home"></i> Home
        </span>
        <span class="breadcrumb-item">Dashboard</span>
        <span class="breadcrumb-item">Leave</span>
    </div>
</div>

<%
    String employeeId = session.getAttribute("employeeId").toString();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String url = "jdbc:mysql://localhost:3306/ems";
    String user = "root";
    String password = "Gani@2000";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);

        String query = "SELECT employee_id, leave_reason, leave_from, leave_to, status, description, applied_on FROM leavetable WHERE employee_id = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, employeeId);
        rs = ps.executeQuery();
%>
 
 <div class="container custom-container">
    <div id="departmentForm">
        <div class="form-group">
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr> 
               				<th>Employee ID</th>
                			<th>Reason</th>
                			<th>From</th>
                			<th>To</th>
                			<th>Status</th>
                			<th>Description</th>
                			<th>Applied On</th>
            			</tr>
            			</thead>
            			<tbody>
            			
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getInt("employee_id") %></td>
                <td><%= rs.getString("leave_reason") %></td>
                <td><%= rs.getDate("leave_from") %></td>
                <td><%= rs.getDate("leave_to") %></td>
<td style="font-weight:900;color:<%= "Approved".equals(rs.getString("status")) ? "green" : "Rejected".equals(rs.getString("status")) ? "red" : "black" %>;">
    <%= rs.getString("status") %>
</td>
                <td><%= rs.getString("description") %></td>
                <td><%= rs.getDate("applied_on") %></td>
            </tr>
            
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
		</tbody>
        </table>
        </div>
      </div>
    </div>
</div>

</body>
</html>   
