package com.modac.campReview.model.dao;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.modac.campReview.model.vo.CampReview;
import com.modac.campReview.model.vo.ReviewTag;
import com.modac.common.model.vo.Attachment;
import com.modac.common.model.vo.PageInfo;
import java.util.List;

import static com.modac.common.JDBCTemplate.*;

public class CampReviewDao {

	private Properties prop = new Properties();
	
	public CampReviewDao() {
		String fileName = CampReviewDao.class.getResource("/sql/campReview/campReview-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		 PreparedStatement psmt = null;
		 ResultSet rset = null;
		 String sql = prop.getProperty("selectListCount");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt. executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		 return listCount;
		 
	}
	
	
	 public ArrayList<CampReview> selectCampReviewList(Connection conn, PageInfo pi){
		 
		 ArrayList<CampReview> list = new ArrayList<>();
		 
		 PreparedStatement psmt = null;
		 
		 ResultSet rset = null;
		 
		 String sql = prop.getProperty("selectCampRevieList");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			psmt.setInt(1,  startRow);
			psmt.setInt(2, endRow);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new CampReview(rset.getString("POST_NO"),
										rset.getString("POST_TITLE"),
										rset.getString("MEMBER_NIC"),
										rset.getDate("CREATE_DATE"),
										rset.getInt("READ_COUNT")        
										));
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return list;
	 };
	 
	 public int increaseCount(int campReviewNo, Connection conn) {
		 
		 int result = 0;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("increaseCount");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, campReviewNo);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result;
	 }
	 
	 public CampReview selectCampReview(int postNo, Connection conn) {
		 
		 ResultSet rset = null;
		 
		 CampReview cr = null;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("selectCampReview");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, postNo);
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				cr = new CampReview( rset.getString("POST_NO"),
									 rset.getString("POST_TITLE"),
						             rset.getString("POST_CONTENT"),
						             rset.getString("MEMBER_NIC"),
						             rset.getDate("CREATE_DATE")
						            );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return cr;
		 
	 }
	 
	 public ReviewTag selectReviewTag(int campReviewNo, Connection conn) {
		 
		 ResultSet rset = null;
		 
		 ReviewTag rc = null;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("selectReviewTag");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, campReviewNo);
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				rc = new ReviewTag( rset.getString("POST_NO"),
									 rset.getString("TAG_NO")
						            );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return rc;
		 
	 }
	 
	 public Attachment selectAttachment(int postNo, Connection conn) {
		 
		 Attachment at = null;
		
		 PreparedStatement psmt = null;
		 
		 ResultSet rset = null;

		 String sql = prop.getProperty("selectAttachment");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, postNo);
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				
				at.setPhotoNo(rset.getString("PHOTO_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setNewName(rset.getString("NEW_NAME"));
				at.setPath(rset.getString("PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		 
		return at;
		 
	 }
	
	 public int insertCampReview(CampReview cr, Connection conn) {
		 
		 int result = 0;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("insertCampReview");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cr.getPostNo());
			psmt.setString(2, cr.getPostTitle());
			psmt.setString(3, cr.getPostContent());
			psmt.setString(4, cr.getMemberNo());

			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		 return result;
	 }
	 
	 public int insertTag(CampReview cr, Connection conn) {
			
		 int result = 0;
		 
		 PreparedStatement psmt = null;
		 List<Integer> tList=cr.getTagList();
		 String sql = prop.getProperty("insertTag");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, cr.getPostNo());
			
			for(Integer tagNo:tList) {
				psmt.setInt(2, tagNo.intValue());
			result += psmt.executeUpdate();}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		 return result;
	 }
	 
	 public int insertAttachment(Attachment at, Connection conn) {
			
		 int result = 0;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("insertAttachment");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, at.getPostNo());
			psmt.setString(2, at.getOriginName());
			psmt.setString(3, at.getNewName());
			psmt.setString(4, at.getPath());

			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		 return result;
	 }
	 
	 public int insertNewAttachment(Attachment at, Connection conn) {
			
		 int result = 0;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("insertNewAttachment");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, at.getPostNo());
			psmt.setString(2, at.getOriginName());
			psmt.setString(3, at.getNewName());
			psmt.setString(4, at.getPath());

			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		 return result;
	 }
	
	 public int updateCampReview(CampReview cr, Connection conn) {
		 
		 int result = 0;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("updateCampReview");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cr.getPostTitle());
			psmt.setString(2, cr.getPostContent());
			psmt.setString(3, cr.getPostNo());
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		 
		 return result;
		 
	 }
	 
	 public int updateAttachment(Attachment at, Connection conn) {
			
		 int result = 0;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("updateAttachment");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, at.getOriginName());
			psmt.setString(2, at.getNewName());
			psmt.setString(3, at.getPath());
			psmt.setString(4, at.getPostNo());

			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		 return result;
	 }
	 
	 public int deleteCampReview(int postNo, Connection conn) {
		 
		 int result = 0;

		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("deleteCampReview");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, postNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		return result;
		 
	 }
	 
	 public void deleteAttachment(int RecipeNo, Connection conn) {

		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("deleteAttachment");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, RecipeNo);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		 
	 }

	public int selectPostNo(Connection conn) {
		// TODO Auto-generated method stub
		 int result = 0;

		 PreparedStatement psmt = null;
		 
		 String sql = "SELECT SEQ_REVNO.NEXTVAL as nv FROM DUAL";
		 ResultSet rset = null;
		 
		 try {
			psmt = conn.prepareStatement(sql);
						
			rset=psmt.executeQuery();
			if(rset.next()) {
				result=rset.getInt("nv");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return result;
		
	}
	
	
	
}