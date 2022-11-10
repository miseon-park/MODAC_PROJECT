package com.modac.campReview.model.dao;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.modac.campReview.model.vo.CampReview;

import static com.modac.common.JDBCTemplate.*;

public class CampReviewDao {

	private Properties prop = new Properties();
	
	public CampReviewDao() {
		String fileName = CampReviewDao.class.getResource("/sql/campReview/campReview-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	 public ArrayList<CampReview> selectCampReviewList(Connection conn){
		 
		 ArrayList<CampReview> list = new ArrayList<>();
		 
		 PreparedStatement psmt = null;
		 
		 ResultSet rset = null;
		 
		 String sql = prop.getProperty("selectCampRevieList");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new CampReview(rset.getString("POST_NO"),
										rset.getString("POST_TITLE"),
										rset.getString("MEMBER_NIC"),
										rset.getDate("CREATE_DATE"),
										rset.getInt("READ_COUNT")        
										));
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return list;
	 }
	
	
	
	
	
}
