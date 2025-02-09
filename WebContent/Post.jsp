
<%@page import="com.Ayutech.entities.UserAyu"%>
<%@ page import="com.Ayutech.dao.*"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Ayutech.entities.Post" %>
<%@ page import="com.Ayutech.Helper.ConnectionProvider" %>

<div class="row">
<%
	UserAyu user = (UserAyu)session.getAttribute("currentCustomer");
	Thread.sleep(1000);
	PostDao p = new PostDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> list=null;
	
	if(cid==0){
		 list = p.getAllPost();
	}else{
		list = p.getPostByCatId(cid);
	}
	if(list.size() == 0){
		out.println("<h3 class='display-3-text-center'>No Post Is Available Now</h3>");
		return ;
	}
	
	
	for(Post c:list){

%>
	<div class="col-md-6 mt-2">
		<div class="card">
			
			<div class="card-header">
				<b><%=c.getpTitle() %></b>
			</div>
			
			 <img class="card-img-top" src="Blog_pic/<%=c.getpPics() %>" alt="Card image cap">
			<div class="card-body">
				<p class="text"><%=c.getpContent() %></p>
			</div>
			<div class="card-footer text-center primary-background">
				<%
					LikeDao ld = new LikeDao (ConnectionProvider.getConnection());
				%>
				<a href="#!" onclick="doLike(<%=c.getpId()%>,<%=user.getUserId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="ld-counter"><%=ld.countLikeOnPost(c.getpId()) %></span></a>
				
				<a href="Show_Blog.jsp?post_Id=<%=c.getpId() %>" class="btn btn-outline-light btn-sm">Read More.</a>
				
				<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>

			</div>
		</div>
	</div>

<%
	}
%>
</div>