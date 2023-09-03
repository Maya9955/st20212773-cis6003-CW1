<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		  <title>Appointment Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
        /* body {
            background-color: #f8f9fa;
        } */
        .container {
            padding: 2rem;
        }
        .appointment-form {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.2);
        }
        .appointment-info {
            text-align: center;
            padding: 2rem;
        }
        /* CSS for the circular logo */
        .logo-circle {
            width: 100px; /* Adjust the size as needed */
            height: 100px; /* Adjust the size as needed */
            background-color: #007bff; /* Background color of the circle */
            border-radius: 50%; /* Creates a circular shape */
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto;
            margin-top: 20px; /* Adjust the margin-top as needed */
        }

        .logo img {
            width: 60px; /* Adjust the size of the logo image as needed */
            height: 60px; /* Adjust the size of the logo image as needed */
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
                    <ul class="navbar-nav">
                        <li class="nav-item">         
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#">Book Appointment</a></li>                       
                    </ul>
                 </div>
                <form action="home.jsp" method="post" class="ml-auto">
                        <button type="submit" class="btn btn-outline-secondary rounded-pill" onclick="logout()">Logout</button>
                </form>
                <form action="myprofile.jsp" class="ml-auto">
                    <button type="submit" class="btn btn-link rounded-circle" title="My Profile Details">
                        <img src="image/profileicon.jpg" alt="Profile Image" class="rounded-circle" width="40" height="40">
                    </button>
                </form>
            </div>
          
        </nav>
    </header>    
    
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="appointment-form">
                    <h2 class="mb-4">Book an Appointment</h2>
                    <%-- <p>${feebackMessage}</p> --%>
                    <form action="appoimentmanager" method="post" >
                        <div class="mb-3">
                            <label for="Name" class="form-label">Full Name</label>
                            <input type="text" id="name" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="Email_id" class="form-label">Email</label>
                            <input type="email" id="email_id" name="email_id" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="Phone_No" class="form-label">Phone Number</label>
                            <input type="tel" id="ph_no" name="ph_no" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="Date" class="form-label">Date</label>
                            <input type="date" id="date" name="date" class="form-control" required>
                        </div>
                         <div class="mb-3 d-flex justify-content-center">
                        <input type="hidden" name="actiontype" value="add"/>
                        <button type="submit" class="btn btn-primary">Book Now</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="appointment-info">
                    <h2 class="mb-4">Why Choose Us?</h2>
                    <!-- <p> We understand that your career journey is unique. Our experienced counselors take 
                        the time to truly understand your aspirations, strengths, and challenges, 
                        providing you with tailored advice that sets you on the path to success.</p> -->
                    <p>We measure our success by your success. Our commitment to seeing you thrive drives everything we do. 
                        Your goals become our goals, 
                        and we're dedicated to helping you achieve them.</p>
                    <img src="image/book.jpg" alt="Image Description" class="img-fluid mt-4">
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

   <script>
    // Function to show the feedback message in an alert when the page loads
    function showAlertWithMessage() {
        var feebackMessage = "${feebackMessage}";
        
        if (feebackMessage.trim() !== "") {
            alert(feebackMessage);
        }
    }
    window.onload = showAlertWithMessage;
   </script>
   
   <script>function logout() {
	    // Clear the session storage for 'usertype'
	    sessionStorage.removeItem('usertype');

	    // Redirect to the home page (you can replace 'home.jsp' with your actual home page URL)
	    window.location.href = 'home.jsp';
	}</script></script>
    
</body>
</html>
