package com.Ayutech.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Ayutech.entities.Messages;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LogoutServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		try {
		HttpSession s = request.getSession();
		
		s.removeAttribute("currentCustomer");
		
		Messages m= new Messages("Logout Successfully ..!","success","alert-success");
		s.setAttribute("Msg", m);
		
		response.sendRedirect("LoginForm.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
