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

import com.code.onlineappoiment.model.Appoiment;
import com.code.onlineappoiment.model.User;
import com.code.onlineappoiment.service.AppoimentService;
import com.mysql.cj.Session;

/**
 * Servlet implementation class ProductController
 */
public class AppoimentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String message = "";
	
	private AppoimentService getAppoimentService() {
		return AppoimentService.getAppoimentService();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionType= request.getParameter("actiontype");
		
		if(actionType.equals("single")) {
			fetchSingleAppoiment(request, response);
		}
		else {
			fetchAllAppoiment(request, response);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionType = request.getParameter("actiontype");
		
		if(actionType.equals("add")) {
			addAppoiment(request, response);
		}
		else if(actionType.equals("edit")){
			editAppoiment(request, response);
		}
		else if(actionType.equals("delete")) {
			deleteAppoiment(request, response);
		}
	}
	
	private void addAppoiment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		Appoiment appoiment = new Appoiment();
		appoiment.setName(request.getParameter("name"));
		appoiment.setemail_id(request.getParameter("email_id"));
		appoiment.setph_no(request.getParameter("ph_no"));
		appoiment.setdate(request.getParameter("date"));
		appoiment.setstatus(request.getParameter("status"));
				
		
		try {
			if(getAppoimentService().addAppoiment(appoiment))
			{
				message = "The appoiment has been successfully booked!";
			}
			else {
				message = "Failed to book the appoiment!";
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message = "operation failed! " + e.getMessage();
		}
		
		request.setAttribute("feebackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("add-appoiment.jsp");
		rd.forward(request, response);
	}
	
	private void editAppoiment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		Appoiment appoiment = new Appoiment();
		appoiment.setidappoiment(Integer.parseInt(request.getParameter("idappoiment")));
		appoiment.setName(request.getParameter("name"));
		appoiment.setemail_id(request.getParameter("email_id"));
		appoiment.setph_no(request.getParameter("ph_no"));
		appoiment.setdate(request.getParameter("date"));
		appoiment.setstatus(request.getParameter("status"));
		
		
		try {
			if(getAppoimentService().editAppoiment(appoiment)) {
				message = "The appoiment has been successfully updated! Appoiment ID: " + appoiment.getidappoiment();
			}
			else {
				message = "Failed to update the appoiment! Appoiment ID: " + appoiment.getidappoiment();
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}
		
		request.setAttribute("feebackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("search-and-update.jsp");
		rd.forward(request, response);
		
	}
	
	private void deleteAppoiment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		int idappoiment = Integer.parseInt(request.getParameter("idappoiment"));
		
		try {
			if(getAppoimentService().deleteAppoiment(idappoiment)) {
				message = "The apponitment has been successfully deleted. Appointment ID: " + idappoiment;
			}
			else {
				message = "Failed to delet the apponitment! Appointment ID: " + idappoiment;
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message =e.getMessage();
		}
		
		//request.setAttribute("feebackMessage", message);
		//RequestDispatcher rd = request.getRequestDispatcher("view-all-and-delete-specific.jsp");
		//rd.forward(request, response);
		
		HttpSession session = request.getSession();
		session.setAttribute("message", message);
		
		response.sendRedirect("getappoiment?actiontype=all");
	}
	
	private void fetchSingleAppoiment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		int idappoiment = Integer.parseInt(request.getParameter("idappoiment"));
		
		try {
			Appoiment appoiment = getAppoimentService().fetchSingleAppoiment(idappoiment);
			if(appoiment.getidappoiment() > 0) {
				request.setAttribute("appoiment", appoiment);
			}
			else {
				message = "No record found!";
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}
		request.setAttribute("feebackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("search-and-update.jsp");
		rd.forward(request, response);
	}
	
	private void fetchAllAppoiment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		List<Appoiment> appoimentList = new ArrayList<Appoiment>();
		try {
			appoimentList = getAppoimentService().fetchAllAppoiment();
			
			if(!(appoimentList.size() > 0)) {
				message = "No record found!";
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}
		
		request.setAttribute("appoimentList", appoimentList);
		request.setAttribute("feebackMessage", message);
		
		String userType = request.getParameter("userType");
		
		User user = new User();
		
//		UserController userc = new UserController();
//		String ut = userc.currentUserType;
		System.out.println("u type: " + user.getusertype());
		
//	    String jspPage;
//	    if ("approveappoiment".equals("approveappoiment.jsp")) {
//	        jspPage = "approveappoiment.jsp";
//	    } else{
//	        jspPage = "view-appoiment.jsp";
//	    }

		
		RequestDispatcher rd = request.getRequestDispatcher("view-appoiment.jsp");
		rd.forward(request, response);

	}
	
	private void clearMessage() {
		message = "";
	}
	
	

}
