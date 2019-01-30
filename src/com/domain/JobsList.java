package com.domain;

public class JobsList extends Jobs{
	private int total;	
	private String id;
	
	
	public JobsList(int jobsid,String category,String type,String title,String location,String function,String experience,String description,String maxsalary,String minsalary, String requirement, String date, String status, String id,int studid) {
		super(jobsid,category,type,title,location,function,experience,description,maxsalary,minsalary,requirement,date,status,id,studid);	
	}
	
	public JobsList() {
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setEmpid(String id) {
		this.id = id;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
