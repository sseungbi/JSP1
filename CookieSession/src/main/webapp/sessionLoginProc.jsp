<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<center>
	<h2> 세션 로그인 처리 1</h2>
<%
	request.setCharacterEncoding("UTF-8");
	
	//사용자로부터 데이터를 읽음
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//아이디와 패스워드를 저장
	session.setAttribute("id", id);
	session.setAttribute("pw", pw);
	
	//세션의 유지시간 설정
	session.setMaxInactiveInterval(60 *2);	//60 * ? 초간 유지
			
	response.sendRedirect("sessionMain.jsp");
%>


</center>

</body>
</html>