<%@page import="model.memberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");		//한글처리
	
	//취미 부분은 별도로 받아드려 다시 빈 클래스에 저장해야함
	String[] hobby = request.getParameterValues("hobby");
	//배열의 있는 내용을 하나의 스트링으로 저장
	String textHobby = "";
	
	for(int i=0; i<hobby.length; i++) {
		textHobby += hobby[i] + " ";
	}
%>
	<!-- useBean을 이용하여 한꺼번에 데이터를 받아옴 -->
	<jsp:useBean id="mbean" class="model.memberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>
	
<%
	//기존 취미는 배열이라 주소번지가 맵핑되기때문에 위 코드에서 하나의 스트링으로 저장한 변수를 다시 입력해줘야함
	mbean.setHobby(textHobby);		

	
	//데이터베이스 클래스 객체 생성
	memberDAO mDao = new memberDAO();
	mDao.insertMember(mbean);
	
	//회원가입이 되었다면 회원 정보를 보여주는 페이지로 이동
	response.sendRedirect("memberList.jsp");
%>

	

</body>
</html>