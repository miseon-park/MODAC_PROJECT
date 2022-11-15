package com.modac.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modac.notice.model.service.NoticeService;
import com.modac.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/updateNotice")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String noticeNo = request.getParameter("nno");
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		int noticeCategory = Integer.parseInt(request.getParameter("categoryNo"));
		
		Notice n = new Notice();
		
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setNoticeCategory(noticeCategory);
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/noticeDetail?nno=" + noticeNo);
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












