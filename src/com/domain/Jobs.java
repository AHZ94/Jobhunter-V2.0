package com.domain;


public class Jobs extends Employer{
	private int jobsid;
	private String category;
	private String type;
	private String title;
	private String location;	
	private String function;
	private String experience;
	private String description;
	private String maxsalary;
	private String minsalary;
	private String requirement;
	private String date;
	private String status;	
	private String id;
	private int studid;

	public Jobs(int jobsid,String category,String type,String title,String location,String function,String experience,String description,String maxsalary,String minsalary, String requirement, String date, String status, String id,int studid) {
		super(id);
		this.jobsid=jobsid;
		this.category=category;
		this.type=type;
		this.title=title;
		this.location=location;
		this.function=function;		
		this.experience=experience;
		this.description=description;
		this.maxsalary=maxsalary;
		this.minsalary=minsalary;		
		this.requirement=requirement;
		this.date=date;
		this.status=status;
		this.id = id;		
	}
	
	public Jobs() {
		// TODO Auto-generated constructor stub
	}

	public String getCategory() {						//category
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getType() {							//Type
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {							//Title
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {						//Location
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getFunction() {						//Function
		return function;
	}
	public void setFunction(String function) {
		this.function = function;
	}
	public String getExperience() {						//Experience
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getDescription() {					//Description
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMaxsalary() {						//Maxsalary
		return maxsalary;
	}
	public void setMaxsalary(String maxsalary) {		
		this.maxsalary= maxsalary;
	}
	public String getMinsalary() {						//Minsalary
		return minsalary;
	}
	public void setMinsalary(String minsalary) {
		this.minsalary = minsalary;
	}
	public String getRequirement() {					//Requirement
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public String getDate() {							//Date
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatus() {							//Status
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmpid() {							//Empid
		return id;
	}
	public void setEmpid(String id) {
		this.id = id;
	}
	public int getJobsid() {							//Jobsid
		return jobsid;
	}
	public void setJobsid(int jobsid) {
		this.jobsid = jobsid;
	}
	public int getStudid() {							//Jobsid
		return studid;
	}
	public void setStudid(int studid) {
		this.studid = studid;
	}


}
