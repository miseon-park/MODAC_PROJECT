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
	/**
	 * 
	 * @param checkId => 아이디 체크
	 * @return
	 */
	public int idcheck(String checkId) {
	    Connection conn = JDBCTemplate.getConnection();
	    int count = new MemberDao().idcheck(conn, checkId);
	    JDBCTemplate.close();
	    return count;
	}
	/**
	 * 회원정보 수정용 서비스
	 * @param m => 수정할 회원의 정보가 담긴 Member 객체
	 * @return => 수정한 회원의 갱신된 정보
	 */
	public Member updateMember(Member m) {
		Connection conn=JDBCTemplate.getConnection();
		
		int result = new MemberDao().updateMember(m, conn);
		
		Member updateMem = null;
		if(result > 0) {
			JDBCTemplate.commit(conn);
			
			//갱신된 회원객체 다시 조회
			
			updateMem = new MemberDao().selectMember(m.getMemberId(), conn);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close();
		
		return updateMem;
		
	}
	
	/**
	 * 비밀번호 수정용 서비스
	 * @param userId = > 수정할 회원의 아이디
	 * @param userPwd = > 수정할 회원의 원래 비밀번호
	 * @param updatePwd = > 수정할 새로운 비밀번호
	 * @return => 수정된 회원의 갱신된 정보
	 */
	public Member updatePwdMember(String memberId, String memberPwd, String updatePwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member updateMem = null;
		
		int result = 0;
		
		result = new MemberDao().updatePwdMember(memberId, memberPwd, updatePwd, conn);
		
		if(result > 0) {//성공시
			JDBCTemplate.commit(conn);
			
			//갱신된 회원객체 다시 조회해오기
			updateMem = new MemberDao().selectMember(memberId, conn);
		}else {//실패시
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close();
		
		return updateMem;
	}
	
	/**
	 * 회원탈퇴용 서비스
	 * @param userId => 탈퇴요청한 회원의 아이디
	 * @param userPwd => 탈퇴요청한 회원의 비밀번호
	 * @return = 처리된 행의 수
	 */
	public int deleteMember(String memberId, String memberPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().deleteMember(memberId, memberPwd, conn);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close();
		return result;
		
	}
	
	/**
	 * 아이디 찾기
	 * @param memberName
	 * @param email
	 * @return
	 */
	/**
	 * 아이디 찾기
	 * @param memberName
	 * @param email
	 * @return
	 */
	public Member fineId(String memberName, String email) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().fineId(memberName, email, conn);
		JDBCTemplate.close();
		
		return m;
		
	}
	
	/**
	 * 비밀번호찾기
	 * @param memberId
	 * @param memberName
	 * @param email
	 * @return
	 */
	public Member findPwd(String memberId, String memberName, String email) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().findPwd(memberId, memberName, email, conn);
		System.out.println("ser"+m);
		JDBCTemplate.close();
		
		return m;
	}
	
	/**
	 * 비밀번호찾고변경
	 */
	public Member fineupdatePwd(String memberId, String memberName, String email, String updatePwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member updateMem = null;
		
		int result = 0;
		
		result = new MemberDao().fineUpdatePwd(memberId, memberName, email, updatePwd,conn);
		System.out.println("result : "+result);
		if(result > 0){
			JDBCTemplate.commit(conn);
			updateMem = new MemberDao().selectMember(memberId,conn);
			System.out.println("updateMem Service : " + updateMem);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close();
		return updateMem;
	}
	/**
	 * 이메일 중복 체크
	 * @param checkEamil
	 * @return
	 */
	public int emailCheck(String checkemail) {
	    Connection conn = JDBCTemplate.getConnection();
	    System.out.println(checkemail);
	    int result = new MemberDao().emailCheck(conn, checkemail);
	    System.out.println(result);
	    JDBCTemplate.close();
	    return result;
	}
	

}
