<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration page</title>
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
								<!-- Navbar -->
		
		<%@include file="Use_NavBar.jsp" %>
		
		
								<!-- Registration Form -->
		
		<main class="primary-background p-5">
			<div class="container">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header text-center primary-background text-white">
							<span class="fa fa-user-plus fa-3x"></span>
							<p>Register Here</p>	
						</div>
						<div class="card-body">
							
							
							<form id="reg-form" action="Register" method="post">

								    <div class="form-group">
								      <label  for="user_name">Name</label>
								      <input name="user_name" type="text" class="form-control" placeholder="First name">
								    </div>
								
								    <div class="form-group">
								    <label  for="user_lastname">Last name</label>
								      <input name="user_lastname" type="text" class="form-control" placeholder="Last name">
								    </div>
					
							
								    <div class="form-group">
								      <label for="inputEmail4">Email</label>
								      <input name="user_Email" type="email" class="form-control" id="inputEmail4" placeholder="Email">
								    </div>
										
									<div class="form-group">
								      <label  for="Mobilenumber">Mobile Number</label>
								      <input name="user_mobile" type="number" class="form-control" id="MobileNumber" placeholder="Mobile Numer">
								    </div>
								  		
										
										
									<div class="form-group">							
								      <label for="inputPassword4">Password</label>
								      <input  name="user_pass" type="password" class="form-control" id="inputPassword4" placeholder="Password">
								   </div>
								   
								   <div class="form-group">
									    <label  for="inputAddress">Address</label>
									    <input name="user_add" type="text" class="form-control" id="inputAddress" placeholder="Address">
								</div>
									
									<div class="form-row">
									    <div class="form-group col-md-6">
									      <label  for="inputCity">City</label>
									      <input name="city" type="text" class="form-control" id="inputCity">
									    </div>
									 
									 
									 <div class="form-group col-md-4">
									      <label  for="inputState">State</label>
									      <select name="state" id="inputState" class="form-control">
									        <option selected>Choose...</option>
									        <option>Andhra Pradesh</option>
									        <option>Arunachal Pradesh</option>
									        <option>Assam</option>
									        <option>Bihar</option>
									        <option>Chhattisgarh</option>
									        <option>Goa</option>
									        <option>Gujarat</option>
									        <option>Haryana</option>
									        <option>Himachal Pradesh</option>
									        <option>Jharkhand</option>
									        <option>Karnataka</option>
									        <option>Kerala	</option>
									        <option>Madhya Pradesh	</option>
									        <option>Maharashtra	</option>
									        <option>Manipur</option>
									        <option>Meghalaya</option>
									        <option>Mizoram	</option>
									        <option>Nagaland</option>
									        <option>Odisha</option>
									        <option>Punjab	</option>
									        <option>Rajasthan</option>
									        <option>Sikkim	</option>
									        <option>Tamil Nadu	</option>
									        <option>Telangana</option>
									        <option>Tripura	</option>
									        <option>Uttar Pradesh	</option>
									        <option>Uttarakhand	</option>
									        <option>West Bengal	</option>
									        <option>Andaman and Nicobar Islands	</option>
									        <option>Chandigarh</option>
									        <option>Dadra & Nagar Haveli and Daman & Diu	</option>
									        <option>Delhi</option>
									        <option>Jammu and Kashmir	</option>
									        <option>Lakshadweep	</option>
									        <option>Puducherry</option>
									        <option>Ladakh</option>
									      </select>
									    </div>
									    
									    
									 <div class="form-group col-md-2">
									      <label for="inputZip">Zip</label>
									      <input name="Zip" type="text" class="form-control" id="inputZip">
									    </div>
									 </div>
									
									<div class="form-group">
									<label for="gender">Select Gender</label>
										<br>
									<input type="radio" id="gender" name="gender" value="male">Male
									<input type="radio" id="gender" name="gender" value="female">Female
									</div>
									
									<div class="form-group">
									    <label for="exampleFormControlTextarea1">About you.</label>
									    <textarea name="About" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
									 </div>
																	   
								    <div class="form-check">
									   <input name="check" class="form-check-input" type="checkbox" id="gridCheck">
									      <label class="form-check-label" for="gridCheck">
										        agree terms and conditions
									     </label>
									</div>
									<br>
									<div class="container text-center" id="loader" style="display:none">
										<span class="fa fa-refresh fa-spin fa-3x"></span>
											<h4>Please wait...</h4>
									</div>						
								<button id ="submit-btn" type="submit" class="btn btn-primary text-center">Submit</button>   
							</form>
						
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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	
		<script>
		
			$(document).ready(function(){
					
				console.log("loaded....")
				
				$('#reg-form').on('submit',function(event){
					event.preventDefault();
					
					$("#submit-btn").hide();
					$("#loader").show();
					
					let form = new FormData(this);
					
					$.ajax({
						url:"RegisterServlet",
						type:'post',
						data:form,
						
						success:function(data,textStatus,jqXHR){
							console.log(data);
							
							$("#submit-btn").show();
							$("#loader").hide();
							
							if(data.trim() === 'done')
							{
								swal("Successfully Registered!", "Redirect to Login", "success")
								.then((value)=> {
								 window.location = "LoginForm.jsp"
								});
							}
							else
								{
									swal("Oops...!",data,"error");
								}
						},
						error: function(jqXHR, textStatus, errorThrown){
							console.log(jqXHR)
							
							$("#submit-btn").show();
							$("#loader").hide();
							swal("Oops...!", "Something went wrong", "error");
						},
						
						processData:false,
						contentType:false
						
					})
				})
				
			})	
		</script>	

</body>
</html>