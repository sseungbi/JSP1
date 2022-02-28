<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	에러가 안나면 이 글이 보이나?

<%
	int sum = 10/0;	//에러 코드 작성 -> errorPage의 내용이 보임
%>


</body>
</html>