<%@page import="com.Ayutech.Helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
			<meta charset="ISO-8859-1">
			<title>Project AyuTech</title>
										<!-- css -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<link href="CSS/Mycss.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
			.banner-background{
				clip-path: polygon(0% 0%, 75% 0%, 100% 50%, 75% 100%, 0% 100%);
			}
		</style>
	
	</head>
	<body>
										<!-- Navbar -->
		
		<%@ include file="Use_NavBar.jsp" %>
										
										<!-- Banner -->
				
		<div class="container-fluid p-0 m-0">
			
			<div class="jumbotron primary-background text-white banner-background">
				<div class="container">
					<h3 class="display-3">Welcome to Swami Medical</h3>
						<p>Ayurvedik Medicines is the "power of all the healing"
						 Ayurveda is a system of medicine with historical roots in the Indian subcontinent. Globalized and modernized practices derived from Ayurveda traditions are a type of alternative medicine.</p>
						<p>Welcome to swami Ayurvedic Aushdhalay,
							We have been working at your services since 1994.We will get Ayurvedic medicines from Brands.The only place to get sure Ayurvedic medicines.</p>
						<p>Our store and online shopping provide Ayurvedic and Western herbs,incense, specialty foods, and a variety of Ayurvedic and other products.</p>
						<button class="btn btn-outline-light"><span class="fa fa-external-link"></span>Start its Free</button>
						<a href="LoginForm.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle fa-spin"></span>Login</a>
				</div>
			</div>	
		</div>
		<br>
		<div class="container">
			
			<div class="row mb-2">
			
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Baidynaath</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-primary text-white">Read More</a>
					  </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Dabar</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-primary text-white">Read More</a>
					  </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Himalaya</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-primary text-white">Read More</a>
					  </div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Sandu</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-primary text-white">Read More</a>
					  </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Herbal</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-primary text-white">Read More</a>
					  </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Sharangdhar</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-primary text-white">Read More</a>
					  </div>
					</div>
				</div>
			</div>
		
		</div>	
										
									<!-- Javascripts and jquery -->
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		<script src="JS/MyJS.js" type="text/javascript"></script>

	</body>
</html>