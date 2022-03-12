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
	<h2>회원정보 보기</h2>
<%
	//post방식으로 데이터가 넘어올때 한글이 깨질수 있기에
	request.setCharacterEncoding("UTF-8");

	//각종 사용자로부터 넘어온 데이터를 저장
	String id = request.getParameter("id");
	String pw1 = request.getParameter("pw1");
	String pw2 = request.getParameter("pw2");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	
	//배열 타입으로 리턴
	String[] hobby = request.getParameterValues("hobby");
	
	String job = request.getParameter("job");
	String age = request.getParameter("age");
	String info = request.getParameter("info");
	
	if(!pw1.equals(pw2)) {
%>
		<script type="text/javascript">
			alert("비밀번호가 틀립니다");
			history.go(-1);	//이전 페이지로 이동
		</script>
<%
	}
%>


<table width="500" border="1">
	<tr height="50">
		<td width="150" align="center">아이디</td>
		<td width="350" align="center"> <%=id %></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">이메일</td>
		<td width="350" align="center"> <%=email %></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">전화번호</td>
		<td width="350" align="center"> <%=tel %></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">관심분야</td>
		<td width="350" align="center">
			<%
				for(int i=0; i<hobby.length; i++) {
					out.write(hobby[i] + " ");
				}
			%>
		</td>
	</tr>
	<tr height="50">
		<td width="150" align="center">직업</td>
		<td width="350" align="center"> <%=job %></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">연령</td>
		<td width="350" align="center"> <%=age %></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">비고</td>
		<td width="350" align="center"> <%=info %></td>
	</tr>
</table>
	


</center>

</body>
</html>