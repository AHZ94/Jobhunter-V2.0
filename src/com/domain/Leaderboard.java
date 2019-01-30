package com.domain;

public class Leaderboard {
	private int studid;
	private String name;
	private double average;
	private int jobsid;
	private int empid;
	private int rateid;
	
	private boolean valid;

	public Leaderboard(int studid,String name,double average,int jobsid,int empid,boolean valid){
		super();
		this.studid=studid;
		this.name=name;
		this.average=average;
		this.jobsid=jobsid;
		this.empid=empid;
		this.valid=valid;		
	}
	public Leaderboard() {
		// TODO Auto-generated constructor stub
	}
	
	public String getName() {			//name
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStudid() {
		return studid;
	}

	public void setStudid(int studid) {		//studid
		this.studid = studid;
	}
	public double getAverage() {
		return average;
	}
	public void setAverage(double average) {	//avg
		this.average = average;
	}
	public int getJobsid() {							//Jobsid
		return jobsid;
	}
	public void setJobsid(int jobsid) {
		this.jobsid = jobsid;
	}
	public int getEmpid() {					//empid
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public int getRateid() {					//rateid
		return rateid;
	}
	public void setRateid(int rateid) {
		this.rateid = rateid;
	}
	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}
}
