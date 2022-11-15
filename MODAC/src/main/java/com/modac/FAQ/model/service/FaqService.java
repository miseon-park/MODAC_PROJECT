package com.modac.FAQ.model.service;

import static com.modac.common.JDBCTemplate.close;
import static com.modac.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.FAQ.model.dao.FaqDao;
import com.modac.FAQ.model.vo.Faq;


public class FaqService {

	public ArrayList<Faq> selectFaqList(){
		
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDao().selectFaqList(conn);
		
		close();
		
		return list;
	}
	
	public Faq selectFaq(int faqNo) {
		Connection conn = getConnection();
		
		Faq f = new FaqDao().selectFaq(faqNo, conn);
		
		close();
		
		return f;
	}
}
