package com.jobs;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.Apply;
import com.domain.Employer;
import com.domain.Jobs;
import com.domain.JobsList;
import com.domain.Student;
import com.employer.EmployerDA;
import com.student.StudentDA;


/**
 * Servlet implementation class UserServlet
 */
public class ListHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String Redirect1 = "/Employer/job-list.jsp";
	private static String Redirect2 = "/Student/job-list.jsp";
	private static String Redirect3 = "/Student/applied-job.jsp";
	private static String Redirect4 = "/Employer/Emp-index.jsp";
	private static String Redirect5 = "/Employer/applied-job.jsp";	
	
    private JobsDA dao;      
    private StudentDA dao2;
    private EmployerDA dao3;
    private ApplyDA dao4;
    String forward="";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListHandler() {
        super();
        dao = new JobsDA();        
        dao2 = new StudentDA();
        dao3 = new EmployerDA();
        dao4 = new ApplyDA();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   
        String action = request.getParameter("action");

		if (action.equalsIgnoreCase("viewList")){
			String email= request.getParameter("email");
            int email1=0;
            try{
            	email1=Integer.parseInt(email);
            }
            catch (Exception e){}
            forward = Redirect1;
	        Jobs jobs = dao.getUserByEmail(email);
            request.setAttribute("jobs", jobs);            
            request.setAttribute("list", dao.getAllList(email1));     //Employer View 
        }
		else if (action.equalsIgnoreCase("viewLists")){
			String email= request.getParameter("email");
            int email1=0;
            try{
            	email1=Integer.parseInt(email);
            }
            catch (Exception e){}
            forward = Redirect2;
            Student stud = dao2.getUserByEmail(email);
            request.setAttribute("stud", stud);
            request.setAttribute("list", dao.getAllLists(email1));     //Student Access
            System.out.print("id:"+ stud.getId());
        }
		else if (action.equalsIgnoreCase("applyListss")){
			String email= request.getParameter("email");
            int email1=0;
            try{
            	email1=Integer.parseInt(email);
            	System.out.print(email1);
            }
            catch (Exception e){}
            forward = Redirect5;
                        
            Employer emp = dao3.getUserByEmail(email);
            request.setAttribute("emp", emp);
            Student stud = dao2.getUserByEmail(email);
            request.setAttribute("stud", stud);
            request.setAttribute("list", dao4.getAllapplysListss(email1));     //Employer Access
            
        }
		else if (action.equalsIgnoreCase("applyLists")){
			String email= request.getParameter("email");
            int email1=0;
            try{
            	email1=Integer.parseInt(email);
            	System.out.print(email1);
            }
            catch (Exception e){}
            forward = Redirect3;
                        
            Student stud = dao2.getUserByEmail(email);
            request.setAttribute("stud", stud);
            
            request.setAttribute("list", dao4.getAllapplyLists(email1));     //Student Access
        }				
		
	    else {
	           forward = Redirect2;
	    }

		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String id = request.getParameter("id");
		
		if (action.equalsIgnoreCase("updateApplies")){							
			
			try{
			Jobs job= new Jobs();
			
			
			String jobsid1 = request.getParameter("jobsid");			
			String studid1 = request.getParameter("idd");			
			
			System.out.println("Candidate Job:"+ jobsid1);
			System.out.println("Candidate id:"+ studid1);
			System.out.println("Status id:"+ job.getStatus());
			
			int status = 1;
			
			job.setStudid(Integer.parseInt(studid1));
			job.setJobsid(Integer.parseInt(jobsid1));
			job.setStatus(Integer.toString(status));
			
			
			
			
			dao4.updateApplies(job);
					
			forward = Redirect4;
			}
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if (action.equalsIgnoreCase("filter")){		//Filter By Employer
			String email = request.getParameter("id");
			String date = request.getParameter("date");
			String date1 = request.getParameter("date1");
			String type = request.getParameter("type");
            
			int email1=0;
            try{
            	email1=Integer.parseInt(email);
            }                       
            
            catch (Exception e){}
                       
            forward = Redirect1;
            
            System.out.println("Action:"+ action);
            System.out.println("email:"+ email);
            System.out.println("type:"+type);
            System.out.println("date:"+date);
            System.out.println("date1:"+date1);
            
            Jobs jobs = dao.getUserByEmail(email);
            request.setAttribute("jobs", jobs); 
            request.setAttribute("list",dao.filter(email, type, date, date1));
		}
		
		else if (action.equalsIgnoreCase("filters")){		//Filter By Student
			String email = request.getParameter("id");
			String date = request.getParameter("date");
			String date1 = request.getParameter("date1");
			String type = request.getParameter("type");
            
			int email1=0;
            try{
            	email1=Integer.parseInt(email);
            }                       
            
            catch (Exception e){}
                       
            forward = Redirect2;
            
            System.out.println("Action:"+ action);
            System.out.println("email:"+ email);
            System.out.println("type:"+type);
            System.out.println("date:"+date);
            System.out.println("date1:"+date1);
            
            Student stud = dao.getStudByEmail(email);
            request.setAttribute("stud", stud); 
            request.setAttribute("list",dao.filters(type, date, date1));
		}
		else if (id.equalsIgnoreCase("search1")){		//Search Jobs
			String search = request.getParameter("search");
			String location = request.getParameter("location");

            forward = Redirect2;
            
            request.setAttribute("list", dao.getAllSearch(search,location));     //Student Access
            System.out.print("search:" + search);
            System.out.print("Location:" + location);
			
		}
		else{}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

}
