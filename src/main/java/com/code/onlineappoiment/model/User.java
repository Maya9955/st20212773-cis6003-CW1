package com.code.onlineappoiment.model;

public class User {

	private int iduser;
	private String fullname;
	private String email;
	private String password;
	private String usertype;

	
	public User() {
		
	}

	public User(int iduser, String fullname, String email,String password,String usertype) {
		this.iduser = iduser;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.usertype = usertype;
		
	}

	public int getiduser() {
		return iduser;
	}

	public void setiduser(int iduser) {
		this.iduser = iduser;
	}

	public String getfullname() {
		return fullname;
	}

	public void setfullname(String fullname) {
		this.fullname = fullname;
	}

	public String getemail() {
		return email;
	}

	public void setemail(String email) {
		this.email = email;
	}	
	
	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password = password;
	}	
	
	public String getusertype() {
		return usertype;
	}
	
	public void setusertype(String usertype) {
		this.usertype = usertype;
	}	


}
