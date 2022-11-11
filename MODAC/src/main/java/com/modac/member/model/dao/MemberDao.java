package com.modac.member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.modac.common.JDBCTemplate;
import com.modac.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
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
	
	public int insertMember(Member m , Connection conn) {
	    
	    // insert문 처리된 행의 갯수를 반환하여 result에 저장시킬것.
	    int result = 0;
	    
	    PreparedStatement psmt = null;
	    
	    String sql = prop.getProperty("insertMember");
	    try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, m.getMemberId());
			psmt.setString(2, m.getMemberPwd());
			psmt.setString(3, m.getMemberName());
			psmt.setString(4, m.getEmail());
			psmt.setString(5, m.getMemberNic());
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
	    return result;
	}
	
}
