package com.modac.recipe.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modac.recipe.model.service.RecipeService;
import com.modac.recipe.model.vo.Recipe;

/**
 * Servlet implementation class campReviewUpdateController
 */
@WebServlet("/update.r")
public class recipeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public recipeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// server6 05:09:00 참조, 로그인 되어있고 본인 게시물일때 가능하게 해야함. 
		
		request.setCharacterEncoding("UTF-8");
		
		String postNo = request.getParameter("rno");
		String postTitle =  request.getParameter("title");
		String postContent =  request.getParameter("content");
		String time = request.getParameter("time");
		String difficulty = request.getParameter("difficulty");
		String mainIngre = request.getParameter("mainIngre");
		String subIngre = request.getParameter("subIngre");
		String titleImg = request.getParameter("titleImg");
		

		Recipe r = new Recipe();
		r.setPostNo(postNo);
		r.setPostTitle(postTitle);
		r.setPostContent(postContent);
		r.setTime(time);
		r.setDifficulty(difficulty);
		r.setMainIngre(mainIngre);
		r.setSubIngre(subIngre);
		r.setTitleImg(titleImg);
		
		int result = new RecipeService().updateRecipe(r);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg","성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath()+"/detail.cr?crno="+postNo);
		}else {
			request.setAttribute("errorPage", "작성글 수정 실패하였습니다.");
			request.getRequestDispatcher("views/common.errorPage.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
