package com.code.onlineappoiment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.code.onlineappoiment.dao.dbutils.DbDriverManager;
import com.code.onlineappoiment.dao.dbutils.DbDriverManagerFactory;
import com.code.onlineappoiment.model.Appoiment;

public class AppoimentManagerImpl implements AppoimentManager {
	
	
	/*
	 * 1. import the packages
	 * 2. Load the drivers ------------------------------------------------->
	 * 3. Establish the connection ---------------------------------------------------->
	 * 4. Prepare the statement
	 * 5. Execute the query
	 * 6. Process the result
	 * 7. Close the statement and the connection
	 */

	public AppoimentManagerImpl() {
		// TODO Auto-generated constructor stub
	}
	
	private Connection getConnection() throws ClassNotFoundException, SQLException {
		
		DbDriverManagerFactory driverFactory = new DbDriverManagerFactory();
		DbDriverManager driverManager = driverFactory.getDbDriver("MySQL");
		
		return driverManager.getConnection(); 
	}

	@Override
	public boolean addAppoiment(Appoiment appoinment) throws SQLException, ClassNotFoundException{
		
		Connection connection = getConnection();
		
		//String query = "INSERT INTO product (name, price) VALUES ("+ product.getName() + "," + product.getPrice() + ")";
		//Statement st = connection.createStatement();
		
		/*if(st.executeUpdate(query) > 0)
			result = true;*/
		
		String query = "INSERT INTO appoiment (name,email_id,ph_no,date,status) values (?,?,?,?,?)";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, appoinment.getName());
		ps.setString(2, appoinment.getemail_id());
		ps.setString(3, appoinment.getph_no());
		ps.setString(4, appoinment.getdate());
		 ps.setString(5, appoinment.getstatus()); 
		
//	    // Set the status based on the provided action type
//	    if ("approve".equals(appoinment.getstatus())) {
//	        ps.setString(5, "approved");
//	    } else if ("decline".equals(appoinment.getstatus())) {
//	        ps.setString(5, "declined");
//	    } else {
//	        // Default status or handle other cases as needed
//	        ps.setString(5, "pending");
//	    }
	
		
		boolean result = false;
		
		if(ps.executeUpdate() > 0)
			result = true;		
		
		ps.close();
		connection.close();		
		return result;
	}

	@Override
	public boolean editAppoiment(Appoiment appoiment) throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();
		
		String query = "UPDATE appoiment SET name=?, email_id=?, ph_no=?, date=?, status=? WHERE idappoiment=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, appoiment.getName());
		ps.setString(2, appoiment.getemail_id());
		ps.setString(3, appoiment.getph_no());
		ps.setString(4, appoiment.getdate());
		ps.setString(5, appoiment.getstatus());
		ps.setInt(6, appoiment.getidappoiment());
		/*
		 * if (appoiment.getstatus() != null && !appoiment.getstatus().isEmpty()) { //
		 * Set the status based on the provided action type if
		 * ("approve".equals(appoiment.getstatus())) { ps.setString(5, "approved"); }
		 * else if ("decline".equals(appoiment.getstatus())) { ps.setString(5,
		 * "declined"); } else { // Default status or handle other cases as needed
		 * ps.setString(5, "pending"); } ps.setInt(6, appoiment.getidappoiment()); }
		 */

		
		boolean result = false;		
		if(ps.executeUpdate() > 0)
			result = true;
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public boolean deleteAppoiment(int idappoiment) throws SQLException, ClassNotFoundException {
		
		Connection connection = getConnection();
		String query = "DELETE FROM appoiment WHERE idappoiment=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, idappoiment);
		
		boolean result = false;
		if(ps.executeUpdate() > 0) {
			result = true;
		}
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public Appoiment fetchSingleAppoiment(int idappoiment) throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();
		String query = "SELECT * FROM appoiment WHERE idappoiment=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, idappoiment);
		
		ResultSet rs = ps.executeQuery();
		
		Appoiment appoiment = new Appoiment();
		
		while(rs.next()) {
		    appoiment.setidappoiment(rs.getInt("idappoiment"));
		    appoiment.setName(rs.getString("name"));
		    appoiment.setemail_id(rs.getString("email_id"));
		    appoiment.setph_no(rs.getString("ph_no"));
		    appoiment.setdate(rs.getString("date"));
		    appoiment.setstatus(rs.getString("status"));
		}
		
		ps.close();
		connection.close();		
		return appoiment;
	}

	@Override
	public List<Appoiment> fetchAllAppoiment() throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();
		
		String query = "SELECT * FROM appoiment";
		Statement st = connection.createStatement();
		
		List<Appoiment> appoimentList = new ArrayList<Appoiment>();
		
		ResultSet rs = st.executeQuery(query);
		while(rs.next()) {
			
			Appoiment appoiment = new Appoiment();
			appoiment.setidappoiment(rs.getInt("idappoiment"));
			appoiment.setName(rs.getString("name"));
			appoiment.setemail_id(rs.getString("email_id"));
			appoiment.setph_no(rs.getString("ph_no"));
			appoiment.setdate(rs.getString("date"));
			appoiment.setstatus(rs.getString("status"));
			
			appoimentList.add(appoiment);
		}
		
		st.close();
		connection.close();
		
		return appoimentList;
	}

}
