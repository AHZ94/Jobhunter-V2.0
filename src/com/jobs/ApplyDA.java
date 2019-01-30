package com.jobs;

import java.util.*;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

import com.domain.Apply;
import com.domain.Employer;
import com.domain.Jobs;
import com.domain.Leaderboard;
import com.domain.Rating;
import com.domain.Student;
import com.dataAccess.ConnectionManager;

public class ApplyDA		{
		static Connection currentCon = null;
		static ResultSet rs = null; 
		static PreparedStatement ps=null;
		static Statement stmt=null;
		static String jobsid, category, type, title, location, function, experience, description, maxsalary, minsalary, requirement, date, status, empid, studid;

		//Apply jobs		
		public Apply add(String jobsid,String id) {			//add void if nothing return
			Apply app=new Apply();	        
	                        
	            try {
	            	currentCon = ConnectionManager.getConnection();
	                ps=currentCon.prepareStatement("INSERT INTO APPLIES(JOBSID,STUDID) VALUES(?,?)");
	                
	                ps.setInt(1,Integer.parseInt(jobsid));
	                ps.setInt(2, Integer.parseInt(id));	                
	                ResultSet rs = ps.executeQuery();
	                
	                if (rs.next()) {                    
	                    //Pass in Apply java
	                    app.setJobsid(rs.getInt("JOBSID"));	                    
	                    app.setId(rs.getString("STUDID"));
	                    System.out.print("jobsid:"+ app.getJobsid());	                    
	                    System.out.print("Studid:"+ app.getId());
	                }            
	            } catch (Exception e) {}

	            return app;
	        }	
		
