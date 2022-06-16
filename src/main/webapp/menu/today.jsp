<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	window.onload = () => {
		function f(n){
            // return n <10 ? "0"+ n : n;
            return n.toString().padStart(2,"0");
        };
		const now = new Date();
		const yyyy = now.getFullYear();
		const MM = f(now.getMonth()+1);
        const dd = f(now.getDate());
        
        const days = ['일', '월', '화', '수', '목', '금', '토'];
        const day = days[now.getDay()];

		const today = yyyy+"년 "+ MM+"월 "+dd+"일 "+day+"요일";
		document.querySelector('#today').innerHTML = today;
	
		
	};
</script>