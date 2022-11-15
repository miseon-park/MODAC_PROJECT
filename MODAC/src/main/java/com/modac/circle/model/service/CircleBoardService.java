package com.modac.circle.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.circle.model.dao.CircleBoardDao;
import com.modac.circle.model.vo.Circle;
import com.modac.common.JDBCTemplate;

public class CircleBoardService {
	
public int insertBoard(Circle c) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result1 = new CircleBoardDao().insertBoard(c, conn);
		
		
		
		
		
		//트랜잭션 처리
		if(result1>0 ) {
			//첨부파일이 없는경우, insert가 성공했을때도 result2는 여전히 0이라 rollback 처리가 될 수 있으믈
			// result2 = 1ㄹ 초기화 시켜둠
			JDBCTemplate.commit(conn);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close();
		
		
		//혹시라도 하나라도 실패하여 0이될 경우 아예 실패값을 반환받기위해 곱세결과를 리턴.
		return result1;
	}

public int increaseCount(int postNo) {
	Connection conn = JDBCTemplate.getConnection();
	
	int result = new CircleBoardDao().increaseCount(conn, postNo);
	
	if(result>0 ) {
		//첨부파일이 없는경우, insert가 성공했을때도 result2는 여전히 0이라 rollback 처리가 될 수 있으믈
		// result2 = 1ㄹ 초기화 시켜둠
		JDBCTemplate.commit(conn);
		
	}else {
		JDBCTemplate.rollback(conn);
	}
	JDBCTemplate.close();
	
	
	return result;
	
}

public Circle selectBoard(int postNo) {
	Connection conn = JDBCTemplate.getConnection();
	
	Circle c = new CircleBoardDao().selectBoard(conn, postNo);
	
	JDBCTemplate.close();
	
	return c;
}
public ArrayList<Circle> selectList(){
	Connection conn = JDBCTemplate.getConnection();
	
	ArrayList<Circle> list = new CircleBoardDao().selectList(conn);
	
	JDBCTemplate.close();
	
	return list;
}

public int updateBoard(Circle c) {
	Connection conn = JDBCTemplate.getConnection();
	
	int result1 = new CircleBoardDao().updateBoard(conn, c);
	
	//int result2 = 1;
	
	// 새롭게 첨부된 파일이 있는경우
	/*
	 * if(at!= null) { //기존에 첨부파일이 있었을경우 => update문 실행 if(at.getFileNo()!=0) {
	 * result2 = new BoardDao().updateAttachment(at, conn);
	 * 
	 * }else { result2 = new BoardDao().insertNewAttachment(at, conn); } }
	 */
	
	if (result1 > 0 /* && result2>0 */) {
		JDBCTemplate.commit(conn);
	}else {
		JDBCTemplate.rollback(conn);
	}
	JDBCTemplate.close();
	
	return result1/* result2 */;
}

}
