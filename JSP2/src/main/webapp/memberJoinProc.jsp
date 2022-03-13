<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
	<h2> 회원정보 보기</h2>

	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
	<!-- request로 넘어온 데이터를 자바 빈즈랑 맵핑 시켜주는 useBean -->
	<jsp:useBean id="mBean" class="bean.memberBean">	<!-- 객체생성 memberBean mBean = new memberBean() -->
		<!-- JSP 내용을 자바빈 클래스(memberBean)에 데이터를 맵핑 -->
		<jsp:setProperty name="mBean" property="*"></jsp:setProperty>	<!-- 모든 변수 맵핑 -->
	</jsp:useBean>
	
	<h2>당신의 아이디는 <jsp:getProperty property="id" name="mBean"></jsp:getProperty></h2>
	<h2>당신의 비밀번호는 <jsp:getProperty property="pw1" name="mBean"></jsp:getProperty></h2>
	<h2>당신의 이메일은 <jsp:getProperty property="email" name="mBean"></jsp:getProperty></h2>
	
	<h2>당신의 전화번호는 <%=mBean.getTel() %></h2>
	
</center>

</body>
</html>