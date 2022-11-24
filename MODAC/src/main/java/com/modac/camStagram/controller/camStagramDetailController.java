package com.modac.camStagram.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modac.camStagram.model.service.CamStagramService;
import com.modac.camStagram.model.vo.CamStagram;
import com.modac.common.model.vo.Attachment;

/**
 * Servlet implementation class campReviewDetailController
 */
@WebServlet("/detail.cs")
public class camStagramDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public camStagramDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int postNo = Integer.parseInt(request.getParameter("csno"));
	
	int result = new CamStagramService().increaseCount(postNo);
	
	if(result > 0 ) { // 성공, 상세조회 페이지 
		CamStagram cs = new CamStagramService().selectCamStagram(postNo);
		Attachment at = new CamStagramService().selectAttachment(postNo);
		
		request.setAttribute("cs", cs);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/camStagram/camStagramDetailView.jsp").forward(request, response);
		
	}else { // 실패, 에러페이지 
		request.setAttribute("errorMsg", "게시글 조회 실패");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
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
