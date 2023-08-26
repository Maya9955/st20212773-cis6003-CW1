package com.code.onlineappoiment.model;

public class Appoiment {

	private int idappoiment;
	private String name;
	private String email_id;
	private String ph_no;
	private String date;
	private String status;

	
	public Appoiment() {
		
	}

	public Appoiment(int idappoiment, String name, String email_id,String ph_no,String date,String status) {
		this.idappoiment = idappoiment;
		this.name = name;
		this.email_id = email_id;
		this.ph_no = ph_no;
		this.date = date;
		this.status = status;
	}

	public int getidappoiment() {
		return idappoiment;
	}

	public void setidappoiment(int idappoiment) {
		this.idappoiment = idappoiment;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getemail_id() {
		return email_id;
	}

	public void setemail_id(String email_id) {
		this.email_id = email_id;
	}	
	
	public String getph_no() {
		return ph_no;
	}

	public void setph_no(String ph_no) {
		this.ph_no = ph_no;
	}	
	
	public String getdate() {
		return date;
	}
	
	public void setdate(String date) {
		this.date = date;
	}	

	public void setstatus(String status) {
		this.status = status;
	}	
	
	public String getstatus() {
		return status;
	}



}
