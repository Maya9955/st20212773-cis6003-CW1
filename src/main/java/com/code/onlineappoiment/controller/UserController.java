package com.code.onlineappoiment.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.onlineappoiment.model.User;
import com.code.onlineappoiment.service.UserService;
import com.mysql.cj.Session;


public class UserController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public String currentUserType = "";
	
	String message = "";
	User loggedUser = null;
	
	private UserService getUserService() {
		return UserService.getUserService();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String useractionType= request.getParameter("useractiontype");
		
		if(useractionType.equals("single")) {
			fetchSingleUser(request, response);
		}
		else if  (useractionType.equals("login")) {
			checkUserLogin(request, response);
		}
//		else {
//			fetchLoggedInUserDetails(request, response);
//		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String useractionType = request.getParameter("useractiontype");
		
		if(useractionType.equals("add")) {
			addUser(request, response);
		}
		else if(useractionType.equals("edit")){
			editUser(request, response);
		}
		else if(useractionType.equals("delete")) {
			deleteUser(request, response);
		}
	}
	
	private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		User user = new User();
		user.setfullname(request.getParameter("fullname"));
		user.setemail(request.getParameter("email"));
		user.setpassword(request.getParameter("password"));
		user.setusertype(request.getParameter("usertype"));
				
		
//		try {
//			if(getUserService().addUser(user))
//			{
//				message = "The user has been successfully added!";
//			}
//			else {
//				message = "Failed to add the user!";
//			}
//		} 
//		catch (ClassNotFoundException | SQLException e) {
//			message = "operation failed! " + e.getMessage();
//		}
//		
//		request.setAttribute("feedbackMessage", message);
//		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
//		rd.forward(request, response);
		
		 boolean registrationSuccessful = true; 
		    
		    if (registrationSuccessful) {
		        response.getWriter().write("success");
		    } else {
		        response.getWriter().write("failure");
		    }
	}
	
	private void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		User user = new User();
		user.setiduser(Integer.parseInt(request.getParameter("iduser")));
		user.setfullname(request.getParameter("fullname"));
		user.setemail(request.getParameter("email"));
		user.setpassword(request.getParameter("password"));
		user.setusertype(request.getParameter("usertype"));
		
		try {
			if(getUserService().editUser(user)) {
				message = "The appoiment has been successfully updated! Appoiment ID: " + user.getiduser();
			}
			else {
				message = "Failed to update the appoiment! Appoiment ID: " + user.getiduser();
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}
		
		request.setAttribute("feebackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("myprofile.jsp");
		rd.forward(request, response);
		
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		int iduser = Integer.parseInt(request.getParameter("iduser"));
		
		try {
			if(getUserService().deleteUser(iduser)) {
				message = "The product has been successfully deleted. Product Code: " + iduser;
			}
			else {
				message = "Failed to delet the product! Product Code: " + iduser;
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message =e.getMessage();
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("message", message);
		
		response.sendRedirect("getuser?actiontype=all");
	}
	
	private void fetchSingleUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		int iduser = Integer.parseInt(request.getParameter("iduser"));
		
		try {
			User user = getUserService().fetchSingleUser(iduser);
			if(user.getiduser() > 0) {
				request.setAttribute("user", user);
			}
			else {
				message = "No record found!";
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}
		request.setAttribute("feebackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("myprofile.jsp");
		rd.forward(request, response);
	}
	
	private void fetchAllUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		List<User> userList = new ArrayList<User>();
		try {
			userList = getUserService().fetchAllUser();
			
			if(!(userList.size() > 0)) {
				message = "No record found!";
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}
		
		request.setAttribute("userList", userList);
		request.setAttribute("feebackMessage", message);
		
		RequestDispatcher rd = request.getRequestDispatcher("view-all-and-delete-specific.jsp");
		rd.forward(request, response);
		
	}
	
	private void clearMessage() {
		message = "";
	}
	
	 protected void checkUserLogin(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String useractiontype = request.getParameter("useractionType");

//	        if (useractiontype.equals("login")) {
	            String fullname = request.getParameter("fullname");
	            String password = request.getParameter("password");
	            String userType = request.getParameter("userType");
	            System.out.println(fullname);
	            System.out.println(password);
	            System.out.println(userType);
	            
	         // Assuming you have the user type value from somewhere.
	            String usertype = "admin"; // Replace this with the actual user type

	            // Store the userType in the session
	            request.getSession().setAttribute("usertype", userType);
	            
	            try {
	                User user = getUserService().checkUserLogin(fullname, password, userType);
	                if (user.getiduser() > 0) {
	                    if ("admin".equals(userType)) {
	                        // Redirect admin to home.jsp
	                        response.sendRedirect("view-appoiment.jsp");
	                    } else if ("jobSeeker".equals(userType)) {
	                        // Redirect job seeker to register.jsp
	                        response.sendRedirect("register.jsp");
	                    } else if ("counselor".equals(userType)){
	                    	response.sendRedirect("approveappoiment.jsp");
	                    }
	                } else {
//	                    String message = "Login failed. Please try again.";
//	                    request.setAttribute("feebackMessage", message);
	                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	                    rd.forward(request, response);
	                }
	            } catch (ClassNotFoundException | SQLException e) {
	                String message = e.getMessage();
	                request.setAttribute("feebackMessage", message);
	                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	                rd.forward(request, response);
	            }
	 }
	 public void viewProfileDetails(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException, ClassNotFoundException, SQLException {
		  String useractiontype = request.getParameter("useractionType");

	        if (useractiontype.equals("login")) {
	            String fullname = request.getParameter("fullname");
	            String password = request.getParameter("password");
	            String userType = request.getParameter("userType");
	            System.out.println(fullname);
	            System.out.println(password);
	            System.out.println(userType);
	            User user = getUserService().viewProfileDetails(fullname, password, userType);
				if (user.getiduser() > 0) {
					   RequestDispatcher rd = request.getRequestDispatcher("myprofile.jsp");
				        rd.forward(request, response);
				} else {
//	                    String message = "Login failed. Please try again.";
//	                    request.setAttribute("feebackMessage", message);
				    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				    rd.forward(request, response);
				}
	        }
	 }
}



