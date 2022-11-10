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
}
