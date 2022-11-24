package com.modac.camp.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.camp.model.dao.CampDao;
import com.modac.camp.model.vo.Camp;
import com.modac.common.model.vo.PageInfo;

import static com.modac.common.JDBCTemplate.*;

public class CampService {
	
	
	
	
	// 검색 x 페이징 처리
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new CampDao().selectListCount(conn);
		
		close();
		
		return listCount;
	}
	
	
	
	// 지역 검색 페이징 처리
	public int locationListCount(String loc1, String loc2) {
		Connection conn = getConnection();
		
		int listCount = new CampDao().locationListCount(loc1, loc2, conn);
		
		close();
		
		return listCount;
		
		
	}
	
	
	// 체크박스 검색 페이징 처리
	public int checkBoxListCount(String [] item1, String pet) {
		
		Connection conn = getConnection();
		
		int listCount = new CampDao().checkBoxListCount(item1, pet, conn);
		
		close();
		
		return listCount;
		
	}
	
	
	
	// 모든 검색 이용시 페이징 처리
	public int allCount(String loc1, String loc2, String [] item1, String pet) {
		
		Connection conn = getConnection();
		
		int listCount = new CampDao().allCount(loc1, loc2, item1, pet, conn);
		
		close();
		
		return listCount;
		
	}
	
	
	
	
	
	
	
	// 전체 조회
	public ArrayList<Camp> selectCampList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Camp> list = new CampDao().selectCampList(pi, conn);
		
		close();
		
		return list;	
	}
	
	
	public ArrayList<Camp> selectCampList() {
		
		Connection conn = getConnection();
		
		ArrayList<Camp> list = new CampDao().selectCampList(conn);
		
		close();
		
		return list;	
	}
	
	
	
	// 지역 검색
	public ArrayList<Camp> cSelect(String loc1, String loc2, PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Camp> clist = new ArrayList<>();
		
		clist = new CampDao().cSelect(loc1, loc2, pi, conn);
		
		close();
		
		return clist;
		
	}
	
	
	// 체크박스 검색
	public ArrayList<Camp> cSelect(String [] item1, String pet, PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Camp> clist = new ArrayList<>();
		
		clist = new CampDao().cSelect(item1, pet, pi, conn);
		
		close();
		
		return clist;
		
	}
	
	
	// 검색 모두 사용
	public ArrayList<Camp> cSelect(String loc1, String loc2, String [] item1, String pet, PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Camp> clist = new ArrayList<>();
		
		clist = new CampDao().cSelect(loc1, loc2, item1, pet, pi, conn);
		
		close();
		
		return clist;
		
	}
	

}
