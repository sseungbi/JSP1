<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>ResponseRedirect 페이지</h2>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		
	%>
	
	<h3><%=id %> <br> <%=phone %></h3>

</body>
</html>