<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Arrays"%>
<%
	// jsp scriptlet - java영역
	// request, response 객체에 선언없이 접근 가능
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String animal = request.getParameter("animal");
	String[] foods = request.getParameterValues("food");
	
	System.out.println("name@jsp = " + name);
	System.out.println("color@jsp = " + color);
	System.out.println("animal@jsp = " + animal);
	System.out.println("food@jsp = " + (foods != null ? Arrays.toString(foods) : null));
	
	//setAttribute로 받아온 업무로직 데이터를 꺼내서 사용할 수 있음
	//오브젝트를 반환하기 때문에 다운캐스팅
	String recommendation = (String) request.getAttribute("recommendation");
	System.out.println("recommendation@jsp = " + recommendation);
%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<title>개인취향검사결과</title>
</head>
<body>
<h1>개인취향검사결과 <%= request.getMethod() %></h1>
<p>이름 : <%= name %></p> <%-- 출력식 --%>
<p>선호색상 : <%= color %></p>
<p>선호동물 : <%= animal %></p>
<p>선호중극음식 : <%= foods != null ? Arrays.toString(foods) : "없음" %></p>
<hr />
<h2><span><%= name %></span>님, 오늘은 <mark><%= recommendation %></mark> 어떠세요?</h2>
</body>
</html>
