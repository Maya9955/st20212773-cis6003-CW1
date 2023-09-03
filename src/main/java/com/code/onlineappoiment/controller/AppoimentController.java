package com.code.onlineappoiment.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actiontype");

		if (actionType.equals("single")) {
			fetchSingleAppoiment(request, response);
		} else {
			fetchAllAppoiment(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actiontype");

		if (actionType.equals("add")) {
			addAppoiment(request, response);
		} else if (actionType.equals("edit")) {
			editAppoiment(request, response);
		} else if (actionType.equals("delete")) {
			deleteAppoiment(request, response);
		}
	}

	private void addAppoiment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		clearMessage();

		Appoiment appoiment = new Appoiment();
		appoiment.setName(request.getParameter("name"));
		appoiment.setemail_id(request.getParameter("email_id"));
		appoiment.setph_no(request.getParameter("ph_no"));
		appoiment.setdate(request.getParameter("date"));
		appoiment.setstatus(request.getParameter("status"));

		try {
			if (getAppoimentService().addAppoiment(appoiment)) {
				message = "Thank you for booking! Your appointment has been successfully booked. One of our counselors "
						+ "will confirm your booking by email. " + "You can get your booking details from there.";
			} else {
				message = "Booking failed. Please try again.";
			}
		} catch (ClassNotFoundException | SQLException e) {
			message = "operation failed! " + e.getMessage();
		}

		request.setAttribute("feebackMessage", message);
		String userType = request.getParameter("userType");

		User user = new User();

		// Retrieve userType from the session
		String usertype = (String) request.getSession().getAttribute("usertype");

		// Now, you have the userType available to use in your logic
		System.out.println("User type: " + usertype);

		// Determine the JSP page based on userType
		String jspPage;
		if ("counselor".equals(usertype)) {
			jspPage = "approveappoiment.jsp";
		} else {
			jspPage = "add-appoiment.jsp";
		}

		RequestDispatcher rd = request.getRequestDispatcher(jspPage);
		rd.forward(request, response);
	}

	private void editAppoiment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		clearMessage();

		Appoiment appoiment = new Appoiment();
		appoiment.setidappoiment(Integer.parseInt(request.getParameter("idappoiment")));
		appoiment.setName(request.getParameter("name"));
		appoiment.setemail_id(request.getParameter("email_id"));
		appoiment.setph_no(request.getParameter("ph_no"));
		appoiment.setdate(request.getParameter("date"));
		appoiment.setstatus(request.getParameter("status"));

		try {
			if (getAppoimentService().editAppoiment(appoiment)) {
				message = "The appoiment has been successfully updated! Appoiment ID: " + appoiment.getidappoiment();
			} else {
				message = "Failed to update the appoiment! Appoiment ID: " + appoiment.getidappoiment();
			}
		} catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}

		request.setAttribute("feebackMessage", message);

		String userType = request.getParameter("userType");

		User user = new User();

		// Retrieve userType from the session
		String usertype = (String) request.getSession().getAttribute("usertype");
