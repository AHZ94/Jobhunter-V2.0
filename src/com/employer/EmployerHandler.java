package com.employer;


import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.domain.Employer;
import com.domain.Student;

/**
 * Servlet implementation class UserServlet
 */
public class EmployerHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String Redirect1 = "/Employer/Emp-index.jsp";	
	private static String Redirect2 = "/Employer/profile-details.jsp";
    private static String Redirect3 = "/Employer/profile.jsp";
    private static String Redirect4 = "/Employer/delete-account.jsp";    
    private EmployerDA dao;
    String forward="";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployerHandler() {
        super();
        dao = new EmployerDA();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("updateAccount")){
			forward = Redirect2;
            String email = request.getParameter("email");
            Employer emp = dao.getUserByEmail(email);
            request.setAttribute("emp", emp);
        }
		else if (action.equalsIgnoreCase("viewAccount")){		//View Profile
			forward = Redirect3;   
			String email= request.getParameter("email");
	        Employer emp = dao.getUserByEmail(email);
	        request.setAttribute("emp", emp);
	        System.out.println("Handler: View Profile");	           
	    }
		else if (action.equalsIgnoreCase("deleteAccount")){
			forward = Redirect4; 
			String email= request.getParameter("email");
	        Employer emp = dao.getUserByEmail(email);
	        request.setAttribute("emp", emp);	      
	    }
		else if (action.equalsIgnoreCase("Delete")){
			 
			String email= request.getParameter("email");
	        Employer emp = dao.getUserByEmail(email);
	        request.setAttribute("emp", emp);
	        try {
	        	forward = "index.jsp";
	        	System.out.println(email);
	        	dao.deleteUser(emp);				 
			} 
	        catch (Exception e) {
								
			}	        	        
	        request.setAttribute("emp", emp);	        	        	       
	    }
		else if (action.equalsIgnoreCase("logout")){
			forward = "index.jsp"; 
			HttpSession session=request.getSession(); 
			session.invalidate();
	           
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
				
		String email= request.getParameter("email");
		System.out.println("empid:" + email);
				
		Employer emp= new Employer();
		
		int email1=0;
		try{
			email1= Integer.parseInt(email);
			System.out.println("empid:"+email1);
		}
		catch (Exception e){}
		
		emp= dao.getUserByEmails(email);
		System.out.println("empid:"+email);
		
		emp.setId(request.getParameter("id"));
		emp.setName(request.getParameter("name"));
		emp.setEmail(request.getParameter("email"));
		emp.setPhone(request.getParameter("phone"));		
		emp.setPassword(request.getParameter("password"));
		emp.setCompname(request.getParameter("compname"));
		emp.setIndustry(request.getParameter("industry"));
		emp.setAddress(request.getParameter("address"));

		request.setAttribute("emp", emp);
		System.out.println("empid:" + emp.getId());
		
		
        try {
			dao.updateAccount(emp);
			forward=Redirect3;  //employer profile
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("emp", emp);    
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

}
