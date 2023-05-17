package com.shoe.model;

public class User {
	private int id;
	private String fullName;
	private String email;
	private String passWord;
	
	
	public User() {
	}
	
	
	public User(int id, String fullName, String email, String passWord) {
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.passWord = passWord;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
}
