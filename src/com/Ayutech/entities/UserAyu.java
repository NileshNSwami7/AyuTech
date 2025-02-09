package com.Ayutech.entities;

import java.sql.Timestamp;

public class UserAyu {
	private int userId;
	private String userName;
	private String userLastName;
	private String Email;
	private String Mobile_Number;
	private String Password;
	private String Address;
	private String City;
	private String State;
	private String Zip;
	private String Gender;
	private String About;
	private Timestamp datetime;
	private String profile;
	
	public UserAyu() {
		
	}

	public UserAyu( String userName, String userLastName, String email, String mobile_Number, String password,
			String address, String city, String state, String zip, String gender, String about) {
		
		this.userName = userName;
		this.userLastName = userLastName;
		Email = email;
		Mobile_Number = mobile_Number;
		Password = password;
		Address = address;
		City = city;
		State = state;
		Zip = zip;
		Gender = gender;
		About = about;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getMobile_Number() {
		return Mobile_Number;
	}

	public void setMobile_Number(String mobile_Number) {
		Mobile_Number = mobile_Number;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getZip() {
		return Zip;
	}

	public void setZip(String zip) {
		Zip = zip;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getAbout() {
		return About;
	}

	public void setAbout(String about) {
		About = about;
	}

	public Timestamp getDatetime() {
		return datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
	
}