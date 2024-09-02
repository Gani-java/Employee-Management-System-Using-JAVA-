<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
        }
        .card {
            border-color: #007bff;
        }
        .card-header {
            background-color: #007bff;
            color: white;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .form-group .input-group-text {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Employee Management System</h2>

    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header text-center">
                    <h3><i class="fas fa-user"></i> Admin Login</h3>
                </div>
                <div class="card-body">
                    <% 
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                        <div class="alert alert-danger" role="alert">
                            <%= errorMessage %>
                        </div>
                    <% } %>

                    <form action="admin" method="post">
                        <div class="form-group">
                            <label for="username">User Name</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" id="username" placeholder="Enter your username" name="uname">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                </div>
                                <input type="password" class="form-control" id="password" placeholder="Enter your password" name="pass">
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="button" class="btn btn-secondary mr-2" onclick="window.location.href='index.jsp'"> Back</button>
                            <input type="submit" class="btn btn-primary" value="Login"> 
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
