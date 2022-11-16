package com.modac.recipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.modac.recipe.model.dao.RecipeDao;
import com.modac.recipe.model.vo.Recipe;

import static com.modac.common.JDBCTemplate.*;

public class RecipeService {

	public ArrayList<Recipe> selectRecipeList(){
		
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn);
		
		close();
		
		return list;
		
	}
	

	public Recipe selectRecipe(int recipeNo) {
		
		Connection conn = getConnection();
		
		Recipe cr= new RecipeDao().selectCampReview(recipeNo, conn);
		
		close();
		
		return cr;
	}
	
	public int insertRecipe(Recipe r) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().insertRecipe(r,conn);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		
		return result;
	}
	
	public int updateRecipe(Recipe r) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().updateRecipe(r,conn);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		
		return result;
	}
	
	public int deleteRecipe(int RecipeNo) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().deleteRecipe(RecipeNo, conn);
		
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
