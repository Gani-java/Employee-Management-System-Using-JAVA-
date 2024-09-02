<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
        <h1>Add Employee</h1>
    </div>
    <div class="breadcrumb">
        <span class="breadcrumb-item">
            <i class="fas fa-home"></i> Home
        </span>
        <span class="breadcrumb-item">Dashboard</span>
        <span class="breadcrumb-item">Add Employee</span>
    </div>
</div>



<!-- Add Employee Form -->
<div class="custom-container">
    <hr>
    <h3>Add Employee</h3>
    <form action="addEmployee" method="post" enctype="multipart/form-data">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter Full Name" required>
            </div>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
    String url = "jdbc:mysql://localhost:3306/ems";
    String user = "root";
    String password = "Gani@2000";
    
    Connection conn = null;
    Statement stmt = null;
    Statement stmt2 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    
    List<String[]> departments = new ArrayList<>();
    List<String[]> countries = new ArrayList<>();
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        
        String sql = "SELECT id, department_name FROM department_tbl";
        String sql2 = "SELECT id, country_name FROM country_tbl";
        
        stmt = conn.createStatement();
        stmt2 = conn.createStatement();
        rs = stmt.executeQuery(sql);
        rs2 = stmt2.executeQuery(sql2);

        while (rs.next()) {
            String id = rs.getString("id");
            String name = rs.getString("department_name");
            departments.add(new String[] {id, name});
        }

        while (rs2.next()) {
            String id = rs2.getString("id");
            String name = rs2.getString("country_name");
            countries.add(new String[] {id, name});
        }
        
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (rs2 != null) try { rs2.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt2 != null) try { stmt2.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>


<div class="form-group col-md-6">
    <label for="department">Department</label>
    <select id="department" name="department" class="form-control" required>
        <option value="" disabled selected>Select a department</option>
        <%
            for (String[] dept : departments) {
                String id = dept[0];
                String name = dept[1];
        %>
        <option value="<%= id %>"><%= name %></option>
        <%
            }
        %>
    </select>
</div>
  </div>
        
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" class="form-control" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
             <div class="form-group col-md-6">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="mobile">Mobile</label>
                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter Mobile Number" required>
            </div>
            <div class="form-group col-md-6">
                <label for="photo">Photo</label>
                <input type="file" class="form-control" id="photo" name="Image" required>
            </div>
        </div>
<div class="form-row">
    <div class="form-group col-md-6">
        <label for="pass">Password</label>
        <input type="password" class="form-control" id="pass" name="pass" placeholder="Enter Password" required>
    </div>
    <div class="form-group col-md-6">
        <label for="confirmPass">Confirm Password</label>
        <input type="password" class="form-control" id="confirmPass" name="confirmPass" placeholder="Confirm Password" required>
        <small id="passwordError" class="form-text text-danger" style="display: none;">Passwords do not match!</small>
    </div>
</div>        
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="dob">Date of Birth</label>
                <input type="date" class="form-control" id="dob" name="dob" placeholder="Date Of Birth" required>
            </div>
            <div class="form-group col-md-6">
                <label for="doj">Date of Joining</label>
                <input type="date" class="form-control" id="doj" name="doj" placeholder="Date Of Joining" required>
            </div>        
        </div>
        
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="city">City</label>
                <input type="text" class="form-control" id="city" name="city" placeholder="Enter City" required>
            </div>
            <div class="form-group col-md-6">
                <label for="state">State</label>
                <input type="text" class="form-control" id="state" name="state" placeholder="Enter State" required>  
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="country">Country</label> 
                <select id="country" name="country" class="form-control" required>
                <option value="" disabled selected>Select a department</option>
        <%
            for (String[] cnt : countries) {
                String id = cnt[0];
                String name = cnt[1];
        %>
        <option value="<%= id %>"><%= name %></option>
        <%
            }
        %>                
					</select>
				</div>
            <div class="form-group col-md-6">
                <label for="address">Address</label>
                <textarea class="form-control" id="address" name="address" placeholder="Enter Address" required></textarea>
            </div>
        </div>
        <input type="submit" class="btn btn-submit" value="Add Employee" onclick="return validatePasswords();">
        
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
                Employee added successfully!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
    
<div class="footer" style="position:relative">
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
<script>
    function validatePasswords() {
        var password = document.getElementById("pass").value;
        var confirmPassword = document.getElementById("confirmPass").value;
        var errorElement = document.getElementById("passwordError");

        if (password !== confirmPassword) {
            errorElement.style.display = "block";
            return false; // Prevent form submission
        } else {
            errorElement.style.display = "none";
            return true; // Allow form submission
        }
    }
</script>
</body>
</html>

            