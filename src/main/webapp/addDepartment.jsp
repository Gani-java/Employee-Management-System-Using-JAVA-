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

<div class="page-header">
    <div>
        <h1>Add Department</h1>
    </div>
    <div class="breadcrumb">
        <span class="breadcrumb-item">
            <i class="fas fa-home"></i> Home
        </span>
        <span class="breadcrumb-item">Dashboard</span>
        <span class="breadcrumb-item">Add Department</span>
    </div>
</div>

<div class="container custom-container">
    <h3>Add Department</h3>
    <hr>
    <form id="departmentForm" action="dept" method="post">
        <div class="form-group">
            <label for="departmentName">Department Name:</label>
            <input type="text" class="form-control" id="departmentName" name="departmentName" placeholder="Enter department name" required>
        </div>
        <input type="submit" class="btn btn-submit" value="Submit">
    </form>
</div>

<!-- Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Success</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Department added successfully!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="left">&copy; 2024 Employee Management System</div>
    <div class="right">Ganesh, Nikhil</div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        var urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('success') && urlParams.get('success') === 'true') {
            $('#successModal').modal('show');
        }
    });
</script>
</body>
</html>