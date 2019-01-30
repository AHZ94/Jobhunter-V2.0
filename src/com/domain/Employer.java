package com.domain;


public class Employer {
	private String id;
	private String name;
	private String email;
	private String password;
	private String phone;
	private String compname;
	private String industry;
	private String address;
	private String active;
	private boolean valid;

	public Employer(String id){
	this.id = id;
	}
	public Employer(String id,String name,String email,String password,String phone,String compname,String industry,String address, boolean valid,String active){
		super();
		this.id=id;
		this.name=name;
		this.password=password;
		this.email=email;
		this.phone=phone;
		this.compname=compname;
		this.industry=industry;
		this.address=address;
		this.valid=valid;
		this.active=active;
	}
	
	public Employer() {
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCompname() {
		return compname;
	}
	public void setCompname(String compname) {
		this.compname = compname;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
}
