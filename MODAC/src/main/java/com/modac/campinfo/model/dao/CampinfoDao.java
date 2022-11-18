package com.modac.campinfo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.modac.campinfo.model.vo.Campinfo;

public class CampinfoDao {
	
	public ArrayList<Campinfo> searchList(Connection conn, String loc1, String loc2){
		ArrayList<Campinfo> list = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rset = null;
		Properties prop = new Properties();
		String sql = prop.getProperty("searchList");
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, loc1);
			psmt.setString(2, loc2);
			rset=psmt.executeQuery();
			
			while
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		}
	}

}
