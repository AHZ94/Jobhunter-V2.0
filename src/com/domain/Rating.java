package com.domain;


public class Rating {
	private int rateid;
	private String result;
	private int empid;
	private int studid;
	private boolean valid;
	private String description;
	private double average;

	public Rating(int rateid,String result,int empid,int studid, boolean valid,String description, double average){
		super();
		this.rateid=rateid;
		this.result=result;
		this.empid=empid;
		this.studid=studid;		
		this.description=description;
		this.average=average;
		this.valid=valid;
				
	}
	
	public Rating() {
		// TODO Auto-generated constructor stub
	}

	public int getRateid() {
		return rateid;
	}
	public void setRateid(int rateid) {
		this.rateid = rateid;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public int getStudid() {
		return studid;
	}
	public void setStudid(int studid) {
		this.studid = studid;
	}
	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public double getAverage() {
		return average;
	}
	public void setAverage(double average) {
		this.average = average;
	}
	public String getDescription(){
		return description;
	}
	public void setDescription(String description) {
		// TODO Auto-generated method stub
		this.description = description;
	}
	

}
