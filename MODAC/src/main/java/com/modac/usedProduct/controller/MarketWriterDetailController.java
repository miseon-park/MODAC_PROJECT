package com.modac.usedProduct.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modac.usedProduct.model.service.MarketService;
import com.modac.usedProduct.model.vo.Attachment;
import com.modac.usedProduct.model.vo.Market;

/**
 * Servlet implementation class MarketWriterDetailController
 */
@WebServlet("/detailWt.mk") 
//안씀
public class MarketWriterDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarketWriterDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//클릭시 글번호
		String postNo = request.getParameter("mno"); 

		int result = new MarketService().increaseCount(postNo);
		
		if(result > 0) { //성공했을 경우 => 게시글,첨부파일 조회 => 상세조회
			Market m = new MarketService().selectMarket(postNo); //게시글 조회
			ArrayList<Attachment> list = new MarketService().selectAttachment(postNo); //첨부파일 조회
			request.setAttribute("m", m);
			request.setAttribute("list", list);
			
			//마켓 상세페이지-이용자
			request.getRequestDispatcher("/views/usedProduct/marketWriterDetailForm.jsp").forward(request, response);
			
			
		}else { //실패시 에러페이지
			request.setAttribute("errorMsg", "게시글 조회 실패");
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
