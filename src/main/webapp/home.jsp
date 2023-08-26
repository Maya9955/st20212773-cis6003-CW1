<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Seeker Counseling</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="styles.css"> -->
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
                     
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <section id="hero" class="bg-primary text-white text-center py-5">
        <div class="container">
            <h1>Welcome to Job Seeker Counseling</h1>
            <p class="lead">Book appointments to chat with experienced counselors and get personalized career advice.</p>
            <a href="#services" class="btn btn-light btn-lg">Explore Services</a>
        </div>
    </section>
 
    <section id="about" class="py-5">
        <div class="container">
            <h2 class="text-center">About Us</h2>
            <p class="text-center">At Job Counseling, we're not just a company; we're a partner in your career journey. 
                Our mission is to empower job seekers with the guidance and resources they need to excel. With a team of 
                experienced counselors and a passion for your success,
                 we're here to help you reach new heights in your professional life.</p>
                 <div class="col-md-6 mx-auto">
                    <img src="image/about.jpg" alt="Cartoon Image" class="img-fluid mb-4">
                </div>
        </div>
    </section>

<section id="services" class="bg-light py-5">
    <div class="container">
        <h2 class="text-center">Our Services</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card mb-4 service-card border-0">
                    <div class="card-body text-center">
                        <h3 class="card-title">Career Exploration</h3>
                        <p class="card-text">Unlock your potential. Explore a world of 
                            Opportunities tailored to your strengths and passions. 
                            We'll guide you towards a future you're excited about.</p>
                            <img src="image/career.jpg" alt="Cartoon Image" class="img-fluid mb-4">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 service-card border-0">
                    <div class="card-body text-center">
                        <h3 class="card-title">Resume Building</h3>
                        <p class="card-text">Unleash the power of your accomplishments and aspirations with our expertly tailored resume building. 
                            Let your journey shine through a professionally 
                            crafted resume that opens doors and tells your unique story of success.</p>
                            <img src="image/resume.jpg" alt="Cartoon Image" class="img-fluid mb-4">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 service-card border-0">
                    <div class="card-body text-center">
                        <h3 class="card-title">Interview Preparation</h3>
                        <p class="card-text">Step confidently into the spotlight of opportunity! Our dynamic interview preparation 
                            equips you with invaluable mock sessions and insider tips. Elevate your self-assurance, master the art of articulation, 
                            and embrace the path to your dream career.</p>
                            <img src="image/interview.jpg" alt="Cartoon Image" class="img-fluid mb-4">
                    </div>
                </div>
            </div>
       <div class="row mt-5">
                <div class="col-md-8 mx-auto text-center">
                    <p class="lead">Ready to enjoy our services and book an appointment?</p>
                    <a href="register.jsp" class="btn btn-primary btn-lg">Register and Book Appointment</a>
                </div>
            </div>
        </div>
    </section>

<section id="freelancers" class="bg-light py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto text-center">
                <h2 class="display-4">Join Us as a Freelance Counselor</h2>
                <p class="lead">Are you a seasoned professional with a passion for helping others in their career journeys? Join our team of freelance counselors and make a difference.</p>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title">Share Your Expertise</h3>
                        <p class="card-text">Help job seekers by sharing your valuable insights and experiences in the field. Make a meaningful impact on their career paths.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title">Personalized Guidance</h3>
                        <p class="card-text">Provide one-on-one guidance tailored to individual strengths and goals. Help individuals find the right career direction.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title">Contribute to Success</h3>
                        <p class="card-text">Be a part of job seekers' success stories. Contribute to their professional growth and development.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 mx-auto text-center">
                <p class="lead">If you're interested in joining our team, you can:</p>
                <div class="row">
                    <div class="col-md-6">
                        <a href="mailto:info@jobcounseling.com" class="btn btn-primary btn-lg btn-block mb-3">Contact Us</a>
                    </div>
                    <div class="col-md-6">
                        <a href="mailto:info@jobcounseling.com?subject=CV Submission" class="btn btn-success btn-lg btn-block mb-3">Send Your CV</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="contact" >
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
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
