<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>세션 연습</h2>
<%

	String name = "shin";

	//세션을 이용하여 데이터를 유지 시키고 싶을때
	session.setAttribute("name1", name);
	
	//세션유지시간
	session.setMaxInactiveInterval(10);	//10초간 세션 유지

%>

	<!-- 세션을 이용하지 않을때 -->
	<a href="sessionName.jsp?name=<%=name%>">세션이용x</a>
	
	<!-- 세션 이용 시 -->
	<a href="sessionName.jsp">세션이용o</a>

</body>
</html>