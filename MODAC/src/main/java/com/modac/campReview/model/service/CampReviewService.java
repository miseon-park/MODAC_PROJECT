package com.modac.campReview.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.campReview.model.dao.CampReviewDao;
import com.modac.campReview.model.vo.CampReview;

import static com.modac.common.JDBCTemplate.*;

public class CampReviewService {

	public ArrayList<CampReview> selectCampReviewList(){
		
		Connection conn = getConnection();
		
		ArrayList<CampReview> list = new CampReviewDao().selectCampReviewList(conn);
		
		close();
		
		return list;
		
	}
	
	public int increaseCount(int campReviewNo) {
		
		Connection conn = getConnection();
		
		int result = new CampReviewDao().increaseCount(campReviewNo, conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close();
		return result;		
	}
	
	public CampReview selectCampReview(int campReviewNo) {
		
		Connection conn = getConnection();
		
		CampReview cr= new CampReviewDao().selectCampReview(campReviewNo, conn);
		
		close();
		
		return cr;
		
		
	}
	
	
	
}
