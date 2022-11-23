package com.modac.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;


import com.modac.common.JDBCTemplate;
import com.modac.common.model.vo.Reply;

public class ReplyDao {
	
private Properties prop = new Properties();
	
	public ReplyDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReplyDao.class.getResource("/sql/circle/cboard-mapper.xml").getPath()));
		} catch (IOException e) {
		
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		PreparedStatement psmt = null;
		ResultSet rset = null;
		Connection conn = JDBCTemplate.getConnection();
		
		String sql = prop.getProperty("getDate");
		//String SQL = "SELECT NOW()";
		try {
			psmt = conn.prepareStatement(sql);
			rset = psmt.executeQuery();
			if (rset.next()) {
				return rset.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close();
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
			
		}
		
		return ""; //데이터베이스 오류
	}
	
	public int getNext() {
		PreparedStatement psmt = null;
		ResultSet rset = null;
		Connection conn = JDBCTemplate.getConnection();
		//String SQL = "SELECT commentID FROM comment ORDER BY commentID DESC";
		String sql = prop.getProperty("getNext");
		try {
			psmt = conn.prepareStatement(sql);
			rset = psmt.executeQuery();
			if (rset.next()) {
				return rset.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close();
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
			
		}
		return 1; //첫번째 댓글인 경우
	}
	
	public int write(String boardNo, String postNo, String writer, String replyContent) {
		PreparedStatement psmt = null;
		
		Connection conn = JDBCTemplate.getConnection();
		String sql = prop.getProperty("write");
		//String SQL = "INSERT INTO comment VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, boardNo);
			psmt.setInt(2, getNext());
			psmt.setString(3, postNo);
			psmt.setString(4, writer);
			psmt.setString(5, getDate());
			psmt.setString(6, replyContent);
			psmt.setInt(7, 1);
			psmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close();
			
			JDBCTemplate.close(psmt);
			
		}
		return -1; //데이터베이스 오류
	}
	
	public String getUpdateComment(String replyNo) {
		PreparedStatement psmt = null;
		ResultSet rset = null;
		Connection conn = JDBCTemplate.getConnection();
		String sql = prop.getProperty("getUpdateComment");
		//String SQL = "SELECT commentText FROM comment WHERE commentID = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, replyNo);
			rset = psmt.executeQuery();
			if(rset.next()) {
				return rset.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close();
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
			
		}
		return ""; //오류
	}
	
	public ArrayList<Reply> getList(String boardNo, String postNo){
		PreparedStatement psmt = null;
		ResultSet rset = null;
		Connection conn = JDBCTemplate.getConnection();
		String sql = prop.getProperty("getList");
		//String SQL = "SELECT * FROM comment WHERE boardID = ? AND bbsID= ? AND commentAvailable = 1 ORDER BY bbsID DESC"; 
		ArrayList<Reply> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, boardNo);
			psmt.setString(2,  postNo);
			rset = psmt.executeQuery();
			while (rset.next()) {
				list.add(new Reply(rset.getString("BOARD_NO"),
				
				rset.getString("REPLY_NO"),
				rset.getString("POST_NO"),
				rset.getString("WRITER"),
				rset.getDate("CREATE_DATE"),
				rset.getString("REPLY_CONTENT"),
				rset.getString("STATUS")));
				
				
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close();
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
			
		}
		return list; //데이터베이스 오류
	}
	public int update(String replyNo, String replyContent) {
		PreparedStatement psmt = null;
		
		Connection conn = JDBCTemplate.getConnection();
		String sql = prop.getProperty("update");
		
		//String SQL = "UPDATE comment SET commentText = ? WHERE commentID LIKE ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, replyContent);
			psmt.setString(2, replyNo);
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close();
			
			JDBCTemplate.close(psmt);
			
		}
		return -1; // 데이터베이스 오류
	}
	
	public Reply getComment(String replyNo) {
		Reply rp = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		Connection conn = JDBCTemplate.getConnection();
		String sql = prop.getProperty("getComment");
		//String SQL = "SELECT * FROM comment WHERE commentID = ? ORDER BY commentID DESC";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,  replyNo);
			rset = psmt.executeQuery();
			if(rset.next()) {
				 rp = new Reply(rset.getString("BOARD_NO"),
				
				rset.getString("REPLY_NO"),
				rset.getString("POST_NO"),
				rset.getString("WRITER"),
				rset.getDate("CREATE_DATE"),
				rset.getString("REPLY_CONTENT"),
				rset.getString("STATUS"));
				 return rp;
				
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close();
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
			
		}
		return null;
	}
	
	public int delete(String replyNo) {
		PreparedStatement psmt = null;
		
		Connection conn = JDBCTemplate.getConnection();
		String sql = prop.getProperty("getComment");
		
		//String SQL = "DELETE FROM comment WHERE commentID = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, replyNo);
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			JDBCTemplate.close();
		
			JDBCTemplate.close(psmt);
			
		}
		return -1; // 데이터베이스 오류
	}
	
	

}
