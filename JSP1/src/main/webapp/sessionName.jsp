<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>세션 네임 페이지</h2>

<%
	//String name1 = request.getParameter("name");		//세션을 이용x
	
	String name1 = (String)session.getAttribute("name1");
%>

	<%=name1 %> 님 반갑습니다.

</body>
</html>