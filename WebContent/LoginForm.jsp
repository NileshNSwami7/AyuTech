<%@page import="com.Ayutech.entities.Messages"%>
<%@page import="com.Ayutech.Servlets.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
							<!-- CSS -->
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
				<!-- Navbaar -->
				
	<%@include file="Use_NavBar.jsp" %>
	
	
					<!-- Login Page -->
					
					
	<main class="d-flex align-items-center primary-background" style="height:80vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-circle fa-3x"></span>
							<p>Login Here</p>
						</div>
							<%
								Messages m =(Messages)session.getAttribute("Msg");
								if(m!=null){
							%>
								<div class="alert <%= m.getCssFile() %>" role="alert">
 								 	<%= m.getContent()%>
								</div>
							<%
								session.removeAttribute("Msg");
								}
							
							%>
						
						<div class="card-body">
							<form action ="log" method="post">
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input  name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input name="pass" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
							  </div>
							  <div class="container text-center">
							  		<button type="submit" class="btn btn-primary">Submit</button>
							  </div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	</main>

							<!-- Javascripts and jquery -->
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		<script src="JS/MyJS.js" type="text/javascript"></script>

</body>
</html>