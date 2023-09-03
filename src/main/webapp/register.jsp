<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Seeker Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
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
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Register</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    
<%-- <script>
        function submitForm() {
            // Assuming the form fields are valid, you can replace this with your validation logic
            // ...
            
            // Simulating registration success (you can replace this with your actual server-side logic)
            var registrationSuccessful = true; // Set this to true if registration is successful
            
            var resultMessage = registrationSuccessful ? "Login successful!" : "Login failed. Please try again.";
            var resultColor = registrationSuccessful ? "text-success" : "text-danger";
            
            var resultModal = new bootstrap.Modal(document.getElementById("registrationModal"));
            var resultModalBody = document.getElementById("registrationModalBody");
            resultModalBody.textContent = resultMessage;
            resultModalBody.className = resultColor;
            
            resultModal.show();
            
            return false; // Prevent the form from submitting and redirecting
        }
    </script>
<p>${sessionScope.usertype}</p> --%>

    <div class="modal fade" id="registrationModal" tabindex="-1" aria-labelledby="registrationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="registrationModalLabel">Registration Result</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="registrationModalBody"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
                    
                  <div class="modal-body">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <form action="usermanager" method="post">
                    <div class="mb-3">
                        <label for="fullname" class="form-label">Full Name</label>
                        <input type="text" id="fullname" name="fullname" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="usertype" class="form-label">User Type</label>
                        <!-- <select id="usertype" name="usertype" class="form-select" required>
                            <option value="jobSeeker" selected>Job Seeker</option>
                            <option value="counselor" disabled>Counselor (Not Available)</option>
                            <option value="admin" disabled>Admin (Not Available)</option>
                        </select> -->
                        <select id="usertype" name="usertype" class="form-select" required>
                           <option value="jobSeeker" selected>Job Seeker</option>
                          <option value="counselor" selected>Counselor</option>
                          <option value="admin" selected>Admin</option>
                      </select>
                    </div>
                    <div class="text-center">
                        <input type="hidden" name="useractiontype" value="add"/>
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </form>
                <p class="text-center mt-3">Already have an account? <a href="login.jsp">Login here</a>.</p>
            </div>
        </div>
    </div>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>