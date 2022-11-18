package com.modac.camp.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.camp.model.dao.CampDao;
import com.modac.camp.model.vo.Camp;

import static com.modac.common.JDBCTemplate.*;

public class CampService {
	
	
	public ArrayList<Camp> selectCampList() {
		
		Connection conn = getConnection();
		
		ArrayList<Camp> list = new CampDao().selectCampList(conn);
		
		close();
		
		return list;
		
	}
	

}