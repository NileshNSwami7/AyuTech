package com.Ayutech.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Ayutech.Helper.ConnectionProvider;
import com.Ayutech.dao.LikeDao;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LikeServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
			try {
			String operation = request.getParameter("operation");
			int pid = Integer.parseInt(request.getParameter("pid"));
			int uid= Integer.parseInt(request.getParameter("uid"));
			
			out.println("data from server");
			out.println(operation);
			out.println(uid);
			out.println(pid);
			
			LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
		
			if(operation.equals("like"))
			{
				boolean f = ldao.InsertLike(pid,uid);
				out.println(f);
			}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
	}

}
