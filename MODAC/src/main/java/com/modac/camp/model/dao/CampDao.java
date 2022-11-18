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
import static com.modac.common.JDBCTemplate.*;

public class CampDao {
	
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
			close(rset);
			close(psmt);
		}
		
		return list;
	}

}
