<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>


<center>
	<h2>세션 로그인</h2>
	<form action="sessionLoginProc.jsp" method="post">
		<table width="400" border="1">
			<tr height="50">
				<td width="150">아이디</td>
				<td width="250"><input type="text" name="id"></td>
			</tr>
			<tr height="50">
				<td width="150">비밀번호</td>
				<td width="250"><input type="password" name="pw"></td>
			</tr>
			<tr height="50">
				<td colspan="2" align="center"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</center>

</body>
</html>