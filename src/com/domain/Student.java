package com.domain;


public class Student {
	private String id;
	private String name;
	private String phone;
	private String email;
	private String certificate;
	private String background;
	private String password;
	private String address;
	private boolean valid;

	public Student(String id,String name,String phone,String email,String certificate,String background,String password,String address, boolean valid){
		super();
		this.id=id;
		this.name=name;
		this.phone=phone;
		this.email=email;
		this.certificate=certificate;
		this.background=background;
		this.password=password;
		this.address=address;
		this.valid=valid;
	}
	
	public Student() {
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
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

}
