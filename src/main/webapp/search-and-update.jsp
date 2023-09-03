<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%
  String appointmentIdParam = request.getParameter("idappoiment");
  int appointmentId = 0; // Initialize to a default value
  if (appointmentIdParam != null) {
    try {
      appointmentId = Integer.parseInt(appointmentIdParam);
    } catch (NumberFormatException e) {
      // Handle parsing error if necessary
    }
  }
  // Now, you have the appointmentId available for use in your JSP page
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Consultation Scheduler</title>
		
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
		<style>
    body {
        font-family: 'Open Sans', sans-serif;
    }
</style>	
	</head>
	<body>
<%-- 	<p>${sessionScope.userid}</p> --%>
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
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="mt-5 text-center">Enter the Appointment ID to Approve</h2>
            <form action="getappoiment" class="mt-3">
                <div class="form-group">
                    <label for="idappoiment">Enter Appointment ID:</label>
                    <div class="input-group">
                        <input type="number" class="form-control" id="idappoiment" name="idappoiment" value="<%= appointmentId %>"/>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </div>
                </div>
                  <p class="text-center mt-3">Send a email to JobSekeer to confirm appointment <a href="mailto:info@jobcounseling.com?subject=Appointment Confirmation" >Send Email</a>.</p>
                <input type="hidden" name="actiontype" value="single"/>
            </form>
            <hr/>
        </div>
    </div>

   <div class="row mt-4">
    <div class="col-md-4">
        <form action="appoimentmanager" method="post">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Appointment ID</h5>
                    <input type="number" class="form-control" id="idappoimentUpdate" name="idappoiment" readonly="readonly" value="${appoiment.idappoiment}">
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Name</h5>
                    <input type="text" class="form-control" id="appoimentName" name="name" value="${appoiment.getName()}" readonly="readonly" >
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Email ID</h5>
                    <input type="text" class="form-control" id="appoimentEmail_id" name="email_id" value="${appoiment.getemail_id()}" readonly="readonly">
                </div>
            </div>
        </div>
    </div>

    <!-- Next row with three cards -->
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Phone Number</h5>
                    <input type="text" class="form-control" id="appoimentPhone_no" name="ph_no" value="${appoiment.getph_no()}"  readonly="readonly">
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Date</h5>
                    <input type="date" class="form-control" id="appoimentdate" name="date" value="${appoiment.getdate()}" readonly="readonly">
                </div>
            </div>
        </div>
        <div class="col-md-4">
    <div class="card bg-success"> <!-- Green background for status -->
        <div class="card-body">
            <h5 class="card-title">Status</h5>
            <form method="post" action="your_action_url_here">
                <select class="form-select form-control" id="appoimentstatus" name="status">
                    <option value="Approve by No: ${sessionScope.userid} - ${sessionScope.userfullname} ">Approve by No: ${sessionScope.userid} - ${sessionScope.userfullname}</option>
                    <option value="Decline by No: ${sessionScope.userid} - ${sessionScope.userfullname} ">Decline by No: ${sessionScope.userid} - ${sessionScope.userfullname}</option>
                </select>
                <input type="hidden" name="actiontype" value="edit"/>
                <button type="submit" class="btn btn-primary mt-3">Update</button>
            </form>
        </div>
    </div>
</div>
<script>function logout() {
    // Clear the session storage for 'usertype'
    sessionStorage.removeItem('usertype');

    // Redirect to the home page (you can replace 'home.jsp' with your actual home page URL)
    window.location.href = 'home.jsp';
}</script>
</body>
</html>
