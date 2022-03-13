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
	<form action="responseProc.jsp">
		<table width="400" border="1">
			<tr heigt="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><input type="text" name="id"></td>
			</tr>
			<tr heigt="50">
				<td align="center" width="150">비밀번호</td>
				<td width="250"><input type="text" name="pw"></td>
			</tr>
			
			<tr heigt="50">
				<td align="center" colspan="2">
					<input type="submit" value="로그인"> &nbsp;&nbsp;
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</center>

</body>
</html>