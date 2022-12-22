<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="/js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="frame9">
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
									<a href="/dashboard"><button class="button" type="submit" style="margin-left:721px; width:77px;" class="btn btn-primary">Back</button></a>
									<a href="/logout"><button class="button" type="submit" style="margin-left:20px; width:77px;" class="btn btn-primary">Logout</button></a>
								</div>
							</div>
						</div>
					</div>
				</nav>
				<div style="margin-left:100px;"><h1 style="color:white; font-family: ravensara;">Available SUVs</h1></div>
				<div>
					<c:forEach var="thisCar" items="${carList}">
						<c:if test="${thisCar.carType == 'SUV'}">
							<div class="d-flex" style="margin-right:50px;  border-style:solid; margin-left:100px; padding:50px; background-color:white; margin-bottom:20px;" >
								<div class="col-6">
									<div class="d-flex">
										<img style="height:130px; width:180px;" src="<c:out value="${thisCar.image1}"></c:out>" >
										<img style="height:130px; width:180px;" src="<c:out value="${thisCar.image2}"></c:out>">
									</div>
									<div class="d-flex">
										<img style="height:130px; width:180px;" src="<c:out value="${thisCar.image3}"></c:out>">
										<img style="height:130px; width:180px;" src="<c:out value="${thisCar.image4}"></c:out>">
									</div>
									<h5><a href="/cars/${thisCar.id}/reviews"><button class="button" style="width:150px; margin-top:10px;">See Reviews</button></a></h5>
								</div>
								<div class="col-6 d-flex" style="background-color:white;">
									<div style="margin-right:50px; padding-left:20px;">
										<p>Make : <c:out value="${thisCar.carMake}"></c:out></p>
										<p>Model: <c:out value="${thisCar.carModel}"></c:out></p>
										<p>Type : <c:out value="${thisCar.carType}"></c:out></p>
										<p>Manufacture Year : <c:out value="${thisCar.manufactureYear}"></c:out></p>
										<p>Engine : <c:out value="${thisCar.carEngine}"></c:out></p>
										<p>Transmission : <c:out value="${thisCar.transmission}"></c:out></p>
									</div>
									<div>
										<p>Drive Train : <c:out value="${thisCar.driveTrain}"></c:out></p>
										<p>Interior Color : <c:out value="${thisCar.interiorColor}"></c:out></p>
										<p>Exterior Color : <c:out value="${thisCar.exteriorColor}"></c:out></p>
										<p> Fuel Type : <c:out value="${thisCar.fuelType}"></c:out></p>
										<p> Condition : <c:out value="${thisCar.condition}"></c:out></p>
										<p> Price : $<c:out value="${thisCar.price}"></c:out></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
		</div>
	</div>
</body>
<footer class="bg-dark text-center text-white" style="margin-top:20px; background-color:gray;">
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