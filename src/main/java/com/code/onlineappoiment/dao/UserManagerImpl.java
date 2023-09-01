package com.code.onlineappoiment.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.onlineappoiment.dao.dbutils.DbDriverManager;
import com.code.onlineappoiment.dao.dbutils.DbDriverManagerFactory;
import com.code.onlineappoiment.model.User;

public class UserManagerImpl implements UserManager {


	public UserManagerImpl() {
		// TODO Auto-generated constructor stub
	}
	
	private Connection getConnection() throws ClassNotFoundException, SQLException {
		
		DbDriverManagerFactory driverFactory = new DbDriverManagerFactory();
		DbDriverManager driverManager = driverFactory.getDbDriver("MySQL");
		
		return driverManager.getConnection(); 
	}

	@Override
	public boolean addUser(User user) throws SQLException, ClassNotFoundException{
		
		Connection connection = getConnection();
		
		String query = "INSERT INTO user (fullname,email,password,usertype) values (?,?,?,?)";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, user.getfullname());
		ps.setString(2, user.getemail());
		ps.setString(3, user.getpassword());
		ps.setString(4, user.getusertype());

		
		boolean result = false;
		
		if(ps.executeUpdate() > 0)
			result = true;		
		
		ps.close();
		connection.close();		
		return result;
	}

	@Override
	public boolean editUser(User user) throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();
		
		String query = "UPDATE user SET fullname=?, email=?, password=?, usertype=? WHERE iduser=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, user.getfullname());
		ps.setString(2, user.getemail());
		ps.setString(3, user.getpassword());
		ps.setString(4, user.getusertype());
		ps.setInt(6, user.getiduser());

		
		boolean result = false;		
		if(ps.executeUpdate() > 0)
			result = true;
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public boolean deleteUser(int iduser) throws SQLException, ClassNotFoundException {
		
		Connection connection = getConnection();
		String query = "DELETE FROM user WHERE iduser=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, iduser);
		
		boolean result = false;
		if(ps.executeUpdate() > 0) {
			result = true;
		}
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public User fetchSingleUser(int iduser) throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();
		String query = "SELECT * FROM user WHERE iduser=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, iduser);
		
		ResultSet rs = ps.executeQuery();
		
		User user = new User();
		
		while(rs.next()) {
			user.setiduser(rs.getInt("iduser"));
			user.setfullname(rs.getString("fullname"));
			user.setemail(rs.getString("email"));
			user.setpassword(rs.getString("password"));
			user.setusertype(rs.getString("usertype"));
		}
		
		ps.close();
		connection.close();		
		return user;
	}
	
	


	@Override
	public List<User> fetchAllUser() throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();
		
		String query = "SELECT * FROM user";
		Statement st = connection.createStatement();
		
		List<User> userList = new ArrayList<User>();
		
		ResultSet rs = st.executeQuery(query);
		while(rs.next()) {
			
			User user = new User();
			user.setiduser(rs.getInt("iduser"));
			user.setfullname(rs.getString("fullname"));
			user.setemail(rs.getString("email"));
			user.setpassword(rs.getString("password"));
			user.setusertype(rs.getString("usertype"));
			
			userList.add(user);
		}
		
		st.close();
		connection.close();
		
		return userList;
	}

	@Override
	public User fetchUserByUsername(String fullname) {
		// TODO Auto-generated method stub
		return null;
	}

@Override
public User checkUserLogin(String fullname, String password, String userType)throws SQLException, ClassNotFoundException {
    Connection connection = getConnection();
    String query = "SELECT * FROM user WHERE fullname=? AND password=? AND usertype=?";
    

		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, fullname);
		ps.setString(2, password);
        ps.setString(3, userType);
		
		ResultSet rs = ps.executeQuery();
		
		User user = new User();
		
		while(rs.next()) {
			user.setiduser(rs.getInt("iduser"));
			user.setfullname(rs.getString("fullname"));
			user.setemail(rs.getString("email"));
			user.setpassword(rs.getString("password"));
			user.setusertype(rs.getString("usertype"));
		}
		
		ps.close();
		connection.close();		
		return user;
}



@Override
public User viewProfileDetails(String fullname, String password, String userType) throws ClassNotFoundException, SQLException {
	 Connection connection = getConnection();
	    String query = "SELECT * FROM user WHERE fullname=? AND password=? AND usertype=?";
	    

			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, fullname);
			ps.setString(2, password);
	        ps.setString(3, userType);
			
			ResultSet rs = ps.executeQuery();
			
			User user = new User();
			
			while(rs.next()) {
				user.setiduser(rs.getInt("iduser"));
				user.setfullname(rs.getString("fullname"));
				user.setemail(rs.getString("email"));
				user.setpassword(rs.getString("password"));
				user.setusertype(rs.getString("usertype"));
			}
			
			ps.close();
			connection.close();		
			return user;
}

@Override
public User getUserById(Integer iduser) throws SQLException, ClassNotFoundException {
	// TODO Auto-generated method stub
	return null;
}

}
