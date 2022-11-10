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
	
}
