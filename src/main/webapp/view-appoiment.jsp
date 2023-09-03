<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		 <title>Appointment History</title>
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		
		   <style>
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
                        <li class="nav-item"><a class="nav-link active" href="getappoiment?actiontype=all">View Appointment</a></li>
                        <li class="nav-item"><a class="nav-link active" href="view-users.jsp">View Users</a></li>
                    </ul>
                </div>
                <form action="home.jsp" method="post" class="ml-auto">
                        <button type="submit" class="btn btn-outline-secondary rounded-pill">Logout</button>
                </form>
                <form action="myprofile.jsp" class="ml-auto">
                    <button type="submit" class="btn btn-link rounded-circle" title="My Profile Details">
                        <img src="image/profileicon.jpg" alt="Profile Image" class="rounded-circle" width="40" height="40">
                    </button>
                </form>
            </div>
        </nav>
    </header>


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
			<h2> Appointment History</h2>		
			<br/>		
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Appointment ID</th>
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
	</body>
</html>