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
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="#freelancers">Careers</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="home2.html">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Book Appointment</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    
 <script>
    function submitForm() {
        // Assuming the form fields are valid, you can replace this with your validation logic
        // ...
        
        // Simulating registration success (you can replace this with your actual server-side logic)
        var bookingSuccessful = true; // Set this to true if registration is successful
        
        var resultMessage = bookingSuccessful
            ? "Thank you for booking! Your appointment has been successfully booked. One of our counselors will confirm your booking by email. You can get your booking details from there."
            : "Booking failed. Please try again.";
        var resultColor = bookingSuccessful ? "text-success" : "text-danger";
        
        var resultModal = new bootstrap.Modal(document.getElementById("registrationModal"));
        var resultModalBody = document.getElementById("registrationModalBody");
        resultModalBody.textContent = resultMessage;
        resultModalBody.className = resultColor;
        
        resultModal.show();
        
        // Attach the refreshPage function to the modal's "Okay" button click event
        var okayButton = document.querySelector("#registrationModal .btn-secondary");
        okayButton.addEventListener("click", refreshPage);
        
        return false; // Prevent the form from submitting and redirecting
    }

    // Function to refresh the page
    function refreshPage() {
        location.reload();
    }
</script>


     <div class="modal fade" id="registrationModal" tabindex="-1" aria-labelledby="registrationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="registrationModalLabel">Booking Result</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="registrationModalBody"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Okay</button>
            </div>
        </div>
    </div>
</div>
    
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="appointment-form">
                    <h2 class="mb-4">Book an Appointment</h2>
                    <form action="appoimentmanager" method="post" onsubmit="return submitForm();">
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
</body>
</html>
