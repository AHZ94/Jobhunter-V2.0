package com.jobs;


import java.util.*;
import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.dataAccess.ConnectionManager;
import com.domain.Jobs;
import com.domain.Employer;
import com.domain.JobsList;
import com.domain.Student;

public class JobsDA {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
    static String jobsid, category, type, title, location, function, experience, description, maxsalary, minsalary, requirement, date, status, empid;
	int studid;    
    
    
    //post new jobs 
    public void add(Jobs bean) throws NoSuchAlgorithmException{
    	
    	category = bean.getCategory();
    	type = bean.getType();
    	title = bean.getTitle();
    	location = bean.getLocation();
    	function = bean.getFunction();
    	experience = bean.getExperience();
    	description = bean.getDescription();
    	maxsalary = bean.getMaxsalary();
    	minsalary = bean.getMinsalary();
    	requirement = bean.getRequirement();
    	date = bean.getDate();    
    	status = bean.getStatus();
    	empid = bean.getEmpid();
    	studid = bean.getStudid();
    	    
        
    	try {
    		currentCon = ConnectionManager.getConnection();
    		
    		ps=currentCon.prepareStatement("INSERT INTO JOBS(JOBSID,JOBSCATEGORY,JOBSTYPE,JOBSTITLE,DESCRIPTION,JOBSLOCATION,EXPERIENCE,JOBSFUNCTION,EMPID,MAXSALARY,MINSALARY,STATUS,DATES,REQUIREMENT,STUDID) values(JOBS_JOBSID_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,DEFAULT)");
    		ps.setString(1,category);
    		ps.setString(2,type);
    		ps.setString(3,title);
    		ps.setString(4,description);
    		ps.setString(5,location);
    		ps.setString(6,experience);
    		ps.setString(7,function);
    		ps.setString(8,empid);    		
    		ps.setString(9,maxsalary);
    		ps.setString(10,minsalary);
    		ps.setString(11,status);
    		ps.setString(12,date);
    		ps.setString(13,requirement);    		
    		ps.executeUpdate();	    	    		            
    	}

    	catch (Exception ex) {
    		System.out.println("failed: An Exception has occurred! " + ex);
    	}

    	finally {
    		if (ps != null) {
    			try {
    				ps.close();
    			} catch (Exception e) {
    			}
    			ps = null;
    		}
    		
    		if (currentCon != null) {
    			try {
    				currentCon.close();
    			}  catch (Exception e) {
    			}
    			currentCon = null;
    		}
    	}
    }
    


