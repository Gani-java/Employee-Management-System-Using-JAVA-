<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply Your Leave</title>
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

<div class="page-header d-flex justify-content-between align-items-center">
    <div>
        <h1>Leave</h1>
    </div>
    <div class="breadcrumb">
        <span class="breadcrumb-item">
            <i class="fas fa-home"></i> Home
        </span>
        <span class="breadcrumb-item">Dashboard</span>
        <span class="breadcrumb-item">Leave</span>
    </div>
</div>


<div class="custom-container">
    <hr>
    <h3>Apply Leave</h3>
		<form method="POST" action="myLeave">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="Reason">Reason</label>
                <input type="text" class="form-control" id="reason" name="reason" placeholder="Enter the Reason" required>
            </div>
		    <div class="form-group col-md-6">
                <label for="LeaveFrom">Leave From</label>
                <input type="date" class="form-control" id="leave_from" name="leave_from" placeholder="From Date" required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="Leave To">Leave To</label>
                <input type="date" class="form-control" id="leave_to" name="leave_to" placeholder="To Date" required>
            </div>
            <div class="form-group col-md-6">
                <label for="address">Description</label>
                <textarea class="form-control" id="Description" name="description" placeholder="Enter the Description" required></textarea>
            </div>
        </div>
		
    <input type="submit" class="btn btn-submit" value="Submit">   
</form>
</div>
<!-- Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Success</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Leave Request submitted successfully.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        var showModal = "<%= request.getAttribute("showSuccessModal") %>";
        if (showModal === "true") {
            $('#successModal').modal('show');
        }
    });
</script>
</body>
</html>

