<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employee Leave</title>
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
        #searchInput{
            width:500px;
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
                <a class="nav-link" href="ManageEmployeeLeave.jsp"><i class="fas fa-user-clock"></i> Manage Employee Leave</a>
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
        <h1>Approve Leave</h1>
    </div>
    <div class="breadcrumb">
        <span class="breadcrumb-item">
            <i class="fas fa-home"></i> Home
        </span>
        <span class="breadcrumb-item">Dashboard</span>
        <span class="breadcrumb-item">Leave</span>
    </div>
</div>

<div class="container custom-container">
    <div id="departmentForm">
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>EmployeeId</th>
                        <th>Employee Name</th>
                        <th>Pic</th>
                        <th>Department</th>
                        <th>Reason</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Description</th>
                        <th>Applied On</th>
                        <th>Actions</th>
                    </tr>
                </thead>
<tbody id="leaveTableBody">
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT " +
            "a.id AS employee_id, a.emp_name AS employee_name, a.pic AS pic, " +
            "d.department_name AS department_name, l.leave_reason AS reason, " +
            "l.leave_from AS leave_from, l.leave_to AS leave_to, l.description AS description, " +
            "l.applied_on AS applied_on " +
            "FROM leavetable l " +
            "JOIN addEmployee a ON l.employee_id = a.id " +
            "JOIN department_tbl d ON a.department_id = d.id";

        String searchId = request.getParameter("searchId"); 

        if (searchId != null && !searchId.isEmpty()) {
            sql += " WHERE l.employee_id = ?";
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");

            pstmt = conn.prepareStatement(sql);
            if (searchId != null && !searchId.isEmpty()) {
                pstmt.setString(1, searchId);
            }

            rs = pstmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("employee_id");
                String emp_name = rs.getString("employee_name");
                String imgFileName = rs.getString("pic");
                String department_name = rs.getString("department_name");
                String leave_reason = rs.getString("reason");
                String leave_from = rs.getString("leave_from");
                String leave_to = rs.getString("leave_to");
                String description = rs.getString("description");
                String applied_on = rs.getString("applied_on");
    %>
    <tr  id="row_<%= id %>">
        <td><%= id %></td>
        <td><%= emp_name %></td>
        <td style="padding:0;"><img src="UsersImages/<%= imgFileName %>" class="img-thumbnail"></td>
        <td><%= department_name %></td>
        <td><%= leave_reason %></td>
        <td><%= leave_from %></td>
        <td><%= leave_to %></td>
        <td><%= description %></td>
        <td><%= applied_on %></td>
  <td>
    <!-- Form for Approve Button -->
    <form action="ManageStatusServlet" method="POST">
        <input type="hidden" name="department_name" value="<%= department_name %>">
        <input type="hidden" name="employee_id" value="<%= id %>">
        <input type="hidden" name="status" value="Approved">
        <input type="submit" class="btn btn-success" value="Approve">
    </form>

    <!-- Form for Reject Button -->
    <form action="ManageStatusServlet" method="POST">
        <input type="hidden" name="department_name" value="<%= department_name %>">
        <input type="hidden" name="employee_id" value="<%= id %>">
        <input type="hidden" name="status" value="Rejected">
        <input type="submit" class="btn btn-danger" value="Reject">
    </form>
    
   <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal" data-id="<%= id %>">Delete</button>
   
</td>
    </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</tbody>
            </table>
        </div>
    </div>
</div>

<div class="footer">
    <div class="left">&copy; 2024 Employee Management System</div>
    <div class="right">Ganesh, Nikhil</div>
</div>


<script>
    function submitForm(id, status) {
        document.getElementById('status_' + id).value = status;
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Delete Leave </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this Employee Leave?</p>
            </div>
            <div class="modal-footer">
                <a href="#" id="deleteConfirmButton" class="btn btn-danger">Delete</a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>


<script>
$('#deleteModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    var id = button.data('id'); // Extract info from data-* attributes
    var modal = $(this);
    modal.find('#deleteConfirmButton').attr('href', 'DeleteEmployeeLeave.jsp?id=' + id);
});
</script>

</body>
</html>
