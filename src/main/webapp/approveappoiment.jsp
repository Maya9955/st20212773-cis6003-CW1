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
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script>
              function redirectToSearchAndUpdate(appointmentId) {
              window.location.href = 'search-and-update.jsp?idappoiment=' + appointmentId;
              }
        </script>
        
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
                        <li class="nav-item"><a class="nav-link active" href="getappoiment?actiontype=all">Manage Appointment</a></li>                      
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
			<h2>Manage Appoitments</h2>			
			<br/>		
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Appoiment ID</th>
						<th>Full Name</th>
						<th>Email</th>
						<th>Phone No</th>
						<th>Date</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>			
				<tbody>
					<tag:forEach var="appoiment" items="${appoimentList}">
						<form action="appoimentmanager" method="post">
                           <input type="hidden" name="actiontype" value="declined">
                           <input type="hidden" name="idappoiment" value="${appoiment.idappoiment}">
                               <tr>
                                  <td>${appoiment.idappoiment}</td>
                                  <td>${appoiment.name}</td>
                                  <td>${appoiment.email_id}</td>
                                  <td>${appoiment.ph_no}</td>
                                  <td>${appoiment.date}</td>
                                  <td>${appoiment.status}</td>    
                                   <td>
                                     <!-- Add an "Approve" button that opens "update.jsp" -->
                                     <button type="button" class="btn btn-primary" onclick="redirectToSearchAndUpdate(${appoiment.idappoiment})">Approve</button>
                                     
                                   </td>  
                               </tr>
                        </form>
					</tag:forEach>
				</tbody>
			</table>	
		</div>
		<script>function logout() {
    // Clear the session storage for 'usertype'
    sessionStorage.removeItem('usertype');

    // Redirect to the home page (you can replace 'home.jsp' with your actual home page URL)
    window.location.href = 'home.jsp';
}</script>
	</body>
</html>