package com.modac.noticeTip.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modac.common.model.vo.Attachment;
import com.modac.common.model.vo.PageInfo;
import com.modac.notice.model.service.NoticeService;
import com.modac.notice.model.vo.Notice;
import com.modac.noticeTip.model.service.NoticeTipService;
import com.modac.noticeTip.model.vo.NoticeTip;

/**
 * Servlet implementation class NoticeTipListController
 */
@WebServlet("/campTipList")
public class NoticeTipListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeTipListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");

		String field = "POST_TITLE";
		if (field_ != null)
			field = field_;

		String query = "";
		if (query_ != null)
			query = query_;
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new NoticeTipService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		pageLimit = 5;
		boardLimit = 6;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		endPage = startPage + pageLimit -1;
		
	
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		String url =  request.getParameter("link");
		String postNo = request.getParameter("postNo");
		
		ArrayList<NoticeTip> ntlist = new NoticeTipService().selectNoticeTipList(pi, field, query);
		
		request.setAttribute("ntlist", ntlist);
		request.setAttribute("pi", pi); 
		
		request.getRequestDispatcher("views/noticeTip/campTip.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
