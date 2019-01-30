	package com.employer;


import java.util.*;
import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;



import com.dataAccess.ConnectionManager;
import com.domain.Employer;

public class EmployerDA {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
    static String id, name, email ,password, phone,compname,industry,address,active;
    
    
    //Login Employer
    public static Employer login(Employer bean) throws NoSuchAlgorithmException {
    	
        email = bean.getEmail();
        password = bean.getPassword();

        String searchQuery = "select * from EMPLOYER where EMPEMAIL='" + email + "' AND EMPPASSWORD='" + password + "'";
        System.out.println("Your email is " + email);
        System.out.println("Your password is " + password);
        System.out.println("Query: " + searchQuery);

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user exists set the isValid variable to true
            if (more) {
            	String email = rs.getString("EMPEMAIL");
            	String id = rs.getString("EMPID");
            	bean.setId(rs.getString("EMPID"));
           		System.out.println("Welcome " + email);
           		System.out.println("id: " + id);
                bean.setEmail(email);
                bean.setValid(true);
           	}
           
            // if user does not exist set the isValid variable to false
            else if (!more) {
            	System.out.println("Sorry, you are not a registered user! Please sign up first");
            	bean.setValid(false);
            }
           
        }

        catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }

                currentCon = null;
            }
        }

        return bean;
    }
    
    //Register Employer
    public void add(Employer bean) throws NoSuchAlgorithmException{
    	
        name = bean.getName();
        phone = bean.getPhone();
        email = bean.getEmail();
        password = bean.getPassword();
        compname = bean.getCompname();
        industry = bean.getIndustry();
        address = bean.getAddress();
        
        int phone1=0;
        try{
        	phone1=Integer.parseInt(phone);
        }
        catch(Exception e){}

       
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("INSERT INTO EMPLOYER(EMPID,EMPNAME, EMPNUM,EMPEMAIL,EMPPASSWORD,COMPNAME,COMINDUSTRY,ADDRESS)values(EMPLOYER_EMPID_SEQ.NEXTVAL,?,?,?,?,?,?,?)");
    		ps.setString(1,name);
    		ps.setString(2,phone);
    		ps.setString(3,email);
    		ps.setString(4,password);
    		ps.setString(5,compname);
    		ps.setString(6,industry);
    		ps.setString(7,address);
    		ps.executeUpdate();	
    	
    		System.out.println("Your name is " + name);
    		System.out.println("Your password is " + password);
            
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
    			} catch (Exception e) {
    			}
    			currentCon = null;
    		}
    	}
    }
    
    //close account
    public void deleteUser(Employer bean) {
    		
    		active = bean.getActive();    		
    		
        	String searchQuery = "UPDATE EMPLOYER SET ACTIVE = '"+active+"' WHERE EMPID='"+email+"';";

        	try {

                currentCon = ConnectionManager.getConnection();
                stmt = currentCon.createStatement();
                stmt.executeUpdate(searchQuery);
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
    }

    //update account
    public void updateAccount(Employer bean) throws NoSuchAlgorithmException {

        name = bean.getName();
    	email = bean.getEmail();
        phone = bean.getPhone();
        password = bean.getPassword();
        compname = bean.getCompname();
        industry = bean.getIndustry();
        address = bean.getAddress();
        id=bean.getId();
    	
        String searchQuery = "UPDATE EMPLOYER SET EMPNAME='"+ name +"', EMPEMAIL='"+ email +"' ,EMPPASSWORD='"+ password +"' ,EMPNUM='"+ phone+"',COMPNAME='"+ compname +"',COMINDUSTRY='"+ industry +"',ADDRESS='"+ address +"' WHERE EMPID= '"+ id +"'";
    	
    	try {

            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //get employer by integer id
    public Employer getUserByEmail(String email) {
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
    
    //get employer by email
    public Employer getUserByEmails(String email) {
        Employer emp = new Employer();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("SELECT * FROM EMPLOYER WHERE EMPEMAIL=?");
            
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {                    
                
            	emp.setId(rs.getString("EMPID"));
            	emp.setEmail(rs.getString("EMPEMAIL"));
            	emp.setName(rs.getString("EMPNAME"));
            	emp.setPhone(rs.getString("EMPNUM"));
            	emp.setPassword(rs.getString("EMPPASSWORD"));
                
                System.out.println("id :"+emp.getId());
                System.out.println("Email :"+emp.getEmail());
                System.out.println("name :"+emp.getName());
                System.out.println("Phone :"+emp.getPhone());
                System.out.println("Password:"+emp.getPassword());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return emp;
    }
    
    //get employer by String id
    public Employer getUserByEmailss(String email) {
        Employer emp = new Employer();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("SELECT * FROM EMPLOYER WHERE EMPID=?");
            
            ps.setString(1,email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {                    
                
            	emp.setEmail(rs.getString("EMPEMAIL"));
            	emp.setName(rs.getString("EMPNAME"));
            	emp.setPhone(rs.getString("EMPNUM"));
            	emp.setPassword(rs.getString("EMPPASSWORD"));
            	emp.setId(rs.getString("EMPID"));
                
                
                System.out.println("id :"+emp.getId());
                System.out.println("name :"+emp.getName());
                System.out.println("Phone :"+emp.getPhone());
                System.out.println("Password:"+emp.getPassword());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return emp;
    }
    
    
}
