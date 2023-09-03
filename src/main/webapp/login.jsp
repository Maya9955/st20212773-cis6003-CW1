<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Counseling - Book an Appointment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
        /* Your existing styles here */
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

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header bg-primary text-white">
                        Login
                    </div>
                    <div class="card-body d-flex flex-column justify-content-between">
                        <form action="usermanager" method="get" onsubmit="return submitForm();">
                            <!-- ... (your form fields) ... -->
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
                            <div class="text-center mt-3">
                                <input type="hidden" name="useractiontype" value="login">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </form>
                        <p class="text-center mt-3">If you're a job seeker and don't have an account, <a href="register.jsp">please register here</a>.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-body d-flex align-items-center">
                        <img src="image/login.jpg" alt="Consulting Image" class="img-fluid mb-3" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <section id="contact" >
    <footer class="bg-dark text-white text-center py-3">
        <div class="container">
            <h2 class="text-center">Contact Us</h2>
            <div class="row">
                <div class="col-md-4 mx-auto">
                    <p class="text-center">
                        <strong>Email:</strong> info@jobcounseling.com<br>
                        <strong>Phone:</strong> +1 (123) 456-7890<br>
                        <strong>Address:</strong> 123 Main Street, City, Country
                    </p>
                </div>
            </div>
        </div>
        <div class="container">
            <p>&copy; 2023 Job Counseling. All rights reserved.</p>
        </div>
    </footer>
    </section>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
