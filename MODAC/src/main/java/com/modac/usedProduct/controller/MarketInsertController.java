package com.modac.usedProduct.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.modac.common.MyFileRenamePolicy;
import com.modac.member.model.vo.Member;
import com.modac.usedProduct.model.service.MarketService;
import com.modac.usedProduct.model.vo.Attachment;
import com.modac.usedProduct.model.vo.Market;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MarketInsertController
 */
@WebServlet("/insert.mk")
public class MarketInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarketInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//ImageIcon modacLogo = new ImageIcon("resources/modacLogo/logo.png");
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//첨부파일 용량
			int maxSize = 20 * 1024 * 1024;
			
			//첨부파일 저장 경로
			String savePath = request.getServletContext().getRealPath("/resources/market_upfiles/");
			
			//전달된 파일명 수정 작업 후 서버에 업로드
			MultipartRequest multirequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", 
					new MyFileRenamePolicy());
			
			//db 저장
			Market m = new Market();
			
			String memberNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
			String postTitle = multirequest.getParameter("title");
			String postContent = multirequest.getParameter("content");
			
			m.setPostTitle(postTitle);
			m.setPostContent(postContent);
			m.setMemberNo(memberNo);
			
			
			//첨부파일 저장
			ArrayList<Attachment> list = new ArrayList<>();
			Attachment at = new Attachment();
			
			String titleImg = multirequest.getParameter("titleImg");
			
			
			for(int i = 1; i <= 4; i++) {
				String key = "file" + i;
				
				if(multirequest.getOriginalFileName(key) != null) { //첨부파일이 있을 경우
					
					at.setOriginName(multirequest.getOriginalFileName(key));
					at.setNewName(multirequest.getFilesystemName(key));
					at.setPath("/resources/market_upfiles/");
					at.setFileLevel(i);
					
					list.add(at);	
				} 
			}
			
			if(list.isEmpty()) {
				titleImg = "";
			}
			
			request.setAttribute("titleImg", titleImg);
			
			int result = new MarketService().insertMarketPost(m , list);
			System.out.println(list);
			
			if( result > 0) { //성공 : list.th 재요청
				request.getSession().setAttribute("alertMsg", "성공적으로 업로드 되었습니다.");
				response.sendRedirect(request.getContextPath()+"/list.mk");
			}else { //실패 => 에러페이지
				request.setAttribute("errorMsg", "업로드 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
