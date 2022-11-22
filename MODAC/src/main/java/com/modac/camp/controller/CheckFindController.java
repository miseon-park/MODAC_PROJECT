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
 * Servlet implementation class CheckFindController
 */
@WebServlet("/campSearch.ca")
public class CheckFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckFindController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 지역 검색
		String loc1 = request.getParameter("loc1");
		String loc2 = request.getParameter("loc2");
		
		// checkbox 검색
		String [] item1 = request.getParameterValues("item1");
		String pet = request.getParameter("pet");
		System.out.println(loc1 + loc2+ item1 + pet);
		ArrayList<Camp> clist = new ArrayList<>();
		
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
		
		if(loc1.equals("z") && item1 == null && pet == null) {
			
			ArrayList<Camp> list = new CampService().selectCampList();
			
			System.out.print(list);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/camp/campSearch.jsp").forward(request, response);
			
		} else {
			
			if(item1 == null && pet == null) {
				clist = new CampService().cSelect(loc1, loc2);
				System.out.println(clist);
			} else if(loc1.equals("z")) {
				clist = new CampService().cSelect(item1, pet);
				System.out.println(clist);
			} else {
				clist = new CampService().cSelect(loc1, loc2, item1, pet);
				System.out.println(item1);
			}
			
			System.out.println(loc1);
			System.out.println(loc2);
			
			request.setAttribute("clist", clist);
			request.getRequestDispatcher("views/camp/campCheckSearch.jsp").forward(request, response);
			
			
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
