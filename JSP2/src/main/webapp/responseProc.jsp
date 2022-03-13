<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이 페이지는 로그인 정보가 넘어오는 페이지 입니다.</h2>
	
	<%
		request.setCharacterEncoding("utf-8");	//한글처리
	
		String id = request.getParameter("id");	//request 객체에 담겨진 사용자 정보 중 id정보를 추출
		
		String phone = request.getParameter("phone");
		
		/* 
		response.sendRedirect("responseRedirect.jsp");	//흐름제어
		response.sendRedirect("responseRedirect.jsp?id="+id);	//이렇게 파라미터로 넘기면 데이터를 넘길 수 있음
		 */
	%>
	
	<!-- 같은 흐름제어 구문이어도 response를 사용하면 request객체를 못넘기지만 jsp:forward에서는 request객체를 넘길 수 있음 -->
	<jsp:forward page="responseRedirect.jsp">
		<jsp:param value="mmmm" name="id"/>
		<jsp:param value="12345" name="phone"/>
	</jsp:forward>	 <!-- 흐름제어 -->
	
	<!-- 결론적으로 실무에서는 세션을 사용하므로 그냥 알아두면 좋음 -->
	
	<h3><%=id %></h3>

</body>
</html>