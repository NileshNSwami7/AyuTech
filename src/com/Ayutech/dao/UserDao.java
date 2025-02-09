package com.Ayutech.dao;

import java.sql.*;

import com.Ayutech.entities.UserAyu;

public class UserDao {
	private Connection con;
	
	//constructor
	
	public UserDao(Connection con) {
		this.con=con;
	}
	
	//With the help of this method we insert the data into the database.
	public boolean saveUser(UserAyu userAyu ) {
		
		boolean f =false;
		
		try {
				
				String query = "insert into projectayutech(userName,userLastName,Email,Mobile_Number,Password,Address,City,State,Zip,Gender,About) value(?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt = this.con.prepareStatement(query);
				
				pstmt.setString(1,userAyu.getUserName());
				pstmt.setString(2,userAyu.getUserLastName());
				pstmt.setString(3,userAyu.getEmail());
				pstmt.setString(4,userAyu.getMobile_Number());
				pstmt.setString(5,userAyu.getPassword());
				pstmt.setString(6,userAyu.getAddress());
				pstmt.setString(7,userAyu.getCity());
				pstmt.setString(8,userAyu.getState());
				pstmt.setString(9,userAyu.getZip());
				pstmt.setString(10,userAyu.getGender());
				pstmt.setNString(11,userAyu.getAbout());
			
				pstmt.executeUpdate();
				
				f=true;
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	//get user by Email and Password
	
	public UserAyu getCustomerByEmailAndPassword(String Email,String Password)
	{
		UserAyu customer= null;
		
		try {
				String query = "select * from projectayutech where Email=? and Password=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				
				pstmt.setString(1,Email);
				pstmt.setString(2, Password);//setNString
				
				ResultSet set=pstmt.executeQuery();
				
				if(set.next())
				{
					customer = new UserAyu();
					
					String name = set.getString("userName");
					customer.setUserName(name);
					
					String lname = set.getString("userLastname");
					customer.setUserLastName(lname);
					
					String email = set.getString("Email");
					customer.setEmail(email);
					
					String mobnumber = set.getString("Mobile_Number");
					customer.setMobile_Number(mobnumber);
					
					String password = set.getString("Password");
					customer.setPassword(password);
					
					String address = set.getString("Address");
					customer.setAddress(address);
					
					String city = set.getString("City");
					customer.setCity(city);
					
					String state = set.getString("State");
					customer.setState(state);
					
					String zip =set.getString("Zip");
					customer.setZip(zip);
					
					String gender = set.getString("Gender");
					customer.setGender(gender);
					
					String about = set.getString("About");
					customer.setAbout(about);
					
					customer.setDatetime(set.getTimestamp("Regdate"));
				
					customer.setProfile(set.getString("Profile"));
					
					customer.setUserId(set.getInt("userId"));
				}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return customer;
		
	}
	
	public boolean updateUser(UserAyu userAyu)
	{
		boolean f =false;
		try {
			String query = "update projectayutech set userName=? , userLastName=? , Email=? , Mobile_Number=? , Password=? , Address=?, City=? , State=?, Zip=? , Gender=? , About=? , Profile=? where userId=?";
			
			PreparedStatement p = con.prepareStatement(query);
			
			p.setString(1, userAyu.getUserName());
			p.setString(2, userAyu.getUserLastName());
			p.setString(3, userAyu.getEmail());
			p.setString(4, userAyu.getMobile_Number());
			p.setString(5, userAyu.getPassword());
			p.setString(6, userAyu.getAddress());
			p.setString(7, userAyu.getCity());
			p.setString(8, userAyu.getState());
			p.setString(9, userAyu.getZip());
			p.setString(10, userAyu.getGender());
			p.setString(11, userAyu.getAbout());
			p.setString(12, userAyu.getProfile());
			p.setInt(13, userAyu.getUserId());
			
			
			p.executeUpdate();
			f=true;
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public UserAyu getUserByUserId(int userId) {
		
		UserAyu customer=null;
		try {
				String q = "select * from projectayutech where userId=?";
				PreparedStatement ps = this.con.prepareStatement(q);
				ps.setInt(1, userId);
				
				ResultSet set=ps.executeQuery();
				if(set.next())
				{
					customer = new UserAyu();
					
					String name = set.getString("userName");
					customer.setUserName(name);
					
					String lname = set.getString("userLastname");
					customer.setUserLastName(lname);
					
					String email = set.getString("Email");
					customer.setEmail(email);
					
					String mobnumber = set.getString("Mobile_Number");
					customer.setMobile_Number(mobnumber);
					
					String password = set.getString("Password");
					customer.setPassword(password);
					
					String address = set.getString("Address");
					customer.setAddress(address);
					
					String city = set.getString("City");
					customer.setCity(city);
					
					String state = set.getString("State");
					customer.setState(state);
					
					String zip =set.getString("Zip");
					customer.setZip(zip);
					
					String gender = set.getString("Gender");
					customer.setGender(gender);
					
					String about = set.getString("About");
					customer.setAbout(about);
					
					customer.setDatetime(set.getTimestamp("Regdate"));
				
					customer.setProfile(set.getString("Profile"));
					
					customer.setUserId(set.getInt("userId"));
				}
				
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return customer;
	}
}
