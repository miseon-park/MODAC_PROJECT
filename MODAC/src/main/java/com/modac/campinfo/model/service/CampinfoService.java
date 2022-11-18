package com.modac.campinfo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.campinfo.model.dao.CampinfoDao;
import com.modac.campinfo.model.vo.Campinfo;
import com.modac.common.JDBCTemplate;

public class CampinfoService {
	
	public ArrayList <Campinfo> searchList(String loc1, String loc2){
        Connection conn = JDBCTemplate.getConnection();
        
        ArrayList<Campinfo> list = new CampinfoDao().searchList(conn, loc1, loc2);
        
        JDBCTemplate.close();
        
        return list;
	}

}
