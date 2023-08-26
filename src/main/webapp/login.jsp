<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
        /* body {
            background-color: #f8f9fa;
        } */
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            border: none;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.2);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 1.5rem;
            font-size: 1.5rem;
        }
        .center-button {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="#">Job Counseling</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    
    <script>
        function submitForm() {
            // Assuming the form fields are valid, you can replace this with your validation logic
            // ...
            
            // Simulating login success (you can replace this with your actual server-side logic)
            var loginSuccessful = true; // Set this to true if login is successful
            
            var resultMessage = loginSuccessful ? "Login successful!" : "Login failed. Please try again.";
            var resultColor = loginSuccessful ? "text-success" : "text-danger";
            
            var resultModal = new bootstrap.Modal(document.getElementById("registrationModal"));
            var resultModalBody = document.getElementById("registrationModalBody");
            resultModalBody.textContent = resultMessage;
            resultModalBody.className = resultColor;
            
            resultModal.show();
            
            // Return false to prevent the form from submitting and redirecting
            return false;
        }
        
        function redirectToUserTypePage() {
            var userType = document.getElementById("userType").value;
            if (userType === "admin") {
                window.location.href = "home.jsp";
            } else if (userType === "jobSeeker") {
                window.location.href = "add-appoiment.jsp";
            } else {
                // Handle other user types or scenarios here
            }
        }
    </script>
    
    <div class="login-container">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    Login
                </div>
                <div class="card-body">
                    <form action="usermanager" method="get" onsubmit="return submitForm();"> 
                        <div class="mb-3">
                            <label for="fullname" class="form-label">Full Name</label>
                            <input type="text" id="fullname" name="fullname" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" id="password" name="password" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="userType" class="form-label">User Type</label>
                            <select id="userType" name="userType" class="form-control" required>
                                <option value="jobSeeker">Job Seeker</option>
                                <option value="counselor">Counselor</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <div class="center-button">
                            <input type="hidden" name="useractiontype" value="login">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </form>
               
                    <p class="text-center mt-3">If you're a job seeker and don't have an account, <a href="register.jsp">please register here</a>.</p>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="registrationModal" tabindex="-1" role="dialog" aria-labelledby="registrationModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registrationModalLabel">Login Result</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="registrationModalBody">
                    <!-- Result message will be displayed here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="redirectToUserTypePage()">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
