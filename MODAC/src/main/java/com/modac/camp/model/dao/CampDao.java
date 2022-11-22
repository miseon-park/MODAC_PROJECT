package com.modac.camp.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.modac.camp.model.vo.Camp;
import com.modac.common.JDBCTemplate;


public class CampDao{
	
	private Properties prop = new Properties();
	public CampDao() {
		String fileName = CampDao.class.getResource("/sql/camp/camp-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Camp> selectCampList(Connection conn) {
		
		// select 여러 행 조회
		ArrayList<Camp> list = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCampList");
		
		try {
			
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Camp(rset.getString("CAMP_NAME"),
									rset.getString("ADDRESS"),
									rset.getString("NATURAL_ATTRI")
						));
			       
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return list;
	}
	
	public ArrayList<Camp> campSelect(String loc1, String loc2, Connection conn) {
		
		ArrayList<Camp> campSelect = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("campSelect");
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, loc1);
			psmt.setString(2, loc2);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				campSelect.add(new Camp(
						rset.getString(1),
						rset.getString(2),
						rset.getString(5)
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		} 
		return campSelect;
		
	}

}

