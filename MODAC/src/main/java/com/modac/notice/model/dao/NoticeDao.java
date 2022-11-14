package com.modac.notice.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.modac.notice.model.vo.Notice;

import static com.modac.common.JDBCTemplate.*;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Notice> selectNoticeList(Connection conn){
	
		// select문 = > ResultSet객체(여러행)
		ArrayList<Notice> list = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.executeQuery();
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("POST_NO"),
									rset.getInt("CATEGORY_NO"),
									rset.getString("NOTICE_TITLE"),
									rset.getString("WRITER"),
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
		return list;
	}
	
	
	public int increaseCount(int noticeNo, Connection conn) {
		
		// update문 -> 처리된 행의 갯수를 반환
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, noticeNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		
		return result;
		
	}
	
	
	public Notice selectNotice(int noticeNo, Connection conn) {
		
		// select문은 반환형이 ResultSet
		
		ResultSet rset = null;
		
		Notice n = null;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, noticeNo);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("POST_NO"),
							   rset.getInt("CATEGORY_NO"),
							   rset.getString("NOTICE_TITLE"),
							   rset.getString("NOTICE_CONTENT"),
							   rset.getString("WRITER"),
							   rset.getDate("CREATE_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return n;
	}
	
	
	public int insertNotice(Notice n, Connection conn) {
		
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, n.getNoticeCategory());
			psmt.setString(2, n.getNoticeTitle());
			psmt.setString(3, n.getNoticeContent());
			psmt.setInt(4, Integer.parseInt(n.getNoticeWriter()));
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		
		return result;
		
	}
	
}


























