package com.Ayutech.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.Ayutech.entities.Category;
import com.Ayutech.entities.Post;

public class PostDao {
	Connection  con;
	
	public PostDao (Connection con) {
		this.con=con;
	}
	
	public ArrayList<Category> getAllCatgories(){
		ArrayList<Category> list= new ArrayList<>();
		
		try {
			String q="Select * from categories";
			Statement st = this.con.createStatement();
			ResultSet set= st.executeQuery(q);
			
			while(set.next()) {
				
				int catId = set.getInt("cat_Id");
				String catName = set.getString("cat_Name");
				String catDescription = set.getString("cat_Description");
				
				Category cat =new Category(catId, catName, catDescription);
				
				list.add(cat);
			}
		
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean savePost(Post p) {

		
		boolean f = false;
		try {
			
			String q ="insert into post(pTitle,pContent,pPics,cat_Id,userId,userName) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpPics());
			pstmt.setInt(4, p.getCatId());
			pstmt.setInt(5, p.getUserId());
			pstmt.setString(6,p.getuserName());
			
			pstmt.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Post> getAllPost(){
		List<Post> list=new ArrayList<>();
			
			try {
					
				PreparedStatement p = con.prepareStatement("Select * from post order by p_Id desc");
				
				ResultSet set = p.executeQuery();
				
				while(set.next()) {
					
					int pId = set.getInt("p_Id");
					String pTitle = set.getString("pTitle");
					String pContent = set.getString("pContent");
					String pPics = set.getString("pPics");
					Timestamp Date = set.getTimestamp("pDate");
					int catId = set.getInt("cat_Id");
					int userId = set.getInt("userId");
					String userName = set.getString("userName");
					
					Post post = new Post(pId,pTitle,pContent,pPics,Date,catId,userId,userName);
					
					list.add(post);
				}
			}
				catch(Exception e) {
					e.printStackTrace();
				}
			return list;
		}
	
	public List<Post> getPostByCatId(int catId){
		
		List<Post> list = new ArrayList<>();
		
		try {
			
			PreparedStatement p = con.prepareStatement("select * from post where cat_Id=?");
			
			p.setInt(1, catId);
			ResultSet set =p.executeQuery();
			
			while(set.next())
			{
				
				int pId = set.getInt("p_Id");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pPics = set.getString("pPics");
				Timestamp Date = set.getTimestamp("pDate");
				int cId = set.getInt("cat_Id");
				int userId = set.getInt("userId");
				String userName = set.getString("userName");
				
				Post post = new Post(pId,pTitle,pContent,pPics,Date,cId,userId,userName);
				
				list.add(post);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Post getPostByPostId(int postId)
	{
		
		Post post = null;
		String q="select * from post where p_Id=?";
		try {
				PreparedStatement p = this.con.prepareStatement(q);
				p.setInt(1, postId);
				ResultSet set = p.executeQuery();
				if(set.next()) {
					
					int pId = set.getInt("p_Id");
					String pTitle = set.getString("pTitle");
					String pContent = set.getString("pContent");
					String pPics = set.getString("pPics");
					Timestamp Date = set.getTimestamp("pDate");
					int cId = set.getInt("cat_Id");
					int userId = set.getInt("userId");
					String userName = set.getString("userName");
					
					post = new Post(pId,pTitle,pContent,pPics,Date,cId,userId,userName);
					
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		return post;
	}
}
