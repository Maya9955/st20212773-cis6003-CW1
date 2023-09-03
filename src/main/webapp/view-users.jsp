<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		 <title>User Details</title>
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
                        <li class="nav-item"><a class="nav-link active" href="view-appoiment.jsp">View Appointment</a></li>
                        <li class="nav-item"><a class="nav-link active" href="getuser?useractiontype=all">View Users</a></li>
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
    
       <div class="container">
        <h2>User Count Report</h2>

        <!-- Display the counts as a graph -->
        <div class="text-center">
            <canvas id="userCountsChart" width="600" height="100"></canvas>
        </div>


<%-- 		<div class="container">
			<h2> User Details</h2>
			<p style='color:magenta'>${message}</p>		
                <p>Job Seeker Count: ${jobSeekerCount}</p>
                <p>Counselor Count: ${counselorCount}</p>
			<br/>	 --%>	
<%-- 			 <div class="row">
            <div class="col-md-6">
                <h3>Job Seeker Count</h3>
                <p>${jobSeekerCount}</p>
            </div>
            <div class="col-md-6">
                <h3>Counselor Count</h3>
                <p>${counselorCount}</p>
            </div>
        </div> --%>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>User ID</th>
						<th>Full Name</th>
						<th>Email</th>
						<th>Password</th>
						<th>User Type</th>
					</tr>
				</thead>			
				<tbody>
					<tag:forEach var="user" items="${userList}">
						<tr>
							<td>${user.iduser}</td>
							<td>${user.fullname}</td>
							<td>${user.email}</td>
							<td>${user.password}</td>
							<td>${user.usertype}</td>
							<td>
								<form action="usermanager" method="post">								
									<input type="hidden" name="iduser" value="${user.iduser}">
									<input type="hidden" name="useractiontype" value="delete">
									<button type="submit" class="btn btn-danger">Delete User</button>
								</form>							
							</td>
						</tr>
					</tag:forEach>
				</tbody>
			</table>	
		</div>
		<script>
    // Get the canvas element and context
    var canvas = document.getElementById("userCountsChart");
    var ctx = canvas.getContext("2d");

    // Define chart data
    var data = {
        labels: ["Job Seekers", "Counselors"],
        datasets: [{
            label: "User Counts",
            backgroundColor: ["blue", "green"], // Colors for bars
            data: [${jobSeekerCount}, ${counselorCount}],
        }],
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
	</body>
</html>