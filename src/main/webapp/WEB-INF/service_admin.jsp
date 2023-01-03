<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service</title>
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="/js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="frame5">
		<div>
			<nav id="nav2" class="navbar navbar-expand-lg">
						<div class="container-fluid">
							<div class="navbar-brand d-flex" style="color: gray;">
								<div style="margin-left:50px;">
									<img src="http://localhost:8080/Images/IMG_4244.jpg" alt="Logo"
										width="110" height="80" class="d-inline-block align-text-top">
								</div>
								<div>
								<button class="navbar-toggler" type="button"
									data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
									aria-controls="navbarNavDropdown" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>
								<div class="collapse navbar-collapse d-flex" id="navbarNavDropdown">
									<ul class="navbar-nav">
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/" style="color: white;">Home</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/about/us" style="color: white;">About Us</a>
										</li>
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" role="button"
											data-bs-toggle="dropdown" aria-expanded="false"
											style="color: white;"> Cars for Sale </a>
											<ul class="dropdown-menu">
											<li style="color: gray; margin-left:5px; margin-right:5px; "><a style="text-decoration:none; color:black;" href="/view/suv">SUVs</a></li>
											<li style="color: gray; margin-left:5px; margin-right:5px;"><a style="text-decoration:none; color:black;" href="/view/coupe">Coupes</a></li>
											<li style="color: gray; margin-left:5px; margin-right:5px;"><a style="text-decoration:none; color:black;" href="/view/luxury">Luxury Saloon Cars</a></li>
											</ul>
										</li>
									</ul>
									<a href="/dashboard"><button class="button" type="submit" style="margin-left:700px; width:77px;" class="btn btn-primary">Back</button></a>
									<a href="/logout"><button class="button" type="submit" style="margin-left:20px; width:77px;" class="btn btn-primary">Logout</button></a>
								</div>
							</div>
						</div>
					</div>
				</nav>
		</div>
		<div class="d-flex">
			<div style="align-text: center; margin-left:50px; margin-top:30px;" class="col-6">
				<form:form action="/service/locations" method="POST" modelAttribute="newRepair">
				<div class="form-group">
	            	<form:label path="firstName">First Name: </form:label>
	            	<form:input path="firstName" class="form-control"/>
	            	<form:errors path="firstName" class="text-danger"/>
	            </div>
	            <div class="form-group">
	            	<form:label path="lastName">Last Name: </form:label>
	            	<form:input path="lastName" class="form-control"/>
	            	<form:errors path="lastName" class="text-danger"/>
	            </div>
	            <div class="form-group">
	            	<form:label path="make">Make: </form:label>
	            	<form:input path="make" class="form-control"/>
	            	<form:errors path="make" class="text-danger"/>
	            </div>
	            <div  class="form-group">
	            	<form:label path="model">Model: </form:label>
	            	<form:input path="model" class="form-control"/>
	            	<form:errors path="model" class="text-danger"/>
	            </div>
	            <div class="form-group"> 
	            	<form:label path="mileage" >Mileage: </form:label>
	            	<form:input path="mileage" type="number" min="1" class="form-control"/>
	            	<form:errors path="mileage" class="text-danger"/>
	            </div>
	            <div>
					<form:label path="year" class="form-label">Year</form:label>
					<form:input path="year" type="number" min="1980" max="2022" step="1" value="2022" class="form-control"></form:input>
					<form:errors path="year" class="text-danger"/>
				</div>
				<div>
					<form:label path="serviceDate" class="form-label">Requested Service Date</form:label>
					<form:input path="serviceDate" type="date" class="form-control"/>
					<form:errors path="serviceDate" class="text-danger"/>
				</div>
	            <div>
					<form:label path="comments" class="form-label">Comments</form:label>
					<form:textarea path="comments" type="text" class="form-control"/>
					<form:errors path="comments" class="text-danger"/>
				</div>
	            <button class="button" type="submit" style="margin-top:20px; padding:3px 5px;">Submit</button>
				</form:form>
			</div>
			<div class="col-5" style="margin-left:100px; color:white; margin-top:45px;">
				<h2 style="text-decoration-line:underline;">OUR SERVICE HOURS</h2>
				<div style="margin-top:20px;">
					<div class="d-flex">
						<div class="col-4"><h3>MONDAY</h3></div>
						<div><h3>9:00AM - 06:00PM</h3></div>
					</div>
					<div class="d-flex">
						<div class="col-4"><h3>TUESDAY</h3></div>
						<div><h3>9:00AM - 06:00PM</h3></div>
					</div>
					<div class="d-flex">
						<div class="col-4"><h3>WEDNESDAY</h3></div>
						<div><h3>9:00AM - 06:00PM</h3></div>
					</div>
					<div class="d-flex">
						<div class="col-4"><h3>THURSDAY</h3></div>
						<div><h3>9:00AM - 06:00PM</h3></div>
					</div>
					<div class="d-flex">
						<div class="col-4"><h3>FRIDAY</h3></div>
						<div><h3>9:00AM - 06:00PM</h3></div>
					</div>
					<div><h3>CLOSED</h3></div>
					<div><h3>CLOSED</h3></div>
				</div>
				<a href="/scheduled/service"><button class="button" type="submit" style="margin-left:10px; margin-right:10px;">Scheduled Service</button></a>
			</div>
		</div>
	</div>
	<div style="padding-left:50px; background-color:gray;">
		<h2 style="text-decoration-line:underline; color:black; margin-bottom:20px;">DEALERSHIP LOCATIONS</h2>
		<div>
			<div style="margin-right:100px;">
				<h5><img src="http://localhost:8080/Images/location_logo.png" alt="Logo"
												width="20" height="25" class="d-inline-block align-text-top" style="margin-right:10px;"> Carpedia Arlington
				</h5>
				<h5 style="margin-left:30px;">1101 S Joyce Street</h5>
				<h5 style="margin-left:30px;">Arlington</h5>
				<h5 style="margin-left:30px;">VA 22202</h5>
				<p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3106.624260049081!2d-77.06466088471592!3d38.863957079575805!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b7b6dc0286d1ef%3A0x83b0acefd507be78!2sPentagon%20Row!5e0!3m2!1sen!2sus!4v1671385367017!5m2!1sen!2sus" width="1400" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>
			</div>
			<div>
				<h5><img src="http://localhost:8080/Images/location_logo.png" alt="Logo"
												width="20" height="25" class="d-inline-block align-text-top" style="margin-right:10px;"> Carpedia Palm Beach Gardens
				</h5>
				<h5 style="margin-left:30px;">3101 PGA Boulevard</h5>
				<h5 style="margin-left:30px;">Palm Beach Gardens</h5>
				<h5 style="margin-left:30px;">FL 33410</h5>
				<p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3559.7328187662497!2d-80.08776398503124!3d26.84844908315536!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88df2a97de71793d%3A0xa7525972a1832de0!2sThe%20Gardens%20Mall!5e0!3m2!1sen!2sus!4v1671385788675!5m2!1sen!2sus" width="1400" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>
			</div>
		</div>
	</div>
