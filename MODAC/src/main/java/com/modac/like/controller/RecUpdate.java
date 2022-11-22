package com.modac.like.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.modac.like.model.dao.likeDao;
import com.modac.like.model.service.likeService;
import com.modac.like.model.vo.like;
import com.modac.member.model.service.MemberService;

/**
 * Servlet implementation class RecUpdate
 */
@WebServlet("/RecUpdate.do")
public class RecUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memberNo = request.getParameter("memberNo");
		String postNo = request.getParameter("postNo");
		
		like l = new like(memberNo, postNo);
		int result = new likeService().recUpdate(l);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "좋아요 성공했습니다.");
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("alertMsg", "실패");
			response.sendRedirect(request.getContextPath());
		}
		
		
		
		
//		likeDao manager = likeDao.getInstance();
//		// 동일 게시글에 대한 이전 추천 여부 검색
//		int result = manager.recCheck(m);
//		
//		if(result == 0){ // 추천하지 않았다면 추천 추가
//			manager.recUpdate(m);
//		}else{ // 추천을 하였다면 추천 삭제
//			manager.recDelete(m);
//		}
//		return null;
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
