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
			<h2>Search & update the appoiment</h2>
			<p style='color:magenta'>${feebackMessage}</p>
			<br/>
			
			<form action="getappoiment">			
				<label for="idappoiment">Enter Appoiment ID:</label>
				<input class="form-control" type="number" id="idappoiment" name="idappoiment" placeholder="Type the appoiment id"/>
				<input type="hidden" name="actiontype" value="single"/>
				<br/>
				<button type="submit" class="btn btn-info">Search</button>			
			</form>
			<hr/>
			<form action="appoimentmanager" method="post">			
				<label for="idappoimentUpdate">Appoiment ID:</label>
				<input class="form-control" type="number" id="idappoimentUpdate" name="idappoiment" readonly="readonly" value="${appoiment.idappoiment}"/>
				
				<label for="appoimentName">Name:</label>
				<input class="form-control" type="text" id="appoimentName" name="name" value="${appoiment.getName()}"/>
				
				<label for="appoimentEmail_id">Email ID:</label>
				<input class="form-control" type="text" id="appoimentEmail_id" name="email_id" value="${appoiment.getemail_id()}"/>
				
				<label for="appoimentPhone_no">Phone Number:</label>
				<input class="form-control" type="text" id="appoimentPhone_no" name="ph_no" value="${appoiment.getph_no()}"/>
				
				<label for="appoimentdate">Date:</label>
				<input class="form-control" type="date" id="appoimentdate" name="date" value="${appoiment.getdate()}"/>
				
				
				<input type="hidden" name="actiontype" value="edit"/>
				<br/>
				<button type="submit" class="btn btn-warning">Update the Appoiment</button>			
			</form>
					
		</div>	
	</body>
</html>