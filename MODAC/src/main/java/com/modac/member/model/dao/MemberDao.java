package com.modac.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.modac.common.JDBCTemplate;
import com.modac.member.model.vo.Member;

public class MemberDao {
	String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
	private Properties prop = new Properties();
	
	public Member loginMember(String memberId, String memberPwd, Connection conn) {
		Member m = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, memberId);
			psmt.setString(2, memberPwd);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("MEMBER_NO"),
						rset.getString("MEMBER_ID"),
						rset.getString("MEMBER_PWD"),
						rset.getString("MEMBER_NAME"),
						rset.getString("MEMBER_NIC"),
						rset.getString("STATUS"),
						rset.getDate("IN_DATE"),
						rset.getDate("MODI_DATE"),
						rset.getInt("MEMBER_LEVEL"),
						rset.getString("EMAIL"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		return m;
	}
	
	
	public int updateMember(Member m, Connection conn) {
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			
			/*
			 * UPDATE MEMBER SET
			 * USER_NAME=?,
			 * PHONE = ?,
			 * EMAIL=?...
			 * WHERE USER_ID=?
			 * 
			 */
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, m.getMemberName());
			
			psmt.setString(2, m.getMemberNic());
			psmt.setString(3, m.getEmail());
			
			psmt.setString(4, m.getMemberId());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(psmt);
		}
		return result;
		
	}
	
	public int updatePwdMember(String memberId, String memberPwd, String updatePwd, Connection conn) {
		int result = 0;
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, updatePwd);
			psmt.setString(2, memberId);
			psmt.setString(3, memberPwd);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(psmt);
		}
		return result;
	}
	
public Member selectMember(String userId, Connection conn) {
		
		Member m = null;
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		/*
		 * SELECT * FROM MEMBER
		 * WHERE USER_ID = ?
		 * 
		 */
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, userId);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				 m = new Member(rset.getString("MEMBER_NO"),
						 rset.getString("MEMBER_ID"),
						 rset.getString("MEMBER_PWD"),
						 rset.getString("MEMBER_NAME"),
						 rset.getString("MEMBER_NIC"),
						 rset.getString("STATUS"),
						 rset.getDate("IN_DATE"),
						 rset.getDate("MODI_DATE"),
						 rset.getInt("MEMBER_LEVEL"),
						 rset.getString("EMAIL"));
				 
			 }
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return m;
		
	}
public int deleteMember(String memberId, String memberPwd, Connection conn) {
	int result = 0;
	
	PreparedStatement psmt = null;
	
	String sql = prop.getProperty("deleteMember");
	
	try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, memberId);
		psmt.setString(2, memberPwd);
		
		result = psmt.executeUpdate();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally {
		JDBCTemplate.close(psmt);
	}
	
	return result;
}

}
