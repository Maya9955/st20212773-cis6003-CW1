package com.code.onlineappoiment.service;

import java.sql.SQLException;
import java.util.List;

import com.code.onlineappoiment.dao.UserManager;
import com.code.onlineappoiment.dao.UserManagerImpl;
import com.code.onlineappoiment.model.User;

public class UserService {
	
	private static UserService userServiceObj;

	 UserService() {
		
	}
	
	public synchronized static UserService getUserService() {
		
		if(userServiceObj == null) {
			userServiceObj = new UserService();
		}
		
		return userServiceObj;
	}
	
	private UserManager getUsertManager() {
		return new UserManagerImpl();
	}
	
	public boolean addUser(User user) throws ClassNotFoundException, SQLException {
		return getUsertManager().addUser(user);
	}
	
	public boolean editUser(User user) throws ClassNotFoundException, SQLException {
		return getUsertManager().editUser(user);
	}
	
	public boolean deleteUser(int iduser) throws ClassNotFoundException, SQLException {
		return getUsertManager().deleteUser(iduser);
	}
	
	public User fetchSingleUser(int iduser) throws ClassNotFoundException, SQLException {
		return getUsertManager().fetchSingleUser(iduser);
	}
	
	public List<User> fetchAllUser() throws ClassNotFoundException, SQLException {
		return getUsertManager().fetchAllUser();
	}

	public User checkUserLogin(String fullname, String password, String userType) throws SQLException, ClassNotFoundException {
		return getUsertManager().checkUserLogin(fullname, password, userType);
		
	}

	public User getUserById(Integer iduser) throws ClassNotFoundException, SQLException {
		return getUsertManager().getUserById(iduser);
	}

	public User viewProfileDetails(String fullname, String password, String userType) throws ClassNotFoundException, SQLException {
		return getUsertManager().viewProfileDetails(fullname, password, userType);
	}
	
	
	
}
