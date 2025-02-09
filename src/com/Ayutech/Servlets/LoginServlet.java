package com.Ayutech.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Ayutech.Helper.ConnectionProvider;
import com.Ayutech.dao.UserDao;
import com.Ayutech.entities.Messages;
import com.Ayutech.entities.UserAyu;

@WebServlet("/LoginServlet")
@MultipartConfig
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LoginServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		//fetch userEmail and Password from request
		
		String customerEmail =request.getParameter("email");
		String customerPassword =request.getParameter("pass");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		UserAyu c = dao.getCustomerByEmailAndPassword(customerEmail, customerPassword);
	
		if(c == null)
		{
			//out.println("Invalid user... please try again ");
			Messages msg = new Messages("Ïnvalid details...! please try again ", "error", "alert-danger");
			
			HttpSession s = request.getSession();
			s.setAttribute("Msg", msg);
		
			response.sendRedirect("LoginForm.jsp");
		}
		else
		{
			HttpSession s = request.getSession();
			s.setAttribute("currentCustomer", c);
			response.sendRedirect("Profile.jsp");
		}
	}	
}
 