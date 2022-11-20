package com.modac.camp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modac.camp.model.service.CampService;
import com.modac.camp.model.vo.Camp;

/**
 * Servlet implementation class test
 */
@WebServlet("/test.ci")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loc1 = request.getParameter("loc1");
		String loc2 = request.getParameter("loc2");
		
		ArrayList <Camp> campSelect = new CampService().campSelect(loc1,loc2);
		System.out.println("test loc1 loc2 : " +loc1 + loc2);
		
		request.setAttribute("campSelect", campSelect);
		request.getRequestDispatcher("views/camp/campSearch.jsp").forward(request, response);
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
