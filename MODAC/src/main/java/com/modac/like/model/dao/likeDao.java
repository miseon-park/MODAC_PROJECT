package com.modac.like.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Map;
import java.util.Properties;

import com.modac.common.JDBCTemplate;
import com.modac.like.model.vo.like;
import com.modac.member.model.dao.MemberDao;

public class likeDao {
	
	private Properties prop = new Properties();
	
	public likeDao() {
		String fileName = MemberDao.class.getResource("/sql/member/like-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public int recUpdate(like l,Connection conn) {
		int result = 0;
		PreparedStatement psmt = null;
		String sql = prop.getProperty("recUpdate");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, l.getMemberNo());
			psmt.setString(2, l.getPostNo());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
	
	
	
	
//	// 게시글 추천여부 검사
//	public int recCheck(Map<String, Object> m){
//		int result = 0;
//		try {
//			session = getSession();
//			result = (Integer) session.selectOne("board.rec_check", m);
//		} catch (Exception e) {
//			System.out.println("recCheck : " + e);
//			e.printStackTrace();
//		}
//		return result;
//	}
//	
//	// 게시글 추천
//	public void recUpdate(Map<String, Object> m){
//		try {
//			session = getSession();
//			session.insert("board.rec_update", m);
//		} catch (Exception e) {
//			System.out.println("recUpdate : " + e);
//			e.printStackTrace();
//		}
//	}
//	
//	// 게시글 추천 제거
//	public void recDelete(Map<String, Object> m){
//		try {
//			session = getSession();
//			session.insert("board.rec_delete", m);
//		} catch (Exception e) {
//			System.out.println("recDelete : " + e);
//			e.printStackTrace();
//		}
//	}
//	
//	// 게시글 추천수
//	public int recCount(int no){
//		int count = 0;
//		try {
//			session = getSession();
//			count = (Integer) session.selectOne("board.rec_count", no);
//		} catch (Exception e) {
//			System.out.println("recCount : " + e);
//			e.printStackTrace();
//		}
//		return count;
//	}
	
	
	
	
	
	
	
	
	
}

