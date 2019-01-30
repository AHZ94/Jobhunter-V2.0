package com.rating;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.domain.Employer;
import com.domain.Jobs;
import com.domain.Rating;
import com.domain.Student;
import com.employer.EmployerDA;

/**
 * Servlet implementation class UserServlet
 */
public class RatingHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String Redirect1 = "/Student/Stud-index.jsp";
	private static String Redirect2 = "/Student/Rating.jsp";
    private static String Redirect3 = "/Employer/Rating.jsp";
    private static String Redirect4 = "/Employer/Emp-index.jsp";
    private RatingDA dao;
    private EmployerDA dao1;
    String forward="";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RatingHandler() {
        super();
        dao = new RatingDA();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   
        String action = request.getParameter("action");

		if (action.equalsIgnoreCase("viewRating")){
			forward = Redirect2;
            String email = request.getParameter("email");
            Student stud = dao.getUserByEmail(email);
            request.setAttribute("stud", stud);
        }
		else if (action.equalsIgnoreCase("updateRating")){		//Employer Access
			forward = Redirect3;   
			String studid= request.getParameter("x");			
			String empid= request.getParameter("email");
			
			System.out.println("Rating Handler");
			System.out.println("Studid:" + studid);			
			System.out.println("empid:" + empid);
			
			Employer emp= dao.getEmployerByEmail(empid);
			Student stud = dao.getUserByEmail(studid);
	        //Employer emp = dao1.getUserByEmail(empid);	        
	        
	        request.setAttribute("stud", stud);
	        request.setAttribute("emp", emp);	        
	           
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
		
		String empid = request.getParameter("empid");
		String studid = request.getParameter("studid");
		String rating = request.getParameter("rating");
		String description = request.getParameter("description");
		
		Rating rate = new Rating();
		
		rate.setResult(rating);
		rate.setEmpid(Integer.parseInt(empid));
		rate.setStudid(Integer.parseInt(studid));
		rate.setDescription(description);
		
		int studid1 = rate.getStudid();
		
		System.out.println("Insert rating");
		System.out.println("Empid:"+ empid);
		System.out.println("Studid:"+studid);
		System.out.println("Studid:"+rate.getStudid());
		System.out.println("Rating:"+rating);
		System.out.println(description);		
		
		try {            	        
			
			int i=0;
			int x = rate.getEmpid();
			int y = rate.getStudid();
			
			dao.getRating(x,y);			
			
			if(i==0){
				
				dao.updateRating(rate);									//insert new rating    
						
						
				Rating rate1 = dao.avg(y);
				request.setAttribute("rate1", rate1);
				
				double value = rate1.getAverage();
				System.out.println("avg1:"+value);
				
				dao.updateAverage(value,y);
				
				
				request.setAttribute("rate", rate);
				System.out.println("Average3:"+rate.getAverage());		//update average
				
				
				
				
				Employer emp= dao.getEmployerByEmail(empid);
				Student stud = dao.getUserByEmail(studid);	        	        
		        				
		        request.setAttribute("stud", stud);
		        request.setAttribute("emp", emp);
				
				forward = Redirect4;
			}
			else
			{
				System.out.println("You have rate this user already");
			}
						
		} catch(Exception e) {		//NoSuchAlgorithmException e,e.printStackTrace();
			// TODO Auto-generated catch block
			
		}
    
	    RequestDispatcher view = request.getRequestDispatcher(forward);	        
	    view.forward(request, response);
	}
}
