<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		 <title>Appointment Booking</title>
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link active" href="getappoiment?actiontype=all">View Appointment</a></li>
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
        var deleteSuccessful = true; // Set this to true if registration is successful
        
        var resultMessage = deleteSuccessful
            ? "Thank you for booking! Your appointment has been successfully booked. One of our counselors will confirm your booking by email. You can get your booking details from there."
            : "Booking failed. Please try again.";
        var resultColor = deleteSuccessful ? "text-success" : "text-danger";
        
        var resultModal = new bootstrap.Modal(document.getElementById("deleteModal"));
        var resultModalBody = document.getElementById("deleteModalBody");
        resultModalBody.textContent = resultMessage;
        resultModalBody.className = resultColor;
        
        resultModal.show();
        
        // Attach the refreshPage function to the modal's "Okay" button click event
        var okayButton = document.querySelector("#deleteModal .btn-secondary");
        okayButton.addEventListener("click", refreshPage);
        
        return false; // Prevent the form from submitting and redirecting
    }

    // Function to refresh the page
    function refreshPage() {
        location.reload();
    }
</script>

     <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Booking Result</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="deleteModalBody"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Okay</button>
            </div>
        </div>
    </div>
</div>

		<div class="container">
		<!-- 	<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link" aria-current="page" href="add-product.jsp">Add Product</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="search-and-update.jsp">Search & Update the Product</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="#">View All & Delete Specific</a>
			  </li>
			</ul>			
			<br/> -->
			<h2>View All & Delete Specific Product</h2>
			<p style='color:magenta'>${message}</p>			
			<br/>		
			<table class="table table-striped" onsubmit="return submitForm();">
				<thead>
					<tr>
						<th>Appoiment ID</th>
						<th>Full Name</th>
						<th>Email</th>
						<th>Phone No</th>
						<th>Date</th>
						<th>Status</th>
					</tr>
				</thead>			
				<tbody>
					<tag:forEach var="appoiment" items="${appoimentList}">
						<tr>
							<td>${appoiment.idappoiment}</td>
							<td>${appoiment.name}</td>
							<td>${appoiment.email_id}</td>
							<td>${appoiment.ph_no}</td>
							<td>${appoiment.date}</td>
							<td>${appoiment.status}</td>
							<td>
								<form action="appoimentmanager" method="post">								
									<input type="hidden" name="idappoiment" value="${appoiment.idappoiment}">
									<input type="hidden" name="actiontype" value="delete">
									<button type="submit" class="btn btn-danger">Delete the Appointment</button>
								</form>							
							</td>
						</tr>
					</tag:forEach>
				</tbody>
			</table>	
		</div>
	</body>
</html>