<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Consultation Scheduler</title>
		
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>	
	</head>
	<body>
		<div class="container">
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link" aria-current="page" href="add-appoiment.jsp">Book Appoiment</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="#">Search & Update the Appoiment</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="getappoiment?actiontype=all">View All & Delete Specific</a>
			  </li>
			</ul>			
			<br/>
			<h2>Search & update you Profile</h2>
			<p style='color:magenta'>${feebackMessage}</p>
			<br/>
			
			
			<form action="usermanager" method="get">
				<input type="hidden" name="useractiontype" value="edit"/>
				<input type="hidden" name="iduser" value="${user.iduser}"/>

				<label for="userName">Name:</label>
				<input class="form-control" type="text" id="userName" name="name" value="${user.fullname}" />

				<label for="userEmail_id">Email ID:</label>
				<input class="form-control" type="text" id="userEmail_id" name="email_id" value="${user.email}" />

				<label for="userPassword">Password:</label>
				<input class="form-control" type="password" id="userPassword" name="password" />								

				<br/>
				<button type="submit" class="btn btn-warning">Update My Profile</button>			
			</form>
					
		</div>	
	</body>
</html>