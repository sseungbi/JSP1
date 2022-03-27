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
	//세션을 통하여 id를 읽어들임
	String id = (String) session.getAttribute("id");

	//로그인이 되어있지 않다면 session값 = null -> null처리
	if(id == null) {
		id = "guest";
	}
%>


<table width="800">
	<tr height="100">
		<!-- 로고 이미지 -->
		<td colspan="2" align="center" width="200">
			<img src="img/logo.jpg" width="200" height="70">
		</td>
		<td colspan="5" align="center">
			<font size="10"> 낭만 캠핑</font>
		</td>
	</tr>
	<tr height="50">
		<td width="100" align="center">텐트</td>
		<td width="100" align="center">의자</td>
		<td width="100" align="center">식기류</td>
		<td width="100" align="center">침낭</td>
		<td width="100" align="center">테이블</td>
		<td width="100" align="center">화롯대</td>
		<td width="200" align="center">
	<% if(id.equals("guest")) { %>
		<%=id %>님 
		<button onclick="location.href='sessionMain.jsp?center=sessionLoginForm.jsp'">로그인</button>
	<% } else { %>
		<%=id %>님 <button onclick="location.href='sessionLogout.jsp'">로그아웃</button>
	<%
		}
	%>
		</td>
		<td width="100" align="center"></td>
	</tr>
</table>

</body>
</html>