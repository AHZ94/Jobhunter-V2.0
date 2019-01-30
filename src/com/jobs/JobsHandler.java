package com.jobs;


import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.domain.Apply;
import com.domain.Employer;
import com.domain.Jobs;
import com.domain.Leaderboard;
import com.domain.Rating;
import com.domain.Student;
//import com.rating.RatingDA;
import com.student.StudentDA;
import com.employer.EmployerDA;


/**
 * Servlet implementation class UserServlet
 */
public class JobsHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String Redirect1 = "/Employer/Emp-index.jsp";
	private static String Redirect2 = "/Student/job-list.jsp";
    private static String Redirect3 = "/Employer/details.jsp";
    private static String Redirect4 = "/Employer/post.jsp";
    private static String Redirect5 = "/Employer/Leaderboard.jsp";
    private static String Redirect6 = "/Student/applied-job.jsp";
    private static String Redirect7 = "/Student/details.jsp";
    private static String Redirect8 = "/Employer/applied-job.jsp";
    private static String Redirect9 = "/Student/Stud-index.jsp";
    private JobsDA dao;    
    private ApplyDA dao1;
    private EmployerDA dao2;
    private StudentDA dao3;
//    private RatingDA dao4;
    String forward="";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobsHandler() {
        super();
        dao = new JobsDA();
        dao1 = new ApplyDA();
        dao2 = new EmployerDA();
        dao3 = new StudentDA();
//        dao4 = new RatingDA();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   
        String action = request.getParameter("action");        
       	
        if (action.equalsIgnoreCase("createJobs")){						//Create job        	
	        forward = Redirect4;   
			String email= request.getParameter("email");
			Jobs jobs = dao.getUserByEmail(email);	        
			request.setAttribute("jobs", jobs);
			System.out.println("id2:"+jobs.getEmpid());		       
	    }
        else if (action.equalsIgnoreCase("details")){					//View Job
	    	forward = Redirect3;   
	    	String jobsidd= request.getParameter("jobsid");
	    	int id=0;
	    		try
	    		{id=Integer.parseInt(jobsidd);
					}
	    	catch (Exception e){}		
	    	Jobs jobs = new Jobs();
	    	jobs= dao.getJobsById(id);   					        
	    	request.setAttribute("jobs",jobs);
	    	Leaderboard lead = new Leaderboard();
	    	
//	    	lead= dao4.getRatings(id);
	    	
	    	request.setAttribute("lead",lead);
	    	request.setAttribute("jobs",jobs);
	    	System.out.print("jobsid:"+ jobs.getJobsid());
	    	System.out.print("studid:"+ jobs.getStudid());
	    	
	    	Student stud = new Student();
	    	String id2 = String.valueOf(jobs.getStudid()); 
	    	stud= dao3.getUserByEmail(id2);  
	    	request.setAttribute("stud",stud);
	    	System.out.print("studid:"+ id2);
	    	
		}
        else if(action.equalsIgnoreCase("deleteJobs")){		//Remove Job
        	
        }
        else if (action.equalsIgnoreCase("apply")){			//Apply job & Student
			  
			String email= request.getParameter("email");
			String jobsid= request.getParameter("jobsid");					
			
			int email1=0;
            try{
            	email1=Integer.parseInt(email);
            }
            catch (Exception e){}
            
            Student stud = new Student();
			stud = dao.getStudByEmail(email);		
			Jobs jobs = new Jobs();
			jobs = dao.getJobsByJobsid(jobsid);							
			request.setAttribute("apply", dao1.add(jobsid,email));
			request.setAttribute("stud", stud);
			request.setAttribute("list", dao.getAllList(email1));
			
			forward = Redirect9; 
	           
	    }       
        else if (action.equalsIgnoreCase("Applydetails")){		//View & Update applicant  
        	
        	
        	String email = request.getParameter("email");
	    	String jobsidd= request.getParameter("jobsid");
	    	int id=0;
	    	int email1=0;
	    		try
	    		{
	    			id=Integer.parseInt(jobsidd);
	    			email1=Integer.parseInt(email);
					}
	    	catch (Exception e){}
	    		
	    	Jobs jobs = new Jobs();
	    	
	    	jobs= dao.getJobsById(id);   					        
	    	request.setAttribute("jobs",jobs);	    	
	    	request.setAttribute("list", dao1.getAllApplicants(id));
	    	Student stud = new Student();
			stud = dao3.getUserByEmail(email);
	    	request.setAttribute("stud", stud);
	    	
	    	
	    	
	    	System.out.print("jobsid:"+ id);
	    	System.out.print("email:"+ email1);
	    	System.out.print("email:"+ email1);
	    	System.out.print("Handler");
	    	
	    	forward = Redirect5;
	    	
		}
        else if (action.equalsIgnoreCase("detailss")){		//View Job & Student
  		   forward = Redirect7;   
  		   String jobsidd= request.getParameter("jobsid");
  		   int id=0;
  		   try
  				{id=Integer.parseInt(jobsidd);
  				}
  		   catch (Exception e){}		
  		   Jobs jobs = new Jobs();
  		   jobs= dao.getJobsById(id);   									        
  		   request.setAttribute("jobs",jobs);
  		   System.out.print("jobsid:"+ jobs.getJobsid());					        	        
  		           
  		}               
        
		else {
			forward = Redirect1;
		    }               

		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		String id = request.getParameter("post");        
		int studid=1; 
		
		System.out.println("Action:" + id);
		if(id.equalsIgnoreCase("1"))
		{
			Jobs jobs = new Jobs();
	    	jobs.setCategory(request.getParameter("category"));
	    	jobs.setType(request.getParameter("type"));
	    	jobs.setTitle(request.getParameter("title"));
	    	jobs.setDescription(request.getParameter("description"));
	    	jobs.setLocation(request.getParameter("location"));
	    	jobs.setExperience(request.getParameter("experience"));    	
	    	jobs.setFunction(request.getParameter("function"));
	    	jobs.setEmpid(request.getParameter("empid"));
	    	jobs.setMaxsalary(request.getParameter("maxsalary"));
	    	jobs.setMinsalary(request.getParameter("minsalary"));
	    	jobs.setDate(request.getParameter("date"));
	    	jobs.setStatus(request.getParameter("status"));
	    	jobs.setRequirement(request.getParameter("requirement"));
	    	jobs.setStudid(studid);
			System.out.println("id3:" + jobs.getEmpid());
			System.out.println("id4:" + jobs.getStudid());
	                    	               
	        
	            try {            	        
					dao.add(jobs);	//employer post job
					forward = Redirect1;
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        
	        RequestDispatcher view = request.getRequestDispatcher(forward);	        
	        view.forward(request, response);
		}
		else if(id.equalsIgnoreCase("2"))
		{			
			Jobs jobs = new Jobs();
			int id2 = Integer.parseInt(request.getParameter("jobsid"));
	
			jobs.setJobsid(id2);
			jobs.setCategory(request.getParameter("category"));
	    	jobs.setType(request.getParameter("type"));
	    	jobs.setTitle(request.getParameter("title"));
	    	jobs.setDescription(request.getParameter("description"));
	    	jobs.setLocation(request.getParameter("location"));
	    	jobs.setExperience(request.getParameter("experience"));    	
	    	jobs.setFunction(request.getParameter("function"));
	    	jobs.setEmpid(request.getParameter("empid"));
	    	jobs.setMaxsalary(request.getParameter("maxsalary"));
	    	jobs.setMinsalary(request.getParameter("minsalary"));
	    	jobs.setDate(request.getParameter("date"));
	    	jobs.setStatus(request.getParameter("status"));
	    	jobs.setRequirement(request.getParameter("requirement"));
	    	jobs.setStudid(studid);				    	
	    	
	        try {
				dao.updateJob(jobs);
				forward = Redirect3;
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	        request.setAttribute("job", dao.getUserByEmail(jobs.getEmpid()));
	        int x = jobs.getJobsid();
	        
	    	jobs= dao.getJobsById(x);   					        
	    	request.setAttribute("jobs",jobs);
	    	System.out.print("jobsid:"+ jobs.getJobsid());
	    	System.out.print("studid:"+ jobs.getStudid());
	    	
	    	Student stud = new Student();
	    	String studid1 = String.valueOf(jobs.getStudid()); 
	    	stud= dao3.getUserByEmail(studid1);  
	    	request.setAttribute("stud",stud);
	    	System.out.print("studid:"+ studid1);
	    	
	        RequestDispatcher view = request.getRequestDispatcher(forward);	        
	        view.forward(request, response);
	        
	        
		}
	}

}
