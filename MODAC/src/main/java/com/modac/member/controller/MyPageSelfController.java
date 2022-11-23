package com.modac.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.modac.common.model.vo.PageInfo;
import com.modac.member.model.dao.MemberDao;

/**
 * Servlet implementation class MyPageSelfController
 */
@WebServlet("/myPageSelf.me")
public class MyPageSelfController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageSelfController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int listCount;// 현재 총 게시글 개수
		int currentPage;// 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit;// 페이지 하단에 보여질 페이징바의 페이지 최대 개수
		int boardLimit;//페이지에 보여질 게시글의 최대개수

		int maxPage; // 가장 마지막 페이지가 몇번째 페이지 인지( 총 페이지 수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage;// 페이지 하단에 보여질 페이징바의 끝 수





		currentPage = Integer.parseInt(request.getParameter("currentPage")==null ? "1" : request.getParameter("currentPage"));


		pageLimit = 10;


		boardLimit = 10;

	
		listCount = new MemberDao().selectListCount();

		maxPage = (int)Math.ceil((double)listCount/boardLimit);

		startPage = (currentPage - 1)/pageLimit *pageLimit+1;


		endPage = startPage+pageLimit -1;


		if(endPage>maxPage) {
			endPage=maxPage;
		}


		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		request.setAttribute("pi", pi);
		
		if(session.getAttribute("loginMember") == null) {// 로그인 안한상태
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다.");
			response.sendRedirect(request.getContextPath());
		}else {// 로그인 한상태
			request.getRequestDispatcher("views/member/myPageSelf.jsp").forward(request, response);
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
