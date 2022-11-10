package com.modac.member.model.service;

import java.sql.Connection;

import com.modac.common.JDBCTemplate;
import com.modac.member.model.dao.MemberDao;
import com.modac.member.model.vo.Member;

public class MemberService {
	/**
	 * 로그인 요청 서비스
	 * @param userId => 사용자가 입력했던 아이디값.
	 * @param userPwd => 사용자가 입력했던 비밀번호값.
	 * 
	 */
	public Member loginMember(String userId , String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().loginMember(userId , userPwd , conn);
		
		JDBCTemplate.close();
		
		return m;
	}
}
