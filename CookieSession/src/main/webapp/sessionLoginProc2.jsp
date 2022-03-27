<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<center>
	<h2> 세션 로그인 처리 2</h2>
<%
	//세션을 이용하여 데이터를 불러옴
	String id = session.getAttribute("id").toString();
	String pw = session.getAttribute("pw").toString();
%>

	<h2>당신의 아이디는 <%=id %> &nbsp; 당신의 비밀번호는 <%=pw %></h2>
	

</center>

</body>
</html>