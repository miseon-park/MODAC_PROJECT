package com.modac.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.notice.model.dao.NoticeDao;
import com.modac.notice.model.vo.Notice;
import static com.modac.common.JDBCTemplate.*;

public class NoticeService {

	public ArrayList<Notice> selectNoticeList(){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		close();
		
		return list;
	}
	
	
	public int increaseCount(String noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(noticeNo, conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close();
		return result;
	}
	
	public Notice selectNotice(String noticeNo) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(noticeNo, conn);
		
		close();
		
		return n;
	}
	
	
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(n, conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close();
		
		return result;
	}
	
	
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(n, conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close();
		return result;
	}
	
	
	public int deleteNotice(String noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(noticeNo, conn);
		
		commitOrRollback(result, conn);
		
		return result;
	}
	
	public void commitOrRollback(int result, Connection conn) {
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close();
	}
	
}






















