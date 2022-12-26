<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reviews</title>
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="/js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="frame13">
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
			</div>
			<img src="/${user.photosImagePath}" />
			<div style="margin-left:380px;">
				<form:form action="/cars/${car.id}/reviews" method="post" modelAttribute="review">
		            <h1 class="float-left" style="color:white; font-family: ravensara;">Add a review for this car:</h1>
		            <p class="float-left">
		            	<form:errors path="name" class="text-danger"/>
						<form:textarea style="border-radius:6%;" rows="6" cols="100" class="input" path="name"/>
					</p>
		        	<input class="input" class="button" type="submit" value="Submit"/>
				</form:form>
			</div>
			
			<div class=" row justify-content-center ">
			<c:forEach var="review" items="${reviews}">
            <div class="col-lg-6 col-12 mt-5 ">
                <div class="card mt-3 ">
                    <div class="layer"></div>
                    <div class="content">
                        <div class="card-header text-center border-0">
                            <div class="row justify-content-center my-4">
                                <div class="col">                                  
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-center pb-3 ">
                            <div class="row  justify-content-center">
                                <div class="col text-center justify-content-center ">
                                    <p class="bold text-center px-md-3 para"><c:out value="${review.name}"></c:out>
                                    </p>
								</div>
                            </div>
                        </div>
                        <hr class="mt-auto mb-4">
                        
                        <div class="card-footer text-center border-0 mt-0 pt-0 mb-3">
                            <div class="row text-center name mt-auto ">
                                <div class="col">
                                    <h4 class="mb-0 Elizabeth">Added by <c:out value="${review.user.firstName}"></c:out></h4>
                                    <p><span class="fa fa-star  text-warning mr-1"></span><span
                                            class="fa fa-star text-warning  mr-1"></span><span
                                            class="fa fa-star text-warning  mr-1"></span><span
                                            class="fa fa-star-half-o text-warning mr-1"></span><span
                                            class="fa fa-star-o text-warning mr-1"></span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            <!--  <div class="col-lg-6 col-12 mt-5 ">
                    <div class="card mt-3 ">
                        <div class="layer"></div>
                        <div class="content">
                       		<div class="card-header text-center border-0">
                                <div class="row justify-content-center  my-4">
                                    <div class="col">
                                        <div class="d-flex flex-lg-row flex-column-reverse no-gutters justify-content-center">
                                            <div class="col-3  text-right"><img class="img-fluid" id="quotes" src="https://img.icons8.com/ultraviolet/40/000000/quote-left.png" width="110" height="110"></div>
                                            <div class="col pr-lg-5"><img class=" img-1 mr-lg-5 " src="https://i.imgur.com/HjKTNkG.jpg" ></div>
                                        </div>                                    
                                    </div>
                                </div>
                            </div>
                            <div class="card-body text-center pb-3 ">
                                <div class="row  justify-content-center">
                                    <div class="col text-center justify-content-center ">
                                        <p class="bold text-center px-md-3 para"> Growth of data is exponential and our ability
                                            to get true insight that matter was challenging with classic, traditional Bi
                                            tools. Vertix allow us to unserstand what is driving exceptions so we can take
                                            action Growth of data our ability to get true insight that matter was
                                            challenging with classic.</p>
                                    </div>
                                </div>
                            </div>
                            <hr class="mt-auto mb-4">
                            <div class="card-footer text-center border-0 mt-0 pt-0 mb-3">
                                <div class="row text-center name mt-auto ">
                                    <div class="col">
                                        <h4 class="mb-0 Elizabeth">SMike Housin</h4>
                                        <p><span class="fa fa-star  text-warning mr-1"></span><span
                                                class="fa fa-star text-warning  mr-1"></span><span
                                                class="fa fa-star-o text-warning  mr-1"></span><span
                                                class="fa fa-star-o text-warning mr-1"></span><span
                                                class="fa fa-star-o text-warning mr-1"></span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
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
<!-- Footer -->	
</html>