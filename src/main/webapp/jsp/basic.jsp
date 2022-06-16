<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*"%>
<%-- 
	jsp작성내용은 servlet으로 변환되어 서비스된다.
	jsp를 수정한 경우, tomcat을 재시동할 필요가 없다.
	클라이언트 호출시 변경된 내용이 자동변환/컴파일 처리된다.
 --%>
<%
	//scriptlet
	System.out.println("Hello JSP!");
	System.out.println(12345);
	
	int sum = 0;
	for(int i = 1; i <= 100; i++){
		sum += i;
	}
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Basic</title>
<style>
table {
	border: 1px solid blakc;
	border-collapse: collapse;
	margin: 10px 0;
}

th, td {
	border: 1px solid black;
	padding: 3px
}
</style>
<script>
	window.onload = () => {
		let sum = 0;
		for(let i = 1; i <= 100; i++){
			sum += i;
		}
		
		document.querySelector("#client-sum").innerHTML = sum;
		
		document.querySelector("#client-millis").innerHTML = Date.now();
	}
</script>
</head>
<body>
	<h1>JSP Basic</h1>
	<%-- jsp주석 : servlet변환시 처리되지 않는다. -> 안보임(보안이 필요한 내용을 쓸 때) --%>
	<!-- html주석 : client까지 전달된다. -> 홈페이지에서도 보임 -->
	<h2>1부터 100까지의 합은 ?</h2>
	<ul>
		<li>Server : <span class="sum"><%= sum %></span></li>
		<li>Client : <span class="sum" id="client-sum"></span></li>
	</ul>

	<h2>Server | Client 시각 출력</h2>
	<ul>
		<%-- 블럭잡고 컨트롤 쉬프트 슬래쉬 --%>
		<%-- <li>Server : <span class="millis"><%= System.currentTimeMillis() %></span></li> --%>
		<li>Server : <span class="millis"> <% out.print(System.currentTimeMillis()); %>
		</span></li>
		<li>Client : <span class="millis" id="client-millis"></span></li>
	</ul>

	<h2>분기</h2>
	<%
	String lang = request.getParameter("lang");
	System.out.println("lang = " + lang);

	if("en".equals(lang)){
%>
	<p>Hello!</p>
	<%
	}
	else if("ko".equals(lang)){
%>
	<p>안녕하세요!</p>
	<%	
	}
%>
<%-- 
	<%
	if(lang != null){
	switch(lang){
	case "en":
%>
	<p>bye bye~</p>
	<%
		break;
	case "ko": 
%>
	<p>잘가요~</p>
	<%	
		break;
	}
%>
	}
 --%>
	<h2>반복처리</h2>
	<ul>
		<%
	List<String> names = Arrays.asList("홍길동", "신사임당", "이순신");
	for(String name : names){
%>
		<li><%= name %></li>
		<%
	}
%>
	</ul>

	<h2>@실습문제 - 주문</h2>
	<!-- 
		table
			tbody
				tr
					th 주문번호
					td ??
				tr
				tr
					th 상품명
					td ??
				tr
				tr
					th 옵션1
					td ??
				tr
	 -->
	<%
	 	int no = Integer.parseInt(request.getParameter("no"));
	 	String prod = request.getParameter("prod");
	 	String[] options = request.getParameterValues("option");
	 %>
	<table>
		<tbody>
			<tr>
				<th><p>주문번호</p></th>
				<td><%= no %></td>
			</tr>
			<tr>
				<th><p>상품명</p></th>
				<td><%= prod %></td>
			</tr>
			<%
				int cnt = 1;
				for(String option : options){
			%>
			<tr>
				<th>옵션<%= cnt %></th>
				<td><p><%= option %></p></td>
			</tr>
			<%
					cnt++;
				}
			%>
		</tbody>
	</table>



</body>
</html>