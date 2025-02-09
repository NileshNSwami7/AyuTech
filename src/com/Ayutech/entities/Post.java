package com.Ayutech.entities;

import java.sql.Timestamp;

public class Post {
	private int p_Id;
	private String pTitle;
	private String pContent;
	private String pPics;
	private Timestamp pDate;
	private int catId;
	private int userId;
	private String userName;
	private String cat_Name;

	
	
	public Post(String pTitle, String pContent, String pPics, Timestamp pDate, int catId,int userId,String userName) {
//	String userName,String catName) {
		
		
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pPics = pPics;
		this.pDate = pDate;
		this.catId = catId;
		this.userId = userId;
		this.userName = userName;
		
		
	}

	public Post(int pId, String pTitle, String pContent, String pPics, Timestamp pDate, int catId, int userId,String userName) {
//	,String userName,String catName) {
	
		this.p_Id = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pPics = pPics;
		this.pDate = pDate;
		this.catId = catId;
		this.userId = userId;
		this.userName = userName;
		//this.cat_Name = catName;
//		
		
	}

	public Post() {
		
	}

	public int getpId() {
		return p_Id;
	}

	public void setpId(int pId) {
		this.p_Id = pId;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpPics() {
		return pPics;
	}

	public void setpPics(String pPics) {
		this.pPics = pPics;
	}

	public Timestamp getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	public int getCatId() {
		return catId;
	}

	public String getuserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCat_Name() {
		return cat_Name;
	}

	public void setCat_Name(String cat_Name) {
		this.cat_Name = cat_Name;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId=userId;
	}
	
}
