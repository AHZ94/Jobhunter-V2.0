package com.rating;


import java.util.*;
import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.domain.Employer;
import com.domain.Jobs;
import com.domain.Leaderboard;
import com.domain.Student;
import com.domain.Rating;
import com.dataAccess.ConnectionManager;;

public class RatingDA {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
    int rateid,empid,studid;
    double average;
	static String result,description;
    	
    
	//get student ratings
    public List<Rating> Rating(int studid) {
    	 List<Rating> list = new ArrayList<Rating>();
    	 
    	 
    	 try {
    		    		
     		currentCon = ConnectionManager.getConnection();
     		ps=currentCon.prepareStatement("SELECT AVERAGE FROM RATING WHERE STUDID='"+studid+"'");  	
     		ResultSet rs = ps.executeQuery();	
     	
     		System.out.println("Studid:" + studid);
     		System.out.println("Empid:" + studid);
    	      
    	      while (rs.next()) {
    	          Rating rate= new Rating();
    	          double x = Double.parseDouble(rs.getString("AVERAGE"));
    	          rate.setAverage(x);

    	          list.add(rate);
    	          	    	          
    	          System.out.print("Average:"+rate.getAverage());	    	          
    	          
    	      }
    	  } catch (SQLException e) {
    	      e.printStackTrace();
    	  }
    	  return list;
    	}
	
