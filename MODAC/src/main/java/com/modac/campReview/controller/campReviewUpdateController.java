package com.modac.campReview.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class campReviewUpdateController
 */
@WebServlet("/update.cr")
public class campReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campReviewUpdateController() {
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
			
			String postNo = multiRequest.getParameter("crno");
			String postTitle =  multiRequest.getParameter("title");
			String postContent =  multiRequest.getParameter("content");
			String titleImg = multiRequest.getParameter("titleImg");
			
			CampReview cr = new CampReview();
			cr.setPostNo(postNo);
			cr.setPostTitle(postTitle);
			cr.setPostContent(postContent);
			cr.setTitleImg(titleImg);
			////
		
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
				
				if(multiRequest.getParameter("originFileNo") != null) {
					// ?????? ????????? ?????? ??????
	                at.setPhotoNo(multiRequest.getParameter("originFileNo"));
	                new File(savePath+multiRequest.getParameter("originFileName")).delete();
	                at.setPostNo(postNo);
	          
	            }else {
	                // ????????? ????????? ?????? ??????
	                // => insert Attachment
	                // ref_bno + ?????? ????????? ?????? 
	                at.setPostNo(postNo);
	                at.setBoardNo("6");
	            }
			} 
			
			int result = new CampReviewService().updateCampReview(cr, at);

			if(result > 0) {
				request.getSession().setAttribute("alertMsg","??????????????? ?????????????????????.");
				response.sendRedirect(request.getContextPath()+"/detail.cr?crno="+postNo);
			}else {
				request.setAttribute("errorPage", "????????? ?????? ?????????????????????.");
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
