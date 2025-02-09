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
import com.Ayutech.dao.UserDao;
import com.Ayutech.entities.Messages;
import com.Ayutech.entities.UserAyu;


@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");		
		PrintWriter out = response.getWriter();	
		
		
		//fetch the data from editing form.
		
		String c_name = request.getParameter("user_cname");
		String c_lastname = request.getParameter("user_clastname");
		String c_email = request.getParameter("user_cemail");
		String c_mobile = request.getParameter("user_cmobile");
	//	String c_DOB = request.getParameter("user_cdob");
		String c_password = request.getParameter("user_cpass");
		String c_address = request.getParameter("user_caddress");
		String c_city = request.getParameter("user_ccity");
		String c_state = request.getParameter("user_cstate");
		String c_zip = request.getParameter("user_czip");
		String c_status = request.getParameter("user_cabout");
		
		Part part = request.getPart("user_cprofile");
		String c_profile = part.getSubmittedFileName();
		
		
		//get the user from the session
		
		HttpSession ses = request.getSession();
		UserAyu userAyu = (UserAyu)ses.getAttribute("currentCustomer");
		
		userAyu.setUserName(c_name);
		userAyu.setUserLastName(c_lastname);
		userAyu.setEmail(c_email);
		userAyu.setMobile_Number(c_mobile);
		userAyu.setPassword(c_password);
		userAyu.setAddress(c_address);
		userAyu.setCity(c_city);
		userAyu.setState(c_state);
		userAyu.setZip(c_zip);
		userAyu.setAbout(c_status);
		String oldFile = userAyu.getProfile();
		userAyu.setProfile(c_profile);
		
		//update database
		
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
	
		boolean ans = userDao.updateUser(userAyu);
		if(ans)
		{
			
			String path ="E:\\New JavaProject\\Project_AyuTech\\WebContent\\"+"Pic"+File.separator+userAyu.getProfile();
			
			System.out.println(path);
			String patholdFile ="E:\\New JavaProject\\Project_AyuTech\\WebContent\\"+"Pic"+File.separator+oldFile;
			
			if(!oldFile.equals("default.png")) {
				Helper.deleteFile(patholdFile);
			}
			if(Helper.saveFile(part.getInputStream(), path))
			{
				Messages msg = new Messages("Profile details updated...! Thank you", "success", "alert-success");
				HttpSession s = request.getSession();
				s.setAttribute("Msg", msg);
			}
			else {
				Messages msg = new Messages("Oops Something Went Wrong...!", "error", "alert-danger");
				HttpSession s = request.getSession();
				s.setAttribute("Msg", msg);
			}
			
			
		}
		else {
				Messages msg = new Messages("Oops Something Went Wrong...!", "error", "alert-danger");
				
				HttpSession s = request.getSession();
				s.setAttribute("Msg", msg);
		}
		response.sendRedirect("Profile.jsp");
	}

}
