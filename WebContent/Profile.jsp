<%@page import="java.util.ArrayList"%>
<%@page import="com.Ayutech.Helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.Ayutech.entities.*" %>
     <%@ page import="com.Ayutech.dao.*" %>
   <%@ page isErrorPage="true" %>
   <%
   UserAyu userAyu = (UserAyu)session.getAttribute("currentCustomer");
   
   if(userAyu==null)
   {
	   response.sendRedirect("LoginForm.jsp");
   }
   
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
									
		<nav class="navbar navbar-expand-lg navbar-dark primary-background mb-2">
  			<a class="navbar-brand" href="Index.jsp"><img src="Images/Mylogo2.png"  style="height:80px;width:250px;"></a>
  				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    						<span class="navbar-toggler-icon"></span>
  				</button>

					  <div class="collapse navbar-collapse" id="navbarSupportedContent">
					    <ul class="navbar-nav mr-auto">
					      <li class="nav-item active">
					        <a class="nav-link" href="#"><span class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a>
					      </li>
					      <li class="nav-item dropdown">
					        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					       	       	<span class="fa fa-shopping-basket"></span>
					       	  Department
					        </a>
					        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
					          <a class="dropdown-item" href="#">Kidney Problems</a>
					          <a class="dropdown-item" href="#">Hearts Problems</a>
					          <div class="dropdown-divider"></div>
					          <a class="dropdown-item" href="#">Skin Care</a>
							  <a class="dropdown-item" href="#">Hair Care</a>
					        </div>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link" href="#"><span class="fa fa-info"></span>About us</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link" href="#"><span class="fa fa-phone"></span>Contact us</a>
					      </li>
					     <li class="nav-item">
					        <a class="nav-link" href="#" data-toggle="modal" data-target="#dopostModal"><span class="fa fa-bell"></span>Do Post</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
					      </li>
					    </ul>
					    
					    
					    <ul class="navbar-nav mr-right">
					    	
					    	<li class="nav-item">
					        	<a class="nav-link" href="#!" data-toggle="modal" data-target="#Profile-Modal"><span class="fa fa-user-circle"><%= userAyu.getUserName() %><%=userAyu.getUserLastName() %></span>  </a>
					    	 </li>					    	
					    	<li class="nav-item">
					        	<a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
					      	</li>
					    </ul>
				  </div>
			</nav>


									<!-- End of Navbar -->				
									
					
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
							
							
							<!-- Main Body -->
			
				<main>
					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<div class="list-group primary-background">
									  <a href="#" onclick="getPost(0,this)" class="c-link list-group-item list-group-item-action active"> All Post </a>							 
									  <%
									  	PostDao p = new PostDao(ConnectionProvider.getConnection());
									  	ArrayList<Category> list1 = p.getAllCatgories();
									  	for(Category cat:list1){
									  %>
									  	<a href="#" onclick="getPost(<%= cat.getCatId() %>,this)" class="c-link list-group-item list-group-item-action"><%=cat.getCatName() %></a>
									  <%								  	
									  	}
									  %>
								</div>							
							</div>	
													
							<div class="col-md-9" >
								<div class="container text-center" id="loader">
									<i class="fa fa-refresh fa-3x fa-spin"></i>
									<h3 class="md-2"> Loading...</h3>
								</div>
								<div class="container-fluid" id="post-container">
								</div>
							</div>
							
							
						</div>
					</div>
				</main>							
														
					
										<!-- Modal -->
					<div class="modal fade" id="Profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header primary-background text-white">
					        <h5 class="modal-title" id="exampleModalLabel">Ayutech</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <div class="container text-center">
					        	<img src="Pic/<%=userAyu.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width:150px"/>
					       		<br>
					       	 	<h5 class="modal-title mt-3" id="exampleModalLabel"><%=userAyu.getUserName()%><%=userAyu.getUserLastName() %></h5>	
						       
						       <div id="profile-details">	 
						       	 
					       	 <table class="table">
									  <thead>
									    <tr>
									      <th scope="col">Properties</th>
									      <th scope="col">Details</th>
									    </tr>
									  </thead>
									  <tbody>
									    <tr>
									      <th scope="row">UserID:</th>
									      <td><%=userAyu.getUserId() %></td>
									     </tr>
									     <tr> 
									      <th scope="row">Name</th>
									      <td><%=userAyu.getUserName() %></td>
									     </tr>
									     <tr>
									      <th scope="row">LastName</th>
									      <td><%=userAyu.getUserLastName() %></td>
									      </tr>
									      <tr>
									      <th scope="row">Email</th>
									      <td><%=userAyu.getEmail() %></td>
									      </tr>
									      <tr>
									      <th scope="row">Mobile Number</th>
									      <td><%=userAyu.getMobile_Number() %></td>
									      </tr>
									      <tr>
									      <th scope="row">Address</th>
									      <td><%=userAyu.getAddress() %></td>
									      </tr>
									      <tr>
									      <th scope="row">City</th>
									      <td><%=userAyu.getCity() %></td>
									      </tr>
									      <tr>
									      <th scope="row">State</th>
									      <td><%=userAyu.getState() %></td>
									      </tr>
									      <tr>
									      <th scope="row">Zip</th>
									      <td><%=userAyu.getZip()%></td>
									      </tr>
									      <tr>
									      <th scope="row">Gender</th>
									      <td><%=userAyu.getGender() %></td>
									      </tr>
									      <tr>
									      <th scope="row">About</th>
									      <td><%=userAyu.getAbout() %></td>
									      </tr>
									      <tr>
									      <th scope="row">Register Time:</th>
									      <td><%=userAyu.getDatetime() %></td>
									    </tr>
									  
									  </tbody>
									</table>
								</div>	
								
							<!-- End of Modal -->
							
							
							
								<!-- Profile Edit -->
								
								
								
								
								<div id="profile-edit" style="display:none;">
								
									<h3 class="mt-2">Edit your Information:</h3>
										<form action="Editservlet" method="post" enctype="multipart/form-data">
										
											<table class="table">
												<tr>
													<td>CustomerID:</td>
													<td><%=userAyu.getUserId() %></td>
												</tr>
												<tr>
													<td>Name:</td>
													<td><input type="text" class="form-control" name="user_cname" value="<%=userAyu.getUserName()%>"></td>
												</tr>
												<tr>
													<td>LastName:</td>
													<td><input type="text" class="form-control" name="user_clastname" value="<%=userAyu.getUserLastName() %>"></td>
												</tr>
												<tr>
													<td>Email:</td>
													<td><input type="email" class="form-control" name="user_cemail" value="<%=userAyu.getEmail() %>"></td>
												</tr>
												<tr>
													<td>Mobile Number:</td>
													<td><input type="text" class="form-control" name="user_cmobile" value="<%=userAyu.getMobile_Number() %>"></td>
												</tr>
												<tr>
													<td>Password:</td>
													<td><input type="password" class="form-control" name="user_cpass" value="<%=userAyu.getPassword() %>"></td>
												</tr>
												<tr>
													<td>Address:</td>
													<td><input type="text" class="form-control" name="user_caddress" value="<%=userAyu.getAddress() %>"></td>
												</tr>
												<tr>
													<td>City:</td>
													<td><input type="text" class="form-control" name="user_ccity" value="<%=userAyu.getCity() %>"></td>
												</tr>
												<tr>
													<td>State:</td>
													<td><input type="text" class="form-control" name="user_cstate" value="<%=userAyu.getState() %>"></td>
												</tr>
												<tr>
													<td>Zip:</td>
													<td><input type="text" class="form-control" name="user_czip" value="<%=userAyu.getZip() %>"></td>
												</tr>
												<tr>
													<td>Gender:</td>
													<td><%=userAyu.getGender() %></td>
												</tr>
												<tr>
													<td>Medical Status:</td>
													<td><textarea type="text" class="form-control" name="user_cabout"><%=userAyu.getAbout() %>"></textarea></td>
												</tr>
												<tr>
													<td>Profile pic:</td>
													<td><input type="file" class="form-control" name="user_cprofile" value="<%=userAyu.getProfile() %>"></td>
												</tr>
											</table>
												<div class="container">
													<button type="submit" class="btn btn-outline-primary">Save</button>
												</div>
										</form>
								</div>					       	 				        
					        </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        <button onclick="Edit()" type="button" class="btn btn-primary">Edit</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					<!-- End  of profile Modal -->
					
					
					<!-- Post Modal -->
					
					<!-- Button trigger modal -->
							
								<!-- Modal -->
								
								
								<div class="modal fade" id="dopostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">Provide Your Title</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								        
								        	<form id="do-post-form" action="Addpostservlet" method="post">
								        		<div class="form-group">
								        			<select class="form-control" name="cId">
								        				<option  selected disabled>--Select Category--</option>
								        				<%
								        					PostDao post = new PostDao(ConnectionProvider.getConnection());
								        					ArrayList<Category> list = post.getAllCatgories();
								        					
								        					for(Category cat: list)
								        					{				
								        				%>
								        					<option  value="<%=cat.getCatId()%>"> <%= cat.getCatName()%> </option>
								        				<%
								        					}
														%>
								        			</select>
								        		
								        		</div>
								        	
								        		<div class="form-group">
								        			<input name="pTitle" type="text" placeholder="Enter Your Title" class="form-control"/>
								        		</div>
								        		
								        		<div class="form-group">
								        			<textarea name="pContent" type="text" placeholder="Add your Content" style="height: 200px" class="form-control"></textarea>
								        		</div>
								        		
								        		<div class="form-group">
								        			<label>Select Your Pic</label>
								        			<br>
								        			<input name="pPic" type="file" class="form-control"/>
								        		</div>
								        		<div class="container text-center" >
								      			<button  type="submit" class="btn btn-outline-primary">Post</button>
								   			   </div>
								        	</form>
								       
								      </div>
								      
								    </div>
								  </div>
								</div>
					
					<!-- End of PostModal -->			
					
	
							<!-- Javascripts and jquery -->
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		<script src="JS/MyJS.js" type="text/javascript"></script>
		
		
		<script >
		
			function Edit(){
				var d=document.getElementById("profile-details");
				var e=document.getElementById("profile-edit");
				if(d.style.display==="none" )
					{
						d.style.display = "block";
						e.style.display = "none";
					}
				else{
					d.style.display = "none";
					e.style.display = "block";
				}
				
			}
			
		</script>
		
		<!-- Do Post -->
		<script >
		
		$(document).ready(function(e){
			$("#do-post-form").on("submit",function(event){
				event.preventDefault();
				console.log("You have submited");
				let form= new FormData(this);
				
				$.ajax({
					url: "AddpostServlet",
					type:'post',
					data:form,
					success:function(data,textStatus,jqXHR){
						//success..
						console.log(data);
						if(data.trim() =='done')
							{
								
								swal("Good job!", "Save Succefully!", "success");
							}
							else
								{
								swal("Oops!", "Something Went Wrong", "error");
								}
					},
					error:function(jqXHR,textStatus,errorThrown){
						//error...
						swal("Oops!", "Something Went Wrong", "error");
					},
					processData: false,
					contentType: false
					
				})
			})
		})
		
		
		</script>
		<!-- Loading Post -->
		<script>
		
		function getPost(CatId,temp){
			$("#loader").show();
			$('#post-container').hide();
			$(".c-link").removeClass('active');
			$.ajax({
				url:"Post.jsp",
				data:{cid:CatId},
				success:function(data,textStatus,jqXHR){
					
					$("#loader").hide();
					$('#post-container').show();
					$('#post-container').html(data);
					$(temp).addClass('active');
				}
			})
		}
		
		$(document).ready(function (e){
			
			let getAllref=$(".c-link")[0];
			getPost(0,getAllref);
			})
		
		
		</script>
		
</body>
</html>