	//get rating by integer
    public int getRating(int empid,int studid){
    	
    	Rating rate = new Rating();   	      
    	int i=0;
    	
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("SELECT * FROM RATING WHERE STUDID='"+studid+"' AND EMPID='"+empid+"'");  	
    		ResultSet rs = ps.executeQuery();	
    	
    		System.out.println("Studid:" + studid);
    		System.out.println("Empid:" + studid);
            
    		if (rs.next() ) {                
    			i=1;
    		}
    		else{}
    	}
    		catch(Exception e)
    		{}
		return i;
    	}
    
  //get rating by jobsid
    public Leaderboard getRatings(int jobsid){
    	
    	Leaderboard lead = new Leaderboard();   	      
    	
    	
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("SELECT R.AVERAGE,J.JOBSID,J.STUDID,J.STATUS,S.STUDID FROM JOBS J RIGHT OUTER JOIN STUDENT S ON J.STUDID=S.STUDID RIGHT OUTER JOIN RATING R ON R.STUDID=J.STUDID WHERE J.STATUS='1' AND JOBSID='"+jobsid+"' AND ROWNUM = 1 ORDER BY RATEID DESC");   	
    		ResultSet rs = ps.executeQuery();	
    	
    		
            
    		if (rs.next() ) {                
    			lead.setAverage(rs.getDouble("AVERAGE"));
    			lead.setJobsid(rs.getInt("JOBSID"));
    			lead.setStudid(rs.getInt("STUDID"));
    			System.out.println("Studid:" + lead.getStudid());
        		System.out.println("Empid:" + lead.getJobsid());
    		}
    		else{}
    	}
    		catch(Exception e)
    		{}
		return lead;
    	}
    
    
    //get rating & max rateid from student
    public Rating viewRating(String studid){
    	
    	Rating rate = new Rating();   	      

    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("SELECT * FROM RATING WHERE RATEID = (SELECT MAX(RATEID) FROM RATING WHERE STUDID=?) AND rownum = 1");		//Student Access
    		ps.setInt(1, Integer.parseInt(studid));    	
    		ResultSet rs = ps.executeQuery();	
    	
    		System.out.println("Studid:" + studid);
            
    		if (rs.next()) {
                
    			rate.setRateid(rs.getInt("RATEID"));
    			rate.setResult(rs.getString("RESULTS"));
    			rate.setEmpid(rs.getInt("EMPID"));
    			rate.setStudid(rs.getInt("STUDID"));
    			rate.setAverage(rs.getDouble("AVERAGE"));
                
            	System.out.println("Rateid:"+rate.getRateid());
                System.out.println("Result:"+rate.getResult());
                System.out.println("Empid:"+rate.getEmpid());
                System.out.println("Studid:"+rate.getStudid());
                System.out.println("Average:"+rate.getAverage());
            }
    	}

    	catch (Exception ex) {
    		System.out.println("failed: An Exception has occurred! " + ex);
    	}
    	    	
		return rate;
    }
    
    
    
    
    public Rating avg(int studid)
    {
    	Rating rate = new Rating();
    	
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("SELECT AVG(RESULTS),RATEID,EMPID,STUDID FROM RATING WHERE STUDID='"+studid+"' group by RATEID, EMPID, STUDID");		
    		   	
    		ResultSet rs = ps.executeQuery();	
    	
    		System.out.println("Studid:" + studid);
            
    		if (rs.next()) {
                
    			rate.setRateid(rs.getInt("RATEID"));    			
    			rate.setEmpid(rs.getInt("EMPID"));
    			rate.setStudid(rs.getInt("STUDID"));
    			rate.setAverage(rs.getDouble("AVG(RESULTS)"));
                
            	System.out.println("Rateid:"+rate.getRateid());                
                System.out.println("Empid:"+rate.getEmpid());
                System.out.println("Studid:"+rate.getStudid());
                System.out.println("Average:"+rate.getAverage());
            }
    	}

    	catch (Exception ex) {
    		System.out.println("failed: An Exception has occurred! " + ex);
    	}
    	    	
		return rate;
    
    }
    
    //update average
    public void updateAverage(double value,int studid) throws NoSuchAlgorithmException {
    	    	    	        
    	
        String searchQuery = "UPDATE RATING SET AVERAGE = '"+value+"' WHERE  RATEID = ( select max(RATEID) from RATING WHERE STUDID='"+studid+"')";
    	
    	try {
    		Rating rate = new Rating();

            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            
            
            System.out.println("Studid:"+studid);
            System.out.println("average:"+value);
        } catch (SQLException e) {
            e.printStackTrace();
        }		
    }
    
  //Update rating
    public void updateRating(Rating bean) throws NoSuchAlgorithmException{
    	
    	rateid = bean.getRateid();
    	result = bean.getResult();
    	empid = bean.getEmpid();
    	studid = bean.getStudid();
    	description = bean.getDescription();

       
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("INSERT INTO RATING(RATEID,RESULTS,EMPID,STUDID,DESCRIPTION)values(RATING_RATEID_SEQ.NEXTVAL,?,?,?,?)");
    		ps.setString(1,result);
    		ps.setInt(2,empid);
    		ps.setInt(3,studid);
    		ps.setString(4,description);    	
    		ps.executeUpdate();	
    	
    		System.out.println("Studid:" + studid);
    		System.out.println("Result:" + result);
    		System.out.println("Empid:" + empid);
    		System.out.println(description);
    	}

    	catch (Exception ex) {
    		System.out.println("failed: An Exception has occurred! " + ex);
    	}
    	
    }
    
    
  //get employer by integer id
    public Employer getEmployerByEmail(String email) {
        Employer emp = new Employer();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("SELECT * FROM EMPLOYER WHERE EMPID=?");
            
            ps.setInt(1, Integer.parseInt(email));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {                    
                
            	emp.setEmail(rs.getString("EMPEMAIL"));
            	emp.setName(rs.getString("EMPNAME"));
            	emp.setPhone(rs.getString("EMPNUM"));
            	emp.setPassword(rs.getString("EMPPASSWORD"));
            	emp.setCompname(rs.getString("COMPNAME"));
            	emp.setIndustry(rs.getString("COMINDUSTRY"));
            	emp.setAddress(rs.getString("ADDRESS"));
            	emp.setId(rs.getString("EMPID"));
                
                
                System.out.println("id :"+emp.getId());
                System.out.println("name :"+emp.getName());
                System.out.println("Phone :"+emp.getPhone());
                System.out.println("Password:"+emp.getPassword());
                System.out.println("Company:"+emp.getCompname());
                System.out.println("Industry:"+emp.getIndustry());
                System.out.println("Address:"+emp.getAddress());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return emp;
    }
    
    //get student by integer id
    public Student getUserByEmail(String email) {
        Student stud = new Student();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("select * from STUDENT where STUDID=?");
            
            ps.setInt(1, Integer.parseInt(email));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                
            	stud.setEmail(rs.getString("STUDEMAIL"));
            	stud.setName(rs.getString("STUDNAME"));
            	stud.setPassword(rs.getString("STUDPASSWORD"));
            	stud.setPhone(rs.getString("STUDNUM"));
            	stud.setCertificate(rs.getString("CERTIFICATES"));
            	stud.setBackground(rs.getString("BACKGROUND"));            
            	stud.setAddress(rs.getString("ADDRESS"));
            	stud.setId(rs.getString("STUDID"));
                
            	System.out.println(stud.getId());
                System.out.println(stud.getName());
                System.out.println(stud.getPhone());
                System.out.println(stud.getCertificate());
                System.out.println(stud.getBackground());
                System.out.println(stud.getAddress());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return stud;
    }
    
    //get user by email
    public Student getUserByEmails(String email) {
        Student stud = new Student();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("SELECT * FROM STUDENT WHERE STUDEMAIL=?");
            
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                
            	stud.setId(rs.getString("STUDID"));
            	stud.setName(rs.getString("STUDNAME"));
            	stud.setPhone(rs.getString("STUDNUM"));
            	stud.setEmail(rs.getString("STUDEMAIL"));                              
            	stud.setCertificate(rs.getString("CERTIFICATES"));
            	stud.setBackground(rs.getString("BACKGROUND"));
            	stud.setPassword(rs.getString("STUDPASSWORD"));
                
                
                System.out.println("name:" + stud.getName());
                System.out.println("phone:"+ stud.getPhone());
                System.out.println("certificate:"+ stud.getCertificate());
                System.out.println("bakground:"+ stud.getBackground());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return stud;
    }
    
    //get user by string id	
    public Student getUserByEmailss(String email) {
        Student stud = new Student();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("SELECT * FROM STUDENT WHERE STUDID=?");
            
            ps.setString(1,email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {                    
                
            	stud.setId(rs.getString("STUDID"));
            	stud.setName(rs.getString("STUDNAME"));
            	stud.setPhone(rs.getString("STUDNUM"));
            	stud.setEmail(rs.getString("STUDEMAIL"));                              
            	stud.setCertificate(rs.getString("CERTIFICATES"));
            	stud.setBackground(rs.getString("BACKGROUND"));
            	stud.setPassword(rs.getString("STUDPASSWORD"));
                
                
                System.out.println("id :"+stud.getId());
                System.out.println("name :"+stud.getName());
                System.out.println("Phone :"+stud.getPhone());
                System.out.println("Password:"+stud.getPassword());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return stud;
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
   }