//	    String userid = (String) request.getSession().getAttribute("userid");
		Integer userid = (Integer) request.getSession().getAttribute("userid");

		// Now, you have the userType available to use in your logic
		System.out.println("User type: " + usertype);
		System.out.println("User ID: " + userid);

		RequestDispatcher rd = request.getRequestDispatcher("search-and-update.jsp");
		rd.forward(request, response);

	}

	private void deleteAppoiment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		clearMessage();
		int idappoiment = Integer.parseInt(request.getParameter("idappoiment"));

		try {
			if (getAppoimentService().deleteAppoiment(idappoiment)) {
				message = "The apponitment has been successfully deleted. Appointment ID: " + idappoiment;
			} else {
				message = "Failed to delet the apponitment! Appointment ID: " + idappoiment;
			}
		} catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}

		request.setAttribute("feebackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("view-appoiment.jsp");
		rd.forward(request, response);

		HttpSession session = request.getSession();
		session.setAttribute("message", message);

		response.sendRedirect("getappoiment?actiontype=all");
	}

	private void fetchSingleAppoiment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		clearMessage();

		int idappoiment = Integer.parseInt(request.getParameter("idappoiment"));

		try {
			Appoiment appoiment = getAppoimentService().fetchSingleAppoiment(idappoiment);
			if (appoiment.getidappoiment() > 0) {
				request.setAttribute("appoiment", appoiment);
			} else {
				message = "No record found!";
			}
		} catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}
		request.setAttribute("feebackMessage", message);

		String userType = request.getParameter("userType");

		User user = new User();

		// Retrieve userType from the session
		String usertype = (String) request.getSession().getAttribute("usertype");
		String userfullname = (String) request.getSession().getAttribute("userfullname");
		;
		Integer userid = (Integer) request.getSession().getAttribute("userid");

		// from here we can print, you can check from console
		System.out.println("User type: " + usertype);
		System.out.println("User ID: " + userid);
		System.out.println("User Name: " + userfullname);

		RequestDispatcher rd = request.getRequestDispatcher("search-and-update.jsp");
		rd.forward(request, response);
	}

	private void fetchAllAppoiment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		clearMessage();

		List<Appoiment> appoimentList = new ArrayList<Appoiment>();

		try {
			appoimentList = getAppoimentService().fetchAllAppoiment();

			if (!(appoimentList.size() > 0)) {
				message = "No record found!";
			}
		} catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}

		// Create maps to store user-wise approved and declined appointment counts
		Map<Integer, Integer> userApprovedCounts = new HashMap<>();
		Map<Integer, Integer> userDeclinedCounts = new HashMap<>();

		// Initialize variables to count approved and declined appointments
		int totalApprovedCount = 0;
		int totalDeclinedCount = 0;

		// Iterate through the appointment list to categorize and count user-wise
		// approvals and declines
		for (Appoiment appointment : appoimentList) {
			String status = appointment.getstatus();
			if (status != null) {
				String[] parts = status.split(" ");
				if (parts.length >= 4) {
					String userIDString = parts[3];
					try {
						Integer userID = Integer.parseInt(userIDString);

						if (status.startsWith("Approve by")) {
							// Increment user's approved count
							userApprovedCounts.put(userID, userApprovedCounts.getOrDefault(userID, 0) + 1);
						} else if (status.startsWith("Decline by")) {
							// Increment user's declined count
							userDeclinedCounts.put(userID, userDeclinedCounts.getOrDefault(userID, 0) + 1);
						}
					} catch (NumberFormatException e) {
						// Handle parsing error
					}
				}
			}
		}

		// Now, you have user-wise approved and declined appointment counts
		for (Map.Entry<Integer, Integer> entry : userApprovedCounts.entrySet()) {
			Integer userID = entry.getKey();
			Integer approvedCount = entry.getValue();

			// Print user-wise approved counts
			System.out.println("User ID " + userID + " Approved Appointments Count: " + approvedCount);
		}

		for (Map.Entry<Integer, Integer> entry : userDeclinedCounts.entrySet()) {
			Integer userID = entry.getKey();
			Integer declinedCount = entry.getValue();

			// Print user-wise declined counts
			System.out.println("User ID " + userID + " Declined Appointments Count: " + declinedCount);
		}
		/*
		 * 
		 * // Create a map to store the declined and approved appointment information
		 * (user ID) Map<Integer, String> declinedAppointments = new HashMap<>();
		 * Map<Integer, String> approvedAppointments = new HashMap<>();
		 * 
		 * // Iterate through the appointment list to count approved and declined
		 * appointments for (Appoiment appointment : appoimentList) { String status =
		 * appointment.getstatus(); if (status != null) { if
		 * (status.startsWith("Approve by")) { approvedCount++;
		 * 
		 * // Extract user ID from the status string for approved appointments String[]
		 * parts = status.split(" "); if (parts.length >= 4) { String userIDString =
		 * parts[3]; try { Integer userID = Integer.parseInt(userIDString); // Store the
		 * approved appointment information in the map
		 * approvedAppointments.put(appointment.getidappoiment(), userIDString); } catch
		 * (NumberFormatException e) { // Handle parsing error } } } else if
		 * (status.startsWith("Decline by")) { declinedCount++;
		 * 
		 * // Extract user ID from the status string for declined appointments String[]
		 * parts = status.split(" "); if (parts.length >= 4) { String userIDString =
		 * parts[3]; try { Integer userID = Integer.parseInt(userIDString); // Store the
		 * declined appointment information in the map
		 * declinedAppointments.put(appointment.getidappoiment(), userIDString); } catch
		 * (NumberFormatException e) { // Handle parsing error } } } } }
		 * 
		 * // Now, you have the counts available to use in your logic
		 * System.out.println("Approved Appointments Count: " + approvedCount);
		 * System.out.println("Declined Appointments Count: " + declinedCount);
		 * 
		 * // You can access the approved appointment information by appointment ID for
		 * (Map.Entry<Integer, String> entry : approvedAppointments.entrySet()) {
		 * System.out.println("Appointment ID " + entry.getKey() +
		 * " Approved by User ID " + entry.getValue()); }
		 * 
		 * 
		 * // You can access the declined appointment information by appointment ID for
		 * (Map.Entry<Integer, String> entry : declinedAppointments.entrySet()) {
		 * System.out.println("Appointment ID " + entry.getKey() +
		 * " Declined by User ID " + entry.getValue()); }
		 */

		// Print the counts to the console
		System.out.println("Total Approved Count: " + totalApprovedCount);
		System.out.println("Total Declined Count: " + totalDeclinedCount);

		request.setAttribute("appoimentList", appoimentList);
		request.setAttribute("feebackMessage", message);
		// Set the user-wise approved and declined counts as request attributes
		request.setAttribute("userApprovedCounts", userApprovedCounts);
		request.setAttribute("userDeclinedCounts", userDeclinedCounts);

		// Set the total approved and declined counts as request attributes
		request.setAttribute("totalApprovedCount", totalApprovedCount);
		request.setAttribute("totalDeclinedCount", totalDeclinedCount);

		/*
		 * request.setAttribute("approvedCount", approvedCount); // Add approved count
		 * to request request.setAttribute("declinedCount", declinedCount); // Add
		 * declined count to request
		 */
		String userType = request.getParameter("userType");

		User user = new User();

		// Retrieve userType from the session
		String usertype = (String) request.getSession().getAttribute("usertype");
//	    String userid = (String) request.getSession().getAttribute("userid");
		Integer userid = (Integer) request.getSession().getAttribute("userid");

		// Now, you have the userType available to use in your logic
		System.out.println("User type: " + usertype);
		System.out.println("User ID: " + userid);

		// Determine the JSP page based on userType
		String jspPage;
		if ("counselor".equals(usertype)) {
			jspPage = "approveappoiment.jsp";
		} else if ("admin".equals(usertype)) {
			jspPage = "view-appoiment.jsp";
		} else {
			jspPage = "add-appoiment.jsp";
		}

		RequestDispatcher rd = request.getRequestDispatcher(jspPage);
		rd.forward(request, response);

	}

	private void clearMessage() {
		message = "";
	}

}
