package com.modac.campinfo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.modac.campinfo.model.service.CampinfoService;
import com.modac.campinfo.model.vo.Campinfo;

/**
 * Servlet implementation class CampinfoLocationController
 */
@WebServlet("/option.ci")
public class CampinfoLocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CampinfoLocationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loc1 = request.getParameter("loc1");
		String loc2 = request.getParameter("loc2");
		
		ArrayList <Campinfo> list = new CampinfoService().searchList(loc1,loc2);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list , response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
