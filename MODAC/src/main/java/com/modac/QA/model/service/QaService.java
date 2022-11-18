package com.modac.QA.model.service;

import static com.modac.common.JDBCTemplate.close;
import static com.modac.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.QA.model.dao.QaDao;
import com.modac.QA.model.vo.Qa;

public class QaService {

	public ArrayList<Qa> selectQaList() {
		
		Connection conn = getConnection();
		
		ArrayList<Qa> qList = new QaDao().selectQaList(conn);
		
		close();
		
		return qList;
	}
	
}
