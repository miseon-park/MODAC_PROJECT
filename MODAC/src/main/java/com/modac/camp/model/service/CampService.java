package com.modac.camp.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.camp.model.dao.CampDao;
import com.modac.camp.model.vo.Camp;
import com.modac.common.JDBCTemplate;

public class CampService {
	
	public ArrayList<Camp> selectCampList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Camp> list = new CampDao().selectCampList(conn);
		
		JDBCTemplate.close();
		
		return list;
		
	}

}
