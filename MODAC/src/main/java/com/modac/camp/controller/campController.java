package com.modac.camp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.modac.camp.model.vo.Camp;

/**
 * Servlet implementation class campController
 */
@WebServlet("/option.ci")
public class campController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String loc1 = request.getParameter("loc1");
//		String loc2 = request.getParameter("loc2");
//		
//		ArrayList <Camp> list = new CampService().searchList(loc1,loc2);
		
		ArrayList <Camp> list = new ArrayList<>();
		
		list.add(new Camp("서울시", "관악구"));
		list.add(new Camp("서울시", "인헌동"));
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(list , response.getWriter());
		
		System.out.println(list);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
