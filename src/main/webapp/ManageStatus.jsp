<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Status</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Manage Status</h2>
        <form action="ManageStatusServlet" method="POST">
            <input type="hidden" name="status" id="status" value="">
            <div class="form-group">
                <input type="submit" class="btn btn-success" onclick="submitForm('Approved')" value="Approve">
                <input type="submit" class="btn btn-danger" onclick="submitForm('Rejected')" value="Reject">
            </div>
        </form>
    </div>

    <script>
        function submitForm(statusValue) {
            document.getElementById('status').value = statusValue;
            document.forms[0].submit();
        }
    </script>
</body>
</html>