		//Apply jobs		
		public void updateApplies(Jobs bean) throws NoSuchAlgorithmException{						
	                
			status = bean.getStatus();		
			int jobsid = bean.getJobsid();
			int studid = bean.getStudid();
			
			String searchQuery = "UPDATE JOBS SET STATUS ='"+status+"',STUDID='"+studid+"' WHERE JOBSID='"+jobsid+"'";
					
			try {

	            currentCon = ConnectionManager.getConnection();
	            stmt = currentCon.createStatement();
	            stmt.executeUpdate(searchQuery);
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
		
		
				
		//get student apply joblists
	    public List<Jobs> getAllapplyLists(int email) {
	    	 List<Jobs> list = new ArrayList<Jobs>();
	    	  try {
	    	  	currentCon = ConnectionManager.getConnection();
	    	  	stmt = currentCon.createStatement();
	    	  
	    	  	  String query = "SELECT APP.JOBSID,APP.STUDID, J.JOBSCATEGORY, J.JOBSTYPE, J.JOBSTITLE,J.DESCRIPTION,J.JOBSLOCATION,J.EXPERIENCE,J.JOBSFUNCTION,J.MAXSALARY,J.MINSALARY,J.EMPID,J.STATUS,J.DATES,J.REQUIREMENT FROM JOBS J RIGHT OUTER JOIN APPLIES APP ON J.JOBSID = APP.JOBSID WHERE APP.STUDID='"+email+"'";   	  	  
	    	  	  ResultSet rs = stmt.executeQuery(query);
	    	      
	    	      while (rs.next()) {
	    	          Jobs jobs= new Jobs();
	    	          jobs.setJobsid(rs.getInt("JOBSID"));
	    	          jobs.setCategory(rs.getString("JOBSCATEGORY"));
	    	          jobs.setType(rs.getString("JOBSTYPE"));
	    	          jobs.setTitle(rs.getString("JOBSTITLE"));
	    	          jobs.setDescription(rs.getString("DESCRIPTION"));
	    	          jobs.setLocation(rs.getString("JOBSLOCATION"));
	    	          jobs.setExperience(rs.getString("EXPERIENCE"));
	    	          jobs.setFunction(rs.getString("JOBSFUNCTION"));
	    	          jobs.setEmpid(rs.getString("EMPID"));
	    	          jobs.setMaxsalary(rs.getString("MAXSALARY"));
	    	          jobs.setMinsalary(rs.getString("MINSALARY"));
	    	          jobs.setStatus(rs.getString("STATUS"));
	    	          jobs.setDate(rs.getString("DATES"));	
	    	          jobs.setRequirement(rs.getString("REQUIREMENT"));
	    	          
	    	          list.add(jobs);
	    	          
	    	          System.out.print("Jobid:"+jobs.getJobsid());	    	          	    	             	         
	    	          
	    	      }
	    	  } catch (SQLException e) {
	    	      e.printStackTrace();
	    	  }
	    	  return list;
	    	}
	    	    
	    
	    //get list employer job posted
	    public List<Jobs> getAllapplysListss(int email) {
	    	 List<Jobs> list = new ArrayList<Jobs>();
	    	  try {
	    	  	currentCon = ConnectionManager.getConnection();
	    	  	stmt = currentCon.createStatement();
	    	  
	    	  	  String query = "SELECT APP.JOBSID,APP.STUDID, J.JOBSCATEGORY, J.JOBSTYPE, J.JOBSTITLE,J.DESCRIPTION,J.JOBSLOCATION,J.EXPERIENCE,J.JOBSFUNCTION,J.MAXSALARY,J.MINSALARY,J.EMPID,J.STATUS,J.DATES,J.REQUIREMENT,J.STUDID FROM JOBS J RIGHT OUTER JOIN APPLIES APP ON J.JOBSID = APP.JOBSID WHERE J.EMPID='"+email+"'";   	  	  
	    	  	  ResultSet rs = stmt.executeQuery(query);
	    	      
	    	      while (rs.next()) {
	    	          Jobs jobs= new Jobs();
	    	          jobs.setJobsid(rs.getInt("JOBSID"));
	    	          jobs.setCategory(rs.getString("JOBSCATEGORY"));
	    	          jobs.setType(rs.getString("JOBSTYPE"));
	    	          jobs.setTitle(rs.getString("JOBSTITLE"));
	    	          jobs.setDescription(rs.getString("DESCRIPTION"));
	    	          jobs.setLocation(rs.getString("JOBSLOCATION"));
	    	          jobs.setExperience(rs.getString("EXPERIENCE"));
	    	          jobs.setFunction(rs.getString("JOBSFUNCTION"));
	    	          jobs.setEmpid(rs.getString("EMPID"));
	    	          jobs.setMaxsalary(rs.getString("MAXSALARY"));
	    	          jobs.setMinsalary(rs.getString("MINSALARY"));
	    	          jobs.setStatus(rs.getString("STATUS"));
	    	          jobs.setDate(rs.getString("DATES"));
	    	          jobs.setRequirement(rs.getString("REQUIREMENT"));
	    	          jobs.setStudid(rs.getInt("STUDID"));
	    	          
	    	          list.add(jobs);
	    	          
	    	          System.out.print(jobs.getJobsid());
	    	          System.out.print(jobs.getStudid());
	    	          System.out.println("DA");
	    	          
	    	      }
	    	  } catch (SQLException e) {
	    	      e.printStackTrace();
	    	  }
	    	  return list;
	    	}
	    
	    //get all applicant
	    public List<Leaderboard> getAllApplicants(int jobsid) {
	    	 List<Leaderboard> list = new ArrayList<Leaderboard>();
	    	  try {
	    	  	currentCon = ConnectionManager.getConnection();
	    	  	stmt = currentCon.createStatement();
	    	  
	    	  	  String query = "SELECT APP.STUDID,S.STUDNAME, APP.JOBSID,J.EMPID FROM JOBS J RIGHT OUTER JOIN APPLIES APP RIGHT OUTER JOIN STUDENT S ON APP.STUDID=S.STUDID ON J.JOBSID = APP.JOBSID WHERE J.JOBSID='"+jobsid+"'";   	  	  
	    	  	  ResultSet rs = stmt.executeQuery(query);
	    	      
	    	      while (rs.next()) {
	    	    	  Leaderboard lead= new Leaderboard();
	    	    	  lead.setStudid(rs.getInt("STUDID"));
	    	    	  lead.setName(rs.getString("STUDNAME"));
	    	    	  lead.setJobsid(rs.getInt("JOBSID"));
	    	    	  lead.setEmpid(rs.getInt("EMPID"));	    	    	  
	    	          list.add(lead);
	    	          
	    	          System.out.print(lead.getJobsid());
	    	          System.out.print(lead.getName());
	    	          System.out.println("DA");
	    	          
	    	      }
	    	  } catch (SQLException e) {
	    	      e.printStackTrace();
	    	  }
	    	  return list;
	    	}
	    
	    
	    
	  //get list applies
	    public List<Jobs> getApplies(int email) {
	    	 List<Jobs> applies = new ArrayList<Jobs>();
	    	  try {
	    	  	currentCon = ConnectionManager.getConnection();
	    	  	stmt = currentCon.createStatement();
	    	  
	    	  	  String query = "SELECT APP.JOBSID,APP.STUDID, J.JOBSCATEGORY, J.JOBSTYPE, J.JOBSTITLE,J.DESCRIPTION,J.JOBSLOCATION,J.EXPERIENCE,J.JOBSFUNCTION,J.MAXSALARY,J.MINSALARY,J.EMPID,J.STATUS,J.DATES,J.REQUIREMENT,J.STUDID FROM JOBS J RIGHT OUTER JOIN APPLIES APP ON J.JOBSID = APP.JOBSID WHERE J.EMPID='"+email+"'";   	  	  
	    	  	  ResultSet rs = stmt.executeQuery(query);
	    	      
	    	      while (rs.next()) {
	    	          Jobs jobs= new Jobs();
	    	          jobs.setJobsid(rs.getInt("JOBSID"));
	    	          jobs.setCategory(rs.getString("JOBSCATEGORY"));
	    	          jobs.setType(rs.getString("JOBSTYPE"));
	    	          jobs.setTitle(rs.getString("JOBSTITLE"));
	    	          jobs.setDescription(rs.getString("DESCRIPTION"));
	    	          jobs.setLocation(rs.getString("JOBSLOCATION"));
	    	          jobs.setExperience(rs.getString("EXPERIENCE"));
	    	          jobs.setFunction(rs.getString("JOBSFUNCTION"));
	    	          jobs.setEmpid(rs.getString("EMPID"));
	    	          jobs.setMaxsalary(rs.getString("MAXSALARY"));
	    	          jobs.setMinsalary(rs.getString("MINSALARY"));
	    	          jobs.setStatus(rs.getString("STATUS"));
	    	          jobs.setDate(rs.getString("DATES"));
	    	          jobs.setRequirement(rs.getString("REQUIREMENT"));
	    	          jobs.setStudid(rs.getInt("STUDID"));
	    	          
	    	          applies.add(jobs);
	    	          
	    	          System.out.print(jobs.getJobsid());
	    	          System.out.print(jobs.getId());   	          
	    	          
	    	      }
	    	  } catch (SQLException e) {
	    	      e.printStackTrace();
	    	  }
	    	  return applies;
	    	}
	    
}

