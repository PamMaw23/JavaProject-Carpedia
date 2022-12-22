<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Vehicle</title>
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="/js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="frame8">
	<div>
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
											aria-current="page" href="#" style="color: white;">About Us</a>
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
									<a href="/dashboard"><button class="button" type="submit" style="margin-left:580px; width:77px;" class="btn btn-primary">Back</button></a>
									<a href="/logout"><button class="button" type="submit" style="margin-left:20px; width:77px;" class="btn btn-primary">Logout</button></a>
								</div>
							</div>
						</div>
					</div>
				</nav>
		</div>
		<h1 style="font-family: Times New Roman; margin-left:65px;color: white;">Add a vehicle</h1>
		<div class="d-flex ">
			<div style="padding-left: 15px; padding-right: 15px; align-text: center; color:white; 
			margin-left:50px; margin-top:30px;" class="col-6">
				<form:form action="/vehicle/new" method="POST"
					modelAttribute="newCar">
					<div class="form-group">
						<form:label path="carMake" style="background-color:teal;" class="col-12"> Vehicle Make: </form:label>
						<form:input path="carMake" class="form-control"/>
						<form:errors path="carMake" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="carModel" style="background-color:teal;" class="col-12">Vehicle Model: </form:label>
						<form:input path="carModel" class="form-control"/>
						<form:errors path="carModel" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="carType" style="background-color:teal;" class="col-12">Vehicle Type: </form:label>
						<form:input path="carType" class="form-control"/>
						<form:errors path="carType" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="carEngine" style="background-color:teal;" class="col-12">Vehicle Engine: </form:label>
						<form:input path="carEngine" class="form-control"/>
						<form:errors path="carEngine" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="manufactureYear" style="background-color:teal;" class="col-12">Manufacture Year: </form:label>
						<form:input path="manufactureYear" class="form-control"/>
						<form:errors path="manufactureYear" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="transmission" style="background-color:teal;" class="col-12">Transmission: </form:label>
						<form:input path="transmission" class="form-control"/>
						<form:errors path="transmission" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="driveTrain" style="background-color:teal;" class="col-12" >Drive Train: </form:label>
						<form:input path="driveTrain" class="form-control"/>
						<form:errors path="driveTrain" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="interiorColor" style="background-color:teal;" class="col-12">Interior Color: </form:label>
						<form:input path="interiorColor" class="form-control"/>
						<form:errors path="interiorColor" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="exteriorColor" style="background-color:teal;" class="col-12">Exterior Color: </form:label>
						<form:input path="exteriorColor" class="form-control"/>
						<form:errors path="exteriorColor" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="fuelType" style="background-color:teal;" class="col-12">Fuel Type: </form:label>
						<form:input path="fuelType" class="form-control"/>
						<form:errors path="fuelType" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="condition" style="background-color:teal;" class="col-12">Condition: </form:label>
						<form:input path="condition" class="form-control"/>
						<form:errors path="condition" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="price" style="background-color:teal;" class="col-12">Price: $ </form:label>
						<form:input path="price" type="number" min="0" class="form-control"/>
						<form:errors path="price" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="image1" style="background-color:teal;" class="col-12">Image 1 link: </form:label>
						<form:input path="image1" class="form-control"/>
						<form:errors path="image1" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="image2" style="background-color:teal;" class="col-12">Image 2 link: </form:label>
						<form:input path="image2" class="form-control"/>
						<form:errors path="image2" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="image3" style="background-color:teal;" class="col-12">Image 3 link: </form:label>
						<form:input path="image3"  class="form-control"/>
						<form:errors path="image3" css="text-danger" />
					</div>
					<div class="form-group">
						<form:label path="image4" style="background-color:teal;" class="col-12">Image 4 link: </form:label>
						<form:input path="image4" class="form-control"/>
						<form:errors path="image4" class="text-danger" />
					</div>
					<button style="margin-top: 20px; padding-left: 5px; padding-right: 5px; margin-bottom: 20px;"
						class="button">Submit</button>
				</form:form>
			</div>
			<div class="d-flex col-4" style="margin-left:65px; margin-top:30px;">
				<div>
					<input type="file" name="inpFile" id="inpFile" class="col-12" style="color:white; background-color:teal;">
					<div class="image-preview" id="imagePreview">
						<img src="" alt="Image Preview" class="image-preview__image">
						<span class="image-preview__default-text">Image Preview</span>
					</div>
				</div>
			</div>
		</div>
	
	</div>
<script>
	const inpFile = document.getElementById("inpFile");
	const previewContainer = document.getElementById("imagePreview");
	const previewImage = previewContainer.querySelector(".image-preview__image");
	const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
	
	inpFile.addEventListener("change", function(){
		const file=this.files[0];
		
		if(file){
			const reader = new FileReader();
			
			previewDefaultText.style.display = "none";
			previewImage.style.display = "block";
			
			reader.addEventListener("load", function(){
				previewImage.setAttribute("src", this.result);
			})
			reader.readAsDataURL(file);
		} else{
			previewDefaultText.style.display = null;
			previewImage.style.display = null;
			previewImage.setAttribute("src", "");
			
		}
	})
</script>
</body>
<footer class="bg-dark text-center text-white" style="margin-top:20px;">
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