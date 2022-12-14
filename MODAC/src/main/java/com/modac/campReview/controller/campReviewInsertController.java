package com.modac.campReview.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.modac.campReview.model.service.CampReviewService;
import com.modac.campReview.model.vo.CampReview;
import com.modac.campReview.model.vo.MyFileRenamePolicy;
import com.modac.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class campReviewInsertController
 */
@WebServlet("/insert.cr")
public class campReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/campReview_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
					
			String memberNo = multiRequest.getParameter("memberNo");
			String postTitle = multiRequest.getParameter("title");
			String postContent = multiRequest.getParameter("content");
			
			CampReview cr = new CampReview();
			cr.setPostTitle(postTitle);
			cr.setPostContent(postContent);
			cr.setMemberNo(memberNo);

			String[] tagNo = multiRequest.getParameterValues("tag"); 

			ArrayList<Integer> tagList = new ArrayList<>();
				if(tagNo != null) {
					for(int i=0; i<tagNo.length; i++){
					    tagList.add(Integer.parseInt(tagNo[i]));
					}
					cr.setTagList(tagList);
				}
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));// ?????????
				at.setNewName(multiRequest.getFilesystemName("upfile"));//?????????(?????? ????????? ????????????????????? ?????????)
				at.setPath("resources/campReview_upfiles/");
			}
		int result = new CampReviewService().insertCampReview(cr, at);
		
		System.out.println(result);

		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "????????? ?????? ??????!");
			response.sendRedirect(request.getContextPath()+"/list.cr");
		
		}else { //????????? => ???????????? ??????????????? ?????? ???????????? ??????????????? ????????? ????????? ????????? ??????(???????????????)
			if(at != null) {
				// ?????????????????? ?????? ???????????? ?????? -> delete????????? ??????
				new File(savePath+at.getNewName()).delete();
			}
			
			request.setAttribute("errorMsg","????????? ?????? ??????");
			request.getRequestDispatcher("views/common/errorPage3.jsp").forward(request, response);
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
