<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		 <title>Appointment History</title>
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
		
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
                        <li class="nav-item"><a class="nav-link active" href="register.jsp">Add Users</a></li>
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

 <!-- Display the counts as a graph -->
        <div class="text-center">
        <h2>Appointment Status Report- Counselor wise</h2>
            <canvas id="userCountsChart" width="700" height="100"></canvas>
        </div>
			<h2> Appointment History</h2>
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
   <!-- ... (your existing HTML code) ... -->
<!-- Add a canvas element to display the chart -->
<canvas id="userCountsChart"></canvas>

<script>
    // Get the canvas element and context
    var canvas = document.getElementById("userCountsChart");
    var ctx = canvas.getContext("2d");

    // Extract data from the JSTL forEach loops
    var userApprovedCounts = [];
    var userDeclinedCounts = [];

    <c:forEach var="entry" items="${userApprovedCounts}">
        userApprovedCounts.push({
            label: "User ID " + ${entry.key} + " Approved",
            backgroundColor: "blue", // Color for approved bars
            data: [${entry.value}],
        });
    </c:forEach>

    <c:forEach var="entry" items="${userDeclinedCounts}">
        userDeclinedCounts.push({
            label: "User ID " + ${entry.key} + " Declined",
            backgroundColor: "red", // Color for declined bars
            data: [${entry.value}],
        });
    </c:forEach>

    // Define chart data
    var data = {
        labels: [" Appointment Status"],
        datasets: [...userApprovedCounts, ...userDeclinedCounts],
    };

    // Define chart options (you can customize this as needed)
    var options = {
        scales: {
            y: {
                beginAtZero: true,
            },
        },
    };

    // Create the chart
    var userCountsChart = new Chart(ctx, {
        type: "bar",
        data: data,
        options: options,
    });
</script>
 <script>function logout() {
    // Clear the session storage for 'usertype'
    sessionStorage.removeItem('usertype');

    // Redirect to the home page (you can replace 'home.jsp' with your actual home page URL)
    window.location.href = 'home.jsp';
}</script>
</body>
</html>
   
	</body>
</html>