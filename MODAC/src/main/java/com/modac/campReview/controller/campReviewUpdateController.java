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
 * Servlet implementation class campReviewUpdateController
 */
@WebServlet("/update.cr")
public class campReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// server6 05:09:00 참조, 로그인 되어있고 본인 게시물일때 가능하게 해야함. 
		
		request.setCharacterEncoding("UTF-8");
		
		String postNo = request.getParameter("crno");
		String postTitle =  request.getParameter("title");
		String postContent =  request.getParameter("content");

		CampReview cr = new CampReview();
		cr.setPostNo(postNo);
		cr.setPostTitle(postTitle);
		cr.setPostContent(postContent);
		
		int result = new CampReviewService().updateCampReview(cr);
		System.out.println(result);
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
