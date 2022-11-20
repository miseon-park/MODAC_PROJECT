package com.modac.camp.controller;

import java.io.IOException;
import java.util.ArrayList;

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
		request.setCharacterEncoding("UTF-8");
		
		String loc1 = request.getParameter("loc1");
		String loc2 = request.getParameter("loc2");
		
		switch(loc1) {
		case "a" : loc1 = "강원도"; break;
		case "b" : loc1 = "경기도"; break;
		case "c" : loc1 = "경상남도"; break;
		case "d" : loc1 = "경상북도"; break;
		case "e" : loc1 = "전라남도"; break;
		case "f" : loc1 = "전라북도"; break;
		case "g" : loc1 = "충청남도"; break;
		case "h" : loc1 = "충청북도"; break;
		case "i" : loc1 = "제주도"; break;
		case "j" : loc1 = "광주시"; break;
		case "k" : loc1 = "서울시"; break;
		case "l" : loc1 = "세종시"; break;
		case "m" : loc1 = "대전시"; break;
		case "n" : loc1 = "인천시"; break;
		case "o" : loc1 = "대구시"; break;
		case "p" : loc1 = "울산시"; break;
		case "q" : loc1 = "부산시"; break;
		
		}
		System.out.println(loc1);
		System.out.println(loc2);
		
		ArrayList <Camp> campSelect = new CampService().campSelect(loc1,loc2);
		
		request.setAttribute("campSelect", campSelect);
		
		request.getRequestDispatcher("views/camp/test.jsp").forward(request, response);
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
