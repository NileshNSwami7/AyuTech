package com.Ayutech.Helper;
import java.sql.*;

public class ConnectionProvider {
	
	private static Connection con;
	
	public static Connection getConnection()
	{
		try
		{
			if(con==null) {
			//Driver class load
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Create a connection
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ayutech","root","Tiger@1");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	

}