<script src="script.js"></script>
</body>
<footer class="bg-dark text-center text-white">
		<!-- Grid container -->
		<div class="container p-4">
			<!-- Section: Social media -->
			<section class="mb-4">
				<!-- Linkedin -->
				<img src="http://localhost:8080/Images/linkedin-icon-6.png" alt="Logo"
										width="40" height="40" class="d-inline-block align-text-top">

				<!-- Twitter -->
				<img style="border-radius:50%;" src="http://localhost:8080/Images/twitter.jpg" alt="Logo"
										width="40" height="40" class="d-inline-block align-text-top">

				<!-- Google -->
				<img style="border-radius:50%;" src="http://localhost:8080/Images/google-logo.png" alt="Logo"
										width="40" height="40" class="d-inline-block align-text-top">

				<!-- Instagram -->
				<img src="http://localhost:8080/Images/instagram.png" alt="Logo"
										width="40" height="40" class="d-inline-block align-text-top">
										
				<!-- Facebook -->
				<img style="border-radius:25%;"src="http://localhost:8080/Images/facebook.png" alt="Logo"
										width="40" height="40" class="d-inline-block align-text-top">
				<!-- Github -->
				<img style="border-radius:50%;" src="http://localhost:8080/Images/github.png" alt="Logo"
										width="40" height="40" class="d-inline-block align-text-top">
			</section>
			<!-- Section: Social media -->

			<!-- Section: Form -->
			<section class="">
				<form action="">
					<!--Grid row-->
					<div class="row d-flex justify-content-center">
						<!--Grid column-->
						<div class="col-auto">
							<p class="pt-2">
								<strong>Sign up for our newsletter</strong>
							</p>
						</div>
						<!--Grid column-->

						<!--Grid column-->
						<div class="col-md-5 col-12">
							<!-- Email input -->
							<div class="form-outline form-white mb-4">
								<input type="email" id="form5Example21" class="form-control" />
								<label class="form-label" for="form5Example21">Email
									address</label>
							</div>
						</div>
						<!--Grid column-->

						<!--Grid column-->
						<div class="col-auto">
							<!-- Submit button -->
							<button type="submit" class="btn btn-outline-light mb-4">
								Subscribe</button>
						</div>
						<!--Grid column-->
					</div>
					<!--Grid row-->
				</form>
			</section>
			<!-- Section: Form -->

			<!-- Section: Text -->
			<section class="mb-4">
				<p>Please sign up for our newsletter to receive the latest news in everything cars!</p>
			</section>
			<!-- Section: Text -->
		<!-- Grid container -->

		<!-- Copyright -->
		<div class="text-center p-3"
			style="background-color: rgba(0, 0, 0, 0.2);">
			© 2022 Copyright: <a class="text-white"
				href="https://mdbootstrap.com/">carpedia.com</a>
		</div>
	</div>
		<!-- Copyright -->
</footer>
<!-- Footer -->	
</html>