package com.modac.member.model.service;

import java.sql.Connection;

import com.modac.common.JDBCTemplate;
import com.modac.member.model.dao.MemberDao;
import com.modac.member.model.vo.Member;

public class MemberService {
	/**
	 * 로그인 요청 서비스
	 * @param memberId => 사용자가 입력했던 아이디값.
	 * @param memberPwd => 사용자가 입력했던 비밀번호값.
	 * 
	 */
	public Member loginMember(String memberId , String memberPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().loginMember(memberId , memberPwd , conn);
		
		JDBCTemplate.close();
		
		return m;
	}
	/**
	 * 회원 가입용 서비스
	 * @param m => 회원가입할 회원의 정보를 담은 Member객체
	 * @return => 처리된 행수 (int)
	 */
	public int insertMember(Member m) {
	    
	    Connection conn = JDBCTemplate.getConnection();
	    
	    int result = new MemberDao().insertMember(m , conn);
	    
	    if(result > 0) {
	        JDBCTemplate.commit(conn);
	    }else {
	        JDBCTemplate.rollback(conn);
	    }
	    JDBCTemplate.close();
	    
	    return result;
	}
	
	
	
	
	public Member findPwd(String memberId, String memberName, String email) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().findPwd(memberId, memberName, email, conn);
		
		JDBCTemplate.close();
		
		return m;
	}
	
	
}
