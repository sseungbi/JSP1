<%@page import="model.memberBean"%>
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
	String id = request.getParameter("id");

	memberDAO mdao = new memberDAO();
	memberBean mbean = mdao.oneSelectMember(id);	//해당하는 id의 회원정보를 받아와 리턴
%>

<center>
	<h2>회원정보 수정</h2>
	
	<table width="400" border="1">
		<form action="memberUpdateProc.jsp" method="post">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=mbean.getId() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td width="250"><input type="text" name="email" value="<%=mbean.getEmail()%>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">전화번호</td>
				<td width="250"><input type="text" name="tel" value="<%=mbean.getTel()%>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">비밀번호</td>
				<td width="250"><input type="password" name="pw1"></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%=mbean.getId() %>">
					<input type="submit" value="회원 수정"> &nbsp;&nbsp;
		</form>
					<button onclick="location.href='memberList.jsp'">회원 전체 보기</button>
				</td>
			</tr>
	</table>
</center>
		
</body>
</html>