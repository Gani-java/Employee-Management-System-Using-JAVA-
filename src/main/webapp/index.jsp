<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .navbar-custom {
            background-color: blue;
        }
        /*
        .footer-custom {
        margin-top:auto;
            background-color:#4e5363;
            height: 90px;
            color: white;
            margin-bottom:0px;
        }
        */
        .center-image {
            display: block;
            margin-top:100px;
            margin-left: auto;
            margin-right: auto;
            width:65%;
        }
    </style>
</head>
<body>
 
    <nav class="navbar navbar-expand-lg navbar-custom" style="padding:15px;">
        <div class="container">
            <a class="navbar-brand text-white" href="#">Ganesh B</a>
            <a class="navbar-brand text-white" href="#">Nikhil Kumar V</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <a class="navbar-brand text-white" href="index.jsp">
                    Employee Management System <i class="fas fa-users"></i>
                </a>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <a href="adminLogin.jsp"><button class="btn btn-light mr-2">Admin</button></a>
                <a href="EmpLogin.jsp"><button class="btn btn-light">Employee</button></a>
            </div>
        </div>
    </nav>


    <div class="container mt-5">
        <img src="images/Home.jpg" class="center-image" alt="Centered Image">
    </div>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
