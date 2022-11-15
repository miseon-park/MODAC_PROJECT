package com.modac.circle.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.modac.circle.model.vo.Circle;
import com.modac.common.JDBCTemplate;

public class CircleBoardDao {
private Properties prop = new Properties();
	
	public CircleBoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(CircleBoardDao.class.getResource("/sql/circle/cboard-mapper.xml").getPath()));
		} catch (IOException e) {
		
			e.printStackTrace();
		}
	}
	
	public int insertBoard(Circle c, Connection conn) {
		int result = 0;
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			psmt=conn.prepareStatement(sql);
			
			
			psmt.setString(1, c.getPostTitle());
			psmt.setString(2, c.getPostContent());
			psmt.setString(3, c.getMemberNo());
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
	

	public int increaseCount(Connection conn, int postNo) {
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, postNo);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(psmt);
		}
		System.out.println("dao" + result);
		return result;
	}
	
public Circle selectBoard(Connection conn, int postNo) {
		
		//select => ResultSet
		
		Circle c = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, postNo);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				c = new Circle(
							rset.getString("POST_NO"),
							
							rset.getString("POST_TITLE"),
							rset.getString("POST_CONTENT"),
							rset.getDate("CREATE_DATE"),
							rset.getString("MEMBER_NO"));
			}
					
					
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return c;
	}

public ArrayList<Circle> selectList(Connection conn){
	
	//select문 => ResultSet
	
	ArrayList<Circle> list = new ArrayList<>();
	
	PreparedStatement psmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectList");
	
	try {
		psmt = conn.prepareStatement(sql);
		
		/*
		 * 
		 * boardLimit 이 10이라고 가정.
		 * 
		 * currentPage = 1 => 시작값1,   끝값 10
		 * currentPage = 2 => 시작값 11, 끝값 20
		 * currentPage = 3 => 시작값 21, 끝값 30
		 * 
		 * 
		 * 시작값 = (currentPage -1) * boardLimit +1;
		 * 끝값 = 시작값 + boardLimit -1;
		 * 
		 * 
		 */
		
		//int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit() +1;
		//int endRow = startRow + pi.getBoardLimit()-1;
		
		//psmt.setInt(1, startRow);
		//psmt.setInt(2, endRow);
		
		rset = psmt.executeQuery();
		
		while(rset.next()) {
			list.add(new Circle(rset.getString("POST_NO"),
					  
					  rset.getString("POST_TITLE"),
					  rset.getString("MEMBER_NO"),
					  rset.getDate("CREATE_DATE"),
					  rset.getInt("READ_COUNT")));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		JDBCTemplate.close(rset);
		JDBCTemplate.close(psmt);
		
	}
	return list;
	
}
public int updateBoard(Connection conn, Circle c) {
	int result = 0;
	PreparedStatement psmt = null;
	String sql = prop.getProperty("updateBoard");
	
	try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, c.getPostTitle());
		psmt.setString(2, c.getPostContent());
		psmt.setString(3, c.getPostNo());
		result = psmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		JDBCTemplate.close(psmt);
	}
	return result;
}



}
