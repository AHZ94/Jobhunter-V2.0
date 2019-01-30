package com.employer;


import javax.servlet.*;
import javax.servlet.http.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.Employer;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginEmployer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployerDA dao;
	private static String Redirect1 = "/Jobhunter_V2.0/Employer/Emp-index.jsp";
	 String forward="";
	
	
	  public LoginEmployer() {
	        super();
	        dao = new EmployerDA();
	        // TODO Auto-generated constructor stub
	    }

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			
			Employer emp = new Employer();
			emp.setEmail(request.getParameter("email"));
			emp.setPassword(request.getParameter("password"));

			emp = EmployerDA.login(emp);

			if(emp.isValid())
			{
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", emp.getId());
				
				//Redirect page
				String email = request.getParameter("email");
				Employer employer = dao.getUserByEmails(email);
			    request.setAttribute("employer", employer);
			    System.out.println("Handler: Login");
			    
				response.sendRedirect("/Jobhunter_V2.0/Employer/Emp-index.jsp"); // logged-in page
				
			}
			else
			{
				forward = Redirect1;
			}
			
		}

		catch (Throwable ex) {
			System.out.println(ex);
		}
	}
}