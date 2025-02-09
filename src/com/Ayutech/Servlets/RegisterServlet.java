package com.Ayutech.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Ayutech.Helper.ConnectionProvider;
import com.Ayutech.dao.UserDao;
import com.Ayutech.entities.UserAyu;

@WebServlet("/RegisterServlet")
@MultipartConfig   // It will accept all the data whether it is pictures or all other data.
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RegisterServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		try {

			String check=request.getParameter("check");
			if(check == null)
			{
				out.println("Please checked terms & condition");
			}
			else{
				
				// Here we fetch the data from Registration form
				
				String userName = request.getParameter("user_name");
				String userLastname = request.getParameter("user_lastname");
				String email = request.getParameter("user_Email");
				String mobile_Number = request.getParameter("user_mobile");
				String password = request.getParameter("user_pass");
				String address = request.getParameter("user_add");
				String city = request.getParameter("city");
				String state = request.getParameter("state");
				String zip = request.getParameter("Zip");
				String gender = request.getParameter("gender");
				String about = request.getParameter("About");
				
				
				
				//create userAyu object and set all data to that object.
				
				UserAyu customer = new UserAyu(userName,userLastname,email,mobile_Number, password, address, city, state,zip, gender, about); 
				
			
				//create user dao Object and give the database connection.
				
				UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
				if(userName==null || userName.equals(""))
					{
						out.println("Enter your name");
					}
				else if(userLastname==null || userLastname.equals(""))
					{
						out.println("Enter your lastname");
					}
				else if(email==null || email.equals(""))
					{
					out.println("Enter your email");
					}
				else if(mobile_Number==null || mobile_Number.equals(""))
					{
						out.println("Enter your mobile number");
					}
				else if(password==null || password.equals(""))
					{
						out.println("Enter your password");
					}
				else if(address==null || address.equals(""))
					{
						out.println("Enter your Address");
					}
				else if(city==null || city.equals(""))
					{
						out.println("Enter your city");
					}
				else if(state==null || state.equals(""))
					{
						out.println("Enter your state");
					}
				else if(zip==null || zip.equals(""))
					{
						out.println("Enter your Zipcode");
					}
				else if(gender==null || gender.equals(""))
					{
						out.println("Enter your gender");
					}
				else
					{
					
					  if(dao.saveUser(customer)) //Here we pass the userAyu(customer) object to the method saveUser and control goes to the UserDao.
						{					
							out.println("done");
						}
					  else if(email.equals(email))
						{
							out.println("Email already exist...!");
						}
						else
						{
							
							out.println("Please fill the all information");
						}
					}	
			}
				
		}	
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
