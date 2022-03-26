<%@page import="model.memberBean"%>
<%@page import="java.util.Vector"%>
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

	<!-- 1. 데이터베이스에서 모든 회원의 정보를 가져오기
		 2. 테이블 태그를이용해서 화면에 회원들의 정보를 출력 -->
		 
<%
	memberDAO mdao = new memberDAO();

	//회원들의 정보가 얼마나 저장되어있는지 모르기에 가변길이인 Vector를 이용하여 데이터를 저장
	Vector<memberBean> v = mdao.allSelectMember();
%>

<center>
	<h2>모든 회원 보기</h2>
	
	<table width="800" border="1">
		<tr height="50">
			<td align="center" width="150">아이디</td>
			<td align="center" width="250">이메일</td>
			<td align="center" width="200">전화번호</td>
			<td align="center" width="200">취미</td>
		</tr>
		
		<%
			for(int i=0; i<v.size(); i++) {
				memberBean mbean = v.get(i);	//벡터에 담긴 빈클래스를 하나씩 추출
		%>
			<tr height="50">
				<td align="center" width="150">
					<a href="memberInfo.jsp?id=<%=mbean.getId()%>">
						<%=mbean.getId() %>
					</a>
				</td>
				<td align="center" width="250"><%=mbean.getEmail() %></td>
				<td align="center" width="200"><%=mbean.getTel() %></td>
				<td align="center" width="200"><%=mbean.getHobby() %></td>
			</tr>
		<%		
			}
		%>
		
	</table>
</center>
</body>
</html>