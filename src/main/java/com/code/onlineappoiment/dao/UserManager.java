package com.code.onlineappoiment.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.onlineappoiment.model.User;

public interface UserManager {
	
	public boolean addUser(User user) throws SQLException, ClassNotFoundException;
	
	public boolean editUser(User user) throws SQLException, ClassNotFoundException;
	
	public boolean deleteUser(int iduser) throws SQLException, ClassNotFoundException;
	
	public User fetchSingleUser(int iduser) throws SQLException, ClassNotFoundException;
	
	public List<User> fetchAllUser() throws SQLException, ClassNotFoundException;

	public User checkUserLogin(String fullname, String password, String userType) throws SQLException, ClassNotFoundException;

	public User fetchUserByUsername(String fullname);

	
}
