package com.modac.like.model.service;

import java.sql.Connection;

import com.modac.common.JDBCTemplate;
import com.modac.like.model.dao.likeDao;
import com.modac.like.model.vo.like;

public class likeService {
	
	public int recUpdate(like l) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new likeDao().recUpdate(l, conn);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close();
		return result;
				
//				likeDao manager = likeDao.getInstance();
//				// 동일 게시글에 대한 이전 추천 여부 검색
//				int result = manager.recCheck(m);
//				
//				if(result == 0){ // 추천하지 않았다면 추천 추가
//					manager.recUpdate(m);
//				}else{ // 추천을 하였다면 추천 삭제
//					manager.recDelete(m);
//				}
//				return null;
	}
}
