<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carpedia</title>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="/js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<c:url
	value="/javaProject/src/main/resources/static/Images/IMG_4244.jpg"
	var="logo"></c:url>
</head>
<body class="frame2">
	<div class="frame">
		<div class="container mt-2">
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<div class="navbar-brand d-flex" style="color: gray;">
						<div>
							<img src="http://localhost:8080/Images/IMG_4244.jpg" alt="Logo"
								width="110" height="80" class="d-inline-block align-text-top">
						</div>
						<div></div>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse d-flex"
							id="navbarNavDropdown">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/" style="color: gray;">Home</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/about/us" style="color: gray;">About Us</a>
								</li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"
									style="color: gray;"> Reviews </a>
									<ul class="dropdown-menu">
										<li style="color: gray; margin-left:5px; margin-right:5px;">Please login to view this page</li>
									</ul></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"
									style="color: gray;"> Cars for Sale </a>
									<ul class="dropdown-menu">
										<li style="color: gray; margin-left:5px; margin-right:5px;">Please login to view this page</li>
									</ul></li>
							</ul>
						</div>
						<!--  <a href="/login"><button class="button" style="margin-right:30px; margin-top:20px; margin-left:250px;">Login</button></a>-->
						<!-- Vertically centered modal -->
						<div>
							<button class="button"
								style="margin-right: 30px; padding-left: 10px; padding-right: 10px; margin-top: 20px; margin-left: 600px;"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								data-bs-whatever="@getbootstrap">Login</button>
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel + login" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 style="font-family: Times New Roman">Customer Login</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body form-goup">
											 <c:if test="${errorMessage != null}">
										        <c:out value="${errorMessage}"></c:out>
										    </c:if>
											<form:form action="/login" method="POST"
												modelAttribute="newLogin">
												<div class="form-element">
													<form:label path="email">Email</form:label>
													<form:input path="email" class="form-control" id="email"
														placeholder="Enter email" />
													<form:errors path="email" class="text-danger" />
												</div>
												<div class="form-group">
													<form:label path="password">Password: </form:label>
													<form:input path="password" class="form-control"
														type="password" placeholder="Enter password"/>
													<form:errors path="password" class="text-danger" />
												</div>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
												<div class="form-element">
													<button class="button"
														style="padding-left: 5px; padding-right: 5px; margin-top: 5px;">Sign
														in</button>
												</div>
											</form:form>
										</div>
										<div class="form-element" style="padding-left: 15px; padding-right: 15px; margin-bottom:20px;">
											<a href="#">Forgot password?</a>
										</div>
										<button class="button" type="button"
								style="padding-left: 5px; padding-right: 5px;margin-left:100px; margin-right:100px;"
								data-bs-toggle="modal" data-bs-target="#staticBackdrop">Create account</button>
							</div>-->
							<!-- <button class="button" >Create an account</button> -->
							
							<div class="modal fade" id="staticBackdrop" tabindex="-1"
								aria-labelledby="exampleModalLabel + register"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 style="font-family: Times New Roman">Create account</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form:form action="/register" method="POST"
												modelAttribute="newUser">
												<div class="form-group">
													<form:label path="firstName">First Name: </form:label>
													<form:input path="firstName" class="form-control" placeholder="Enter first name"/>
													<form:errors path="firstName" class="text-danger" />
												</div>
												<div class="form-group">
													<form:label path="lastName">Last Name: </form:label>
													<form:input path="lastName" class="form-control" placeholder="Enter last name"/>
													<form:errors path="lastName" class="text-danger" />
												</div>
												<div class="form-group">
													<form:label path="email">Email: </form:label>
													<form:input path="email" class="form-control" placeholder="Enter email"/>
													<form:errors path="email" class="text-danger" />
												</div>
												<div class="form-group">
													<form:label path="password">Password: </form:label>
													<form:input path="password" class="form-control"
														type="password" placeholder="Enter password"/>
													<form:errors path="password" class="text-danger" />
												</div>
												<div class="form-group">
													<form:label path="confirm">Confirm Password: </form:label>
													<form:input path="confirm" class="form-control"
														type="password" placeholder="Confirm password"/>
													<form:errors path="confirm" class="text-danger" />
												</div>
												<button style="margin-top: 20px; padding-left: 5px; padding-right: 5px; margin-top: 5px; margin-bottom: 10px;"
													class="button">Submit</button>
											</form:form>
										</div>
										<div class="modal-footer">
											<button class="button"
												data-bs-dismiss="modal" style="padding-left: 5px; padding-right: 5px; margin-top: 5px;">Close</button>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</nav>
			<h1 style="font-size: 50pt;">Engineered to move the human
				spirit.</h1>
		</div>
	</div>
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
</html>