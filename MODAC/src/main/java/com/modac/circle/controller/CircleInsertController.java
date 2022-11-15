package com.modac.circle.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modac.circle.model.service.CircleBoardService;
import com.modac.circle.model.vo.Circle;

/**
 * Servlet implementation class CircleInsertController
 */
@WebServlet("/cinsert.bo")
public class CircleInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CircleInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postContent = request.getParameter("content");
		String postTitle = request.getParameter("title");
		String memberNo = request.getParameter("memberNo");
		
		
		Circle c = new Circle();
		c.setPostContent(postContent);
		c.setPostTitle(postTitle);
		c.setMemberNo(memberNo);
		
		int result = new CircleBoardService().insertBoard(c);
		
		if(result>0){// 성공=>list.bo?currentPage=1
			request.getSession().setAttribute("alertMsg", "게시글 작성 성공!");
			response.sendRedirect(request.getContextPath()+"/clist.bo");
		}else {//실패시 => 첨부파일 있었을경우 이미 업로드된 첨부파일을 서버에 보관할 이유가 없다(용량만 차지)
			
			
			request.setAttribute("errorMsg", "게시글 작성 실패");
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
