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
%>

<center>
	<h2>회원정보 삭제</h2>
	
	<table width="400" border="1">
		<form action="memberDeleteProc.jsp" method="post">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=request.getParameter("id") %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">비밀번호</td>
				<td width="250"><input type="password" name="pw1"></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
					<input type="submit" value="회원 삭제"> &nbsp;&nbsp;
		</form>
					<button onclick="location.href='memberList.jsp'">회원 전체 보기</button>
				</td>
			</tr>
	</table>
</center>

</body>
</html>