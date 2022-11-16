package com.modac.recipe.model.dao;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.modac.recipe.model.vo.Recipe;

import static com.modac.common.JDBCTemplate.*;

public class RecipeDao {

	private Properties prop = new Properties();
	
	public RecipeDao() {
		String fileName = RecipeDao.class.getResource("/sql/recipe/recipe-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	 public ArrayList<Recipe> selectRecipeList(Connection conn){
		 
		 ArrayList<Recipe> list = new ArrayList<>();
		 
		 PreparedStatement psmt = null;
		 
		 ResultSet rset = null;
		 
		 String sql = prop.getProperty("selectRecipeList");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Recipe(rset.getString("POST_TITLE"),
										rset.getString("MEMBER_NIC"),
										rset.getDate("CREATE_DATE"),
										rset.getString("TIME"),
										rset.getString("DIFFICULTY"),
										rset.getString("MAININGRE")
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
	 
	 public Recipe selectCampReview(int recipeNo, Connection conn) {
		 
		 ResultSet rset = null;
		 
		 Recipe r = null;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("selectRecipe");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, recipeNo);
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				r = new Recipe( rset.getString("POST_TITLE"),
						             rset.getString("POST_CONTENT"),
						             rset.getString("MEMBER_NIC"),
						             rset.getDate("CREATE_DATE"),
						             rset.getString("TIME"),
						             rset.getString("DIFFICULTY"),
						             rset.getString("MAININGRE"),
						             rset.getString("SUBINGRE"),
						             rset.getString("TITLEIMG")
						            );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return r;
		 
	 }
	
	 public int insertRecipe(Recipe r, Connection conn) {
		 
		 int result = 0;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("insertRecipe");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, r.getPostTitle());
			psmt.setString(2, r.getPostContent());
			psmt.setString(3, r.getMemberNo());
			psmt.setString(4, r.getTime());
			psmt.setString(5, r.getDifficulty());
			psmt.setString(6, r.getMainIngre());
			psmt.setString(7, r.getSubIngre());

			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		 return result;
	 }
	
	 public int updateRecipe(Recipe r, Connection conn) {
		 
		 int result = 0;
		 
		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("updateRecipe");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, r.getPostTitle());
			psmt.setString(2, r.getPostContent());
			psmt.setString(3, r.getTime());
			psmt.setString(4, r.getDifficulty());
			psmt.setString(5, r.getMainIngre());
			psmt.setString(6, r.getSubIngre());
			psmt.setString(7, r.getPostNo());
			

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		 return result;
		 
	 }
	 
	 public int deleteRecipe(int RecipeNo, Connection conn) {
		 
		 int result = 0;

		 PreparedStatement psmt = null;
		 
		 String sql = prop.getProperty("deleteRecipe");
		 
		 try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, RecipeNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		return result;
		 
	 }
	
	
	
}
