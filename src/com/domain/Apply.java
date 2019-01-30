package com.domain;

public class Apply extends Jobs{
	private String status; 
	
	public Apply(int jobsid,String category,String type,String title,String location,String function,String experience,String description,String maxsalary,String minsalary, String requirement, String date, String status, String id,int studid) 
	{
		super(jobsid,category,type,title,location,function,experience,description,maxsalary,minsalary,requirement,date,status,id,studid);		
	}
	
	public Apply() {
		// TODO Auto-generated constructor stub
	}
	public String getStatus(){
		return status;
	}
	public void setStatus(String status){
		this.status = status;
	}
	
}
