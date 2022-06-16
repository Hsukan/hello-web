package com.kh.menu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/menu.do")
public class menuOrderServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1. 인코딩 처리(POST는 필수)
		request.setCharacterEncoding("utf-8");
		
		//2. 사용자 입력값 처리
		String mainMenu = request.getParameter("mainMenu");
		String sideMenu = request.getParameter("sideMenu");
		String drinkMenu = request.getParameter("drinkMenu");
		
//		System.out.println("main = " + mainMenu);
//		System.out.println("side = " + sideMenu);
//		System.out.println("drink = " + drinkMenu);
		
		//3. 업무로직
		int price = 0;
		switch(mainMenu){
		case "한우버거": price += 5000; break;
		case "밥버거": price += 4500; break;
		case "치즈버거": price += 4000; break;
		}
		switch(sideMenu){
		case "감자튀김": price += 1500; break;
		case "어니언링": price += 1700; break;
		}
		switch(drinkMenu){
		case "사이다": price += 1000; break;
		case "콜라": price += 1000; break;
		case "커피": price += 1500; break;
		case "밀크쉐이크": price += 2500; break;
		}
		
		//4. 응답메세지
		request.setAttribute("price", price);
		
		RequestDispatcher reqDispatcher = 
				request.getRequestDispatcher("/menu/menuEnd.jsp");//src/main/webapp
		reqDispatcher.forward(request, response);
	}
}
