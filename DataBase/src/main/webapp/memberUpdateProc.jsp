<%@page import="model.memberDAO"%>
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
	request.setCharacterEncoding("UTF-8");
%>

	<jsp:useBean id="mbean" class="model.memberBean">
		<jsp:setProperty name="mbean" property="*"></jsp:setProperty>
	</jsp:useBean>
	
<%
	memberDAO mdao = new memberDAO();
	//스트링 타입으로 저장되어있는 패스워드를 가져옴 - 데이터베이스에서 가져옴
	String pw = mdao.getPw(mbean.getId());
	
	//수정하기 위해 작성한 패스워드 값과 기존 데이터베이스의 패스워드 값을 비교
	if(mbean.getPw1().equals(pw)) {
		//memberDao클래스의 회원수정 메소드를 호출
		mdao.updateMember(mbean);
		response.sendRedirect("memberList.jsp");
	} else {
%>
		
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다. 다시 확인해주세요");
			history.go(-1);
		</script>
<%
	
	}
	
%>

</body>
</html>