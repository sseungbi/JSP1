<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- requestLogin에서 넘어온 아이다와 비밀번호를 읽어드림 -->

<%
	//사용자의 정보가 저장되어있는 객체 = request 객체
	//request.getParameter 메소드를 통해 정보를 추출
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
	</h2>
	당신의 아이디는 <%= id %>이고, 비밀번호는 <%= pw %> 입니다.
	<h2>
	
	<a href="requestForward.jsp">다음페이지

</body>
</html>