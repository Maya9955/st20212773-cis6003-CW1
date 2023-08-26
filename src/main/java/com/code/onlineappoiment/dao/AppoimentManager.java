package com.code.onlineappoiment.dao;

import java.sql.SQLException;
import java.util.List;

import com.code.onlineappoiment.model.Appoiment;

public interface AppoimentManager {
	
	public boolean addAppoiment(Appoiment appoiment) throws SQLException, ClassNotFoundException;
	
	public boolean editAppoiment(Appoiment appoiment) throws SQLException, ClassNotFoundException;
	
	public boolean deleteAppoiment(int idappoiment) throws SQLException, ClassNotFoundException;
	
	public Appoiment fetchSingleAppoiment(int idappoiment) throws SQLException, ClassNotFoundException;
	
	public List<Appoiment> fetchAllAppoiment() throws SQLException, ClassNotFoundException;
}
