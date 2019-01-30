package com.student;


import java.util.*;
import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.domain.Student;
import com.domain.Rating;
import com.dataAccess.ConnectionManager;;

public class StudentDA {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
    static String id, name, phone, email ,certificate, background , password,address,rateid,result,empid;
    
    
    //login
    public static Student login(Student bean) throws NoSuchAlgorithmException {
    	
    	name = bean.getName();
        email = bean.getEmail();
        phone = bean.getPhone();
        certificate = bean.getCertificate();
        background = bean.getBackground();
        password = bean.getPassword();
        

        String searchQuery = "select * from STUDENT where STUDEMAIL='" + email + "' AND STUDPASSWORD='" + password + "'";
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
            	String email = rs.getString("STUDEMAIL");
            	String certificate = rs.getString("CERTIFICATES");
            	String background = rs.getString("BACKGROUND");
            	bean.setId(rs.getString("STUDID"));
           		System.out.println("Welcome " + email);
                System.out.println("Your certificate is " + certificate);
                System.out.println("Your background is " + background);
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
    
    //register
    public void add(Student bean) throws NoSuchAlgorithmException{
    	
        name = bean.getName();
        phone = bean.getPhone();
        email = bean.getEmail();	
        certificate = bean.getCertificate();
        background = bean.getBackground();
        password = bean.getPassword();
        address = bean.getAddress();
        
        int phone1=0;
        try{
        	phone1=Integer.parseInt(phone);
        }
        catch(Exception e){}

       
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("INSERT INTO STUDENT(STUDID,STUDNAME, STUDNUM,STUDEMAIL,CERTIFICATES,BACKGROUND,STUDPASSWORD,ADDRESS)values(STUDENT_STUDID_SEQ.NEXTVAL,?,?,?,?,?,?,?)");
    		ps.setString(1,name);
    		ps.setInt(2,phone1);
    		ps.setString(3,email);
    		ps.setString(4,certificate);
    		ps.setString(5,background);
    		ps.setString(6,password);
    		ps.setString(7,address);
    		ps.executeUpdate();	
    	
    		System.out.println("Your name is " + name);
    		System.out.println("Your password is " + password);
    		System.out.println("Your address is " + address);
            
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
    public void deleteUser(String email) {
        try {
        	currentCon = ConnectionManager.getConnection();
        	ps=currentCon.prepareStatement("delete from STUDENT where STUDID=?");
            ps.setString(1, email);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //update account
    public void updateAccount(Student bean) throws NoSuchAlgorithmException {

    	id=bean.getId();
    	name = bean.getName();
    	phone = bean.getPhone();	
    	email = bean.getEmail();
    	certificate = bean.getCertificate();
        background= bean.getBackground();        
        password = bean.getPassword();
        address = bean.getAddress();               
    	
        String searchQuery = "UPDATE STUDENT SET STUDNAME= '" + name + "', STUDNUM='" + phone + "', STUDEMAIL='"
        					+ email + "', CERTIFICATES='" + certificate + "', BACKGROUND='"
        					+ background + "', STUDPASSWORD='" + password +"', ADDRESS='" + address +"' WHERE STUDID= '" + id + "'";
    	
    	try {

            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
            	stud.setAddress(rs.getString("ADDRESS"));
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
            	stud.setAddress(rs.getString("ADDRESS"));
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
        
   }

