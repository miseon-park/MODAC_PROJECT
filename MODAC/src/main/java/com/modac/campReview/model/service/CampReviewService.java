package com.modac.campReview.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.campReview.model.dao.CampReviewDao;
import com.modac.campReview.model.vo.CampReview;
import com.modac.campReview.model.vo.ReviewTag;
import com.modac.common.model.vo.Attachment;
import com.modac.common.model.vo.PageInfo;

import static com.modac.common.JDBCTemplate.*;

public class CampReviewService {
		
	public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = new CampReviewDao().selectListCount(conn);
		close();
		return listCount;
	}

	public ArrayList<CampReview> selectCampReviewList(PageInfo pi, String field, String query){
		
		Connection conn = getConnection();
		
		ArrayList<CampReview> list = new CampReviewDao().selectCampReviewList(conn, pi, field, query);
		
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
	
	public ReviewTag selectReviewTag(int campReviewNo) {
		
		Connection conn = getConnection();
		
		ReviewTag rt= new CampReviewDao().selectReviewTag(campReviewNo, conn);
		
		close();
		
		return rt;
	}
	
	public Attachment selectAttachment(int postNo) {

		Connection conn = getConnection();
		
		Attachment at= new CampReviewDao().selectAttachment(postNo, conn);
		
		close();
		
		return at;
		
	}
	
	
	public int insertCampReview(CampReview cr, Attachment at) {
		Connection conn = getConnection();
		int postNo=new CampReviewDao().selectPostNo(conn);
		cr.setPostNo(String.valueOf(postNo));
		
		int result1 = new CampReviewDao().insertCampReview(cr,conn);
		
		int result2 = 1;
				
	    int result3 = 1;
	    
		result2 = new CampReviewDao().insertTag(cr, conn);
		
		if(at != null) {
			at.setPostNo(String.valueOf(postNo));
			result3 = new CampReviewDao().insertAttachment(at, conn);
		} 
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		return result1 * result2 * result3;
	}
	
	public int updateCampReview(CampReview cr, Attachment at) {
		Connection conn = getConnection();
		int postNo=new CampReviewDao().selectPostNo(conn);
		cr.setPostNo(String.valueOf(postNo));
		
		int result1 = new CampReviewDao().updateCampReview(cr, conn);
		
		int result2 = 1;
		
		int result3 = 1;
		
		result2 = new CampReviewDao().insertTag(cr, conn);
		
        // 새롭게 첨부된 파일이 있는 경우 
        if(at != null) {
            // 기존에 첨부파일이 있었을 경우 => update문 실행
            if(at.getPhotoNo() != null) {
                result3 = new CampReviewDao().updateAttachment(at, conn);
            }else {//기존에 첨부파일이 없었을 경우 => insert문 실행
                result3 = new CampReviewDao().insertNewAttachment(at, conn);
            }
        }
        
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		
		return result1 * result2 * result3;
	}
	

	
	public int deleteCampReview(int postNo) {
		Connection conn = getConnection();
		
		int result = new CampReviewDao().deleteCampReview(postNo, conn);
		
		commitRollback(result, conn);
		
		return result;
		
	}
	
	public void commitRollback(int result, Connection conn) {
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
	}
	
	
	
	
	
}
