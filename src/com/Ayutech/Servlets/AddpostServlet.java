package com.Ayutech.Servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.Ayutech.Helper.ConnectionProvider;
import com.Ayutech.Helper.Helper;
import com.Ayutech.dao.PostDao;
import com.Ayutech.entities.Category;
import com.Ayutech.entities.Post;
import com.Ayutech.entities.UserAyu;


@SuppressWarnings("unused")
@WebServlet("/AddpostServlet")
@MultipartConfig
public class AddpostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddpostServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		int cId=Integer.parseInt(request.getParameter("cId"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		Part part = request.getPart("pPic");
		
		//getting current userId
		HttpSession  ses = request.getSession();
		UserAyu userAyu = (UserAyu) ses.getAttribute("currentCustomer");
		
//		out.println("Yur Title:"+pTitle);
//		out.println(part.getSubmittedFileName());
//		
		
		
		Post p = new Post(pTitle,pContent,part.getSubmittedFileName(),null,cId,userAyu.getUserId(),userAyu.getUserName());
		
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(p)) {
			String path1 ="E:\\New JavaProject\\Project_AyuTech\\WebContent\\"+"Blog_pic"+File.separator+part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path1);
			out.println("done");
			
		}
		else {
			out.println("error");
		}
	}

}