    //update job
    public void updateJob(Jobs bean) throws NoSuchAlgorithmException {

    	category = bean.getCategory();
    	type = bean.getType();
    	title = bean.getTitle();
    	location = bean.getLocation();
    	function = bean.getFunction();
    	experience = bean.getExperience();
    	description = bean.getDescription();
    	maxsalary = bean.getMaxsalary();
    	minsalary = bean.getMinsalary();
    	requirement = bean.getRequirement();
    	date = bean.getDate();    
    	status = bean.getStatus();
    	empid = bean.getEmpid();
    	studid = bean.getStudid();
    	int jobsid = bean.getJobsid();
    	
        String searchQuery = "UPDATE JOBS SET JOBSCATEGORY='" + category + "',JOBSTYPE= '"+ type +"', JOBSTITLE='" + title + "',DESCRIPTION='" + description + 
								"', JOBSLOCATION='" + location + "',EXPERIENCE ='" + experience + "', JOBSFUNCTION='" + function +"' ,MAXSALARY='" + maxsalary + 
								"', MINSALARY='" + minsalary + "', REQUIREMENT ='" + requirement + "', DATES ='" + date + "' ,STATUS ='" + status + "', EMPID ='" + empid +
								"' WHERE JOBSID= '" + jobsid+"'";
    	
    	try {

            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
  	//Filter By Employer
    public List<Jobs> filter(String empid, String type, String date, String date1) {
    	List<Jobs> list = new ArrayList<Jobs>();
        
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("SELECT * FROM JOBS WHERE DATES BETWEEN '"+date+"' AND '"+date1+"' AND EMPID='"+empid+"'AND JOBSTYPE= '" + type + "'");			

            ResultSet rs = ps.executeQuery();
            
            
            while (rs.next()) {                  
            	JobsList jobs= new JobsList();
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    //Filter By Student
    public List<Jobs> filters(String type, String date, String date1) {
    	List<Jobs> list = new ArrayList<Jobs>();
        
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("SELECT * FROM JOBS WHERE DATES BETWEEN '"+date+"' AND '"+date1+"' AND JOBSTYPE= '" + type + "'");			

            ResultSet rs = ps.executeQuery();
                        
            
            while (rs.next()) {                  
            	JobsList jobs= new JobsList();
            	
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public List<JobsList> getAllList(int email) {							//Employer View
   	 List<JobsList> list = new ArrayList<JobsList>();
   	  try {
   	  	currentCon = ConnectionManager.getConnection();
   	  	stmt = currentCon.createStatement();
   	  
   	  	  String query = "select * from JOBS where EMPID= '" + email + "' order by JOBSID";
   	      ResultSet rs = stmt.executeQuery(query);
   	      
   	      while (rs.next()) {
   	          JobsList jobs= new JobsList();
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
   	          
   	          System.out.print(jobs.getJobsid());
   	          System.out.print(jobs.getCategory());
   	          System.out.print(jobs.getType());
   	          System.out.print(jobs.getTitle());
   	          System.out.print(jobs.getLocation());
   	          System.out.print(jobs.getId());
   	          
   	      }
   	  } catch (SQLException e) {
   	      e.printStackTrace();
   	  }

   	  return list;
   }
 
    //get student joblists
    public List<JobsList> getAllLists(int email) {
    	 List<JobsList> list = new ArrayList<JobsList>();
    	  try {
    	  	currentCon = ConnectionManager.getConnection();
    	  	stmt = currentCon.createStatement();
    	  
    	  	  String query = "select JOBSID,JOBSCATEGORY,JOBSTYPE,JOBSTITLE,JOBSLOCATION,EMPID,MAXSALARY,MINSALARY from JOBS";
    	      ResultSet rs = stmt.executeQuery(query);
    	      
    	      while (rs.next()) {
    	          JobsList jobs= new JobsList();
    	          jobs.setJobsid(rs.getInt("JOBSID"));
    	          jobs.setCategory(rs.getString("JOBSCATEGORY"));
    	          jobs.setType(rs.getString("JOBSTYPE"));
    	          jobs.setTitle(rs.getString("JOBSTITLE"));
    	          jobs.setLocation(rs.getString("JOBSLOCATION"));
    	          jobs.setEmpid(rs.getString("EMPID"));
    	          jobs.setMaxsalary(rs.getString("MAXSALARY"));
    	          jobs.setMinsalary(rs.getString("MINSALARY"));	          	          
    	          list.add(jobs);
    	          
    	          System.out.print(jobs.getJobsid());
    	          System.out.print(jobs.getCategory());
    	          System.out.print(jobs.getType());
    	          System.out.print(jobs.getTitle());
    	          System.out.print(jobs.getLocation());
    	          System.out.print(jobs.getId());
    	          
    	      }
    	  } catch (SQLException e) {
    	      e.printStackTrace();
    	  }
    	  return list;
    	}
  
    
    	//get employer by integer id
        public Jobs getUserByEmail(String email) {
            Jobs job = new Jobs();
            try {
            	currentCon = ConnectionManager.getConnection();
                ps=currentCon.prepareStatement("SELECT * FROM EMPLOYER WHERE EMPID=?");			//Complete
                
                ps.setInt(1, Integer.parseInt(email));

                ResultSet rs = ps.executeQuery();
                

                if (rs.next()) {                    
                                        
                    job.setEmpid(rs.getString("EMPID"));
                                        
                    System.out.println("id :"+job.getEmpid());                    
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return job;
        }
        
      //get student by integer id
        public Student getStudByEmail(String email) {
            Student stud = new Student();
            try {
            	currentCon = ConnectionManager.getConnection();
                ps=currentCon.prepareStatement("SELECT * FROM STUDENT WHERE STUDID=?");
                
                ps.setInt(1, Integer.parseInt(email));

                ResultSet rs = ps.executeQuery();
                

                if (rs.next()) {                    
                                        
                    stud.setId(rs.getString("STUDID"));
                                        
                    System.out.println("id :"+stud.getId());                    
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return stud;
        }
        
        //get jobs by integer id        
        public Jobs getJobsById(int id) {
            Jobs jobs= new Jobs();
            try {
            	currentCon = ConnectionManager.getConnection();
                ps=currentCon.prepareStatement("SELECT * FROM JOBS WHERE JOBSID=?");
                
                ps.setInt(1, id);
                
                ResultSet rs = ps.executeQuery();                

                if (rs.next()) {                    
                                        
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
                    
                    System.out.print("DA jobsid:"+ jobs.getJobsid());
                    System.out.print("DA empid:"+ jobs.getEmpid());
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return jobs;
        }
        
        //get jobs by string id
        public Jobs getJobsByJobsid(String id) {
            Jobs jobs= new Jobs();
            try {
            	currentCon = ConnectionManager.getConnection();
                ps=currentCon.prepareStatement("SELECT * FROM JOBS WHERE JOBSID=?");
                
                ps.setInt(1, Integer.parseInt(id));
                
                ResultSet rs = ps.executeQuery();                

                if (rs.next()) {                    
                                        
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
                    
                    System.out.print("DA jobsid:"+ jobs.getJobsid());
                    System.out.print("DA empid:"+ jobs.getEmpid());
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return jobs;
        }
        
      //get student joblists
        public List<JobsList> getAllSearch(String search, String location) {
        	 List<JobsList> list = new ArrayList<JobsList>();
        	  try {
        	  	currentCon = ConnectionManager.getConnection();
        	  	stmt = currentCon.createStatement();
        	  
        	  	  String query = "select JOBSID,JOBSCATEGORY,JOBSTYPE,JOBSTITLE,JOBSLOCATION,EMPID,MAXSALARY,MINSALARY from JOBS WHERE JOBSTITLE = '"+ search +"' AND JOBSLOCATION ='"+location+"'" ;
        	      ResultSet rs = stmt.executeQuery(query);
        	      
        	      while (rs.next()) {
        	          JobsList jobs= new JobsList();
        	          jobs.setJobsid(rs.getInt("JOBSID"));
        	          jobs.setCategory(rs.getString("JOBSCATEGORY"));
        	          jobs.setType(rs.getString("JOBSTYPE"));
        	          jobs.setTitle(rs.getString("JOBSTITLE"));
        	          jobs.setLocation(rs.getString("JOBSLOCATION"));
        	          jobs.setEmpid(rs.getString("EMPID"));
        	          jobs.setMaxsalary(rs.getString("MAXSALARY"));
        	          jobs.setMinsalary(rs.getString("MINSALARY"));	          	          
        	          list.add(jobs);
        	          
        	          System.out.print(jobs.getJobsid());
        	          System.out.print(jobs.getCategory());
        	          System.out.print(jobs.getType());
        	          System.out.print(jobs.getTitle());
        	          System.out.print(jobs.getLocation());
        	          System.out.print(jobs.getId());
        	          
        	      }
        	  } catch (SQLException e) {
        	      e.printStackTrace();
        	  }
        	  return list;
        	}
}
