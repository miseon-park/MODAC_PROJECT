package com.modac.circle.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modac.circle.model.service.CircleBoardService;
import com.modac.circle.model.vo.Circle;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class CircleUpdateController
 */
@WebServlet("/cupdate.bo")
public class CircleUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CircleUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String postNo = request.getParameter("bno");
		
		String postTitle = request.getParameter("title");
		String postContent = request.getParameter("content");
		
		Circle c = new Circle();
		c.setPostNo(postNo);
		c.setPostTitle(postTitle);
		c.setPostContent(postContent);
		//모두 하나의 트랜잭션으로 처리하기.
		int result = new CircleBoardService().updateBoard(c);
		// case1 : 새로운 첨부파일이 없는경우(x) => b, null =>Board Update만 실행
		//case2 : 새로운 첨부파일이 있는경우(o), 기존 첨부파일도 있는경우(o) => b, at에 fileNo => Board Update, Attachment update 두번실행
		//case3 : 새로운 첨부파일 있는경우(o), 기존 첨부파일은 없는경우(x) => b, at에 refNo = >Board update, Attachment Insert
		
		if(result >0) { // 수정성공=>상세조회 페이지
			request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath()+"/cdetail.bo?bno="+postNo);
		}else {//수정실패 => errorPage
			request.setAttribute("errorMsg", "게시글 수정에 실패했습니다.");
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
