package com.modac.camStagram.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modac.camStagram.model.service.CamStagramService;
import com.modac.camStagram.model.vo.BoardLike;

/**
 * Servlet implementation class camStagramLikeController
 */
@WebServlet("/like.cs")
public class camStagramLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public camStagramLikeController() {
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

		System.out.println("con memberNo + postNo: " + memberNo + postNo);
		

		BoardLike bl = new BoardLike();
		bl.setPostNo(postNo);
		bl.setMemberNo(memberNo);
		
		int result = new CamStagramService().insertBoardLike(postNo, memberNo);
		
		System.out.println("con bl : " + bl);
		
		System.out.println("con result : " + result);
		
		request.setAttribute("bl", bl);
		
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
