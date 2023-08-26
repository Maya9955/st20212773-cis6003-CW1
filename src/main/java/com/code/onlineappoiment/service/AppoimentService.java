package com.code.onlineappoiment.service;

import java.sql.SQLException;
import java.util.List;

import com.code.onlineappoiment.dao.AppoimentManager;
import com.code.onlineappoiment.dao.AppoimentManagerImpl;
import com.code.onlineappoiment.model.Appoiment;

public class AppoimentService {
	
	private static AppoimentService appoimentServiceObj;

	private AppoimentService() {
		
	}
	
	public synchronized static AppoimentService getAppoimentService() {
		
		if(appoimentServiceObj == null) {
			appoimentServiceObj = new AppoimentService();
		}
		
		return appoimentServiceObj;
	}
	
	private AppoimentManager getAppoimentManager() {
		return new AppoimentManagerImpl();
	}
	
	public boolean addAppoiment(Appoiment appoiment) throws ClassNotFoundException, SQLException {
		return getAppoimentManager().addAppoiment(appoiment);
	}
	
	public boolean editAppoiment(Appoiment appoiment) throws ClassNotFoundException, SQLException {
		return getAppoimentManager().editAppoiment(appoiment);
	}
	
	public boolean deleteAppoiment(int idappoiment) throws ClassNotFoundException, SQLException {
		return getAppoimentManager().deleteAppoiment(idappoiment);
	}
	
	public Appoiment fetchSingleAppoiment(int idappoiment) throws ClassNotFoundException, SQLException {
		return getAppoimentManager().fetchSingleAppoiment(idappoiment);
	}
	
	public List<Appoiment> fetchAllAppoiment() throws ClassNotFoundException, SQLException {
		return getAppoimentManager().fetchAllAppoiment();
	}

	
}
