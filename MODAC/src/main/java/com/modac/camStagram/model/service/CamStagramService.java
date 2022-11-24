package com.modac.camStagram.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.common.model.vo.Attachment;
import com.modac.common.model.vo.PageInfo;
import com.modac.camStagram.model.dao.CamStagramDao;
import com.modac.camStagram.model.vo.CamStagram;

import static com.modac.common.JDBCTemplate.*;

public class CamStagramService {

	//0
	public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = new CamStagramDao().selectListCount(conn);
		close();
		return listCount;
	}
	
	//0
	public ArrayList<CamStagram> selectCamStagramList(PageInfo pi, String field, String query){
		
		Connection conn = getConnection();
		
		ArrayList<CamStagram> list = new CamStagramDao().selectCamStagramList(conn, pi, field, query);
		
		close();
		
		return list;
		
	}
	
	//0
	public int increaseCount(int postNo) {
		
		Connection conn = getConnection();
		
		int result = new CamStagramDao().increaseCount(postNo, conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close();
		return result;		
	}
	
    //0
	public CamStagram selectCamStagram(int postNo) {
		
		Connection conn = getConnection();
		
		CamStagram cs = new CamStagramDao().selectCamStagram(postNo, conn);
		
		close();
		System.out.println("list(ser) : "+cs);
		  
		return cs;
	}
	
	//0
	public Attachment selectAttachment(int postNo) {

		Connection conn = getConnection();
		
		Attachment at= new CamStagramDao().selectAttachment(postNo, conn);
		
		close();
		
		return at;
		
	}
	
	//0
	public int insertCamStagram(CamStagram cs, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new CamStagramDao().insertCamStagram(cs, conn);
		
		int result2 = 1;
		
		if(at != null) {
			result2 = new CamStagramDao().insertAttachment(at, conn);
			
		} 
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		
		return result1 * result2;
	}
	
	//0
	public int updateCamStagram(CamStagram cs, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new CamStagramDao().updateCamStagram(cs,conn);
		
		int result2 = 1;
		
        // 새롭게 첨부된 파일이 있는 경우 
        if(at != null) {
            // 기존에 첨부파일이 있었을 경우 => update문 실행
        	at.getPostNo();
            if(at.getPhotoNo() != null) {
                result2 = new CamStagramDao().updateAttachment(at, conn);
            }else {//기존에 첨부파일이 없었을 경우 => insert문 실행
                result2 = new CamStagramDao().insertNewAttachment(at, conn);
            }
        }
        
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		
		return result1 * result2;
	}
	
	//0
	public int deleteCamStagram(int postNo) {
		Connection conn = getConnection();
		
		int result = new CamStagramDao().deleteCamStagram(postNo, conn);
		
		new CamStagramDao().deleteAttachment(postNo, conn);
		
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
