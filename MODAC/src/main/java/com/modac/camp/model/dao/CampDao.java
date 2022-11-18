package com.modac.camp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.modac.camp.model.vo.Camp;
import com.modac.common.JDBCTemplate;


public class CampDao{
	
	public ArrayList<Camp> searchList(Connection conn, String loc1, String loc2){
		ArrayList<Camp> list = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rset = null;
		Properties prop = new Properties();
		String sql = prop.getProperty("searchList");
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, loc1);
			psmt.setString(2, loc2);
			rset=psmt.executeQuery();
			
			while(rset.next()) {
				Camp c = new Camp();
				c.setLocation_1(rset.getString("LOCATION_1"));
				c.setLocation_2(rset.getString("LOCATION_2"));
				list.add(c);
			}
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		} return list;
	}

}
