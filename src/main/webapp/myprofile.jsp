<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>My Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
        /* body {
            background-color: #f8f9fa;
        } */
        .container {
            padding: 2rem;
        }
        .profile-card {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
            height: 100%; /* Set a fixed height to match the image */
        }
        .profile-image {
            text-align: center;
            flex-grow: 1; /* Allow the image to grow and take up available space */
        }
        .profile-image img {
            max-width: 100%;
            height: auto;
            border-radius: 50%;
        }
        .profile-details {
            padding: 1rem;
        }
    </style>
</head>
<body>
<%-- <p>${sessionScope.usertype}</p> --%>
<body>
    <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Job Counseling</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <!-- Check if the user is a job seeker -->
                        <% if ("jobSeeker".equals(session.getAttribute("usertype"))) { %>
                            <li class="nav-item"><a class="nav-link" href="add-appointment.jsp">Book Appointment</a></li>
                        <% } else if ("counselor".equals(session.getAttribute("usertype"))) { %>
                            <li class="nav-item"><a class="nav-link" href="approveappoiment.jsp">Manage Appointment</a></li>
                            <% } else if ("admin".equals(session.getAttribute("usertype"))) { %>
                            <li class="nav-item"><a class="nav-link" href="view-eappoiment.jsp">View Appointment</a></li>
                             <li class="nav-item"><a class="nav-link" href="view-users.jsp">View Users</a></li>
                        <% } %>
                    </li>
                </ul>
            </div>
            <form action="home.jsp" method="post" class="ml-auto">
                <button type="submit" class="btn btn-outline-secondary rounded-pill"onclick="logout()">Logout</button>
            </form>
            <form action="myprofile.jsp" class="ml-auto">
                <button type="submit" class="btn btn-link rounded-circle" title="My Profile Details">
                    <img src="image/profileicon.jpg" alt="Profile Image" class="rounded-circle" width="40" height="40">
                </button>
            </form>
        </div>
    </nav>
</header>
    

<div class="container mt-5">
    <div class="row">
        <div class="col-md-4">
            <div class="profile-card">
                <div class="profile-image">
                    <img src="image/myprofile.jpg" alt="User Avatar">
                    <p>User ID : ${sessionScope.userid} </p>
                    <p>Full Name : ${sessionScope.userfullname}</p>
                    <p>Email ID : ${sessionScope.useremail}</p>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="profile-card">
                <div class="profile-details">
                    <h2 class="mb-4">My Profile</h2>
                    <form action="usermanager" method="post">
                    <div class="mb-3">
                            <label for="userID" class="form-label">user ID</label>
                            <input type="text" id="userID" name="userID" class="form-control" value="${sessionScope.userid}" required>
                        </div>
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" value="${sessionScope.userfullname}" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" id="email" name="email" class="form-control" value="${sessionScope.useremail}" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" id="password" name="password" class="form-control" value="${sessionScope.userpassword}" required>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>function logout() {
    // Clear the session storage for 'usertype'
    sessionStorage.removeItem('usertype');

    // Redirect to the home page (you can replace 'home.jsp' with your actual home page URL)
    window.location.href = 'home.jsp';
}</script>
</body>
</html>
