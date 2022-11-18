package com.modac.QA.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.modac.QA.model.vo.Qa;

import static com.modac.common.JDBCTemplate.*;

public class QaDao {
	
	private Properties prop = new Properties();
	
	public QaDao() {
		String fileName = QaDao.class.getResource("/sql/QA/qa-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Qa> selectQaList(Connection conn){
		
		ArrayList<Qa> qList = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQaList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.execute();
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				qList.add(new Qa(rset.getString("POST_NO"),
								 rset.getString("POST_TITLE"),
								 rset.getString("HIDDEN_POST"),
								 rset.getString("MEMBER_NIC"),
								 rset.getDate("CREATE_DATE"),
								 rset.getInt("READ_COUNT")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		
		return qList;
	}

}
