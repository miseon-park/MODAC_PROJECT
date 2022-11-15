package com.modac.campReview.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modac.campReview.model.service.CampReviewService;
import com.modac.campReview.model.vo.CampReview;

/**
 * Servlet implementation class campReviewInsertController
 */
@WebServlet("/insert.cr")
public class campReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberNo = request.getParameter("memberNo");
		String postTitle = request.getParameter("title");
		String postContent = request.getParameter("content");
		
		CampReview cr = new CampReview();
		cr.setPostTitle(postTitle);
		cr.setPostContent(postContent);
		cr.setMemberNo(memberNo);
		
		int result = new CampReviewService().insertCampReview(cr);
		
		if(result > 0) { // 성공시 => list.cr로 리다이랙트 
			request.getSession().setAttribute("alertMsg", "성공적으로 글이 등록되었습니다. ");
			response.sendRedirect(request.getContextPath()+"/list.cr");
		} else {
			request.setAttribute("errorMsg", "글 등록에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
