<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- response.sendRedirec가 실행되면서 버퍼에 들어있던 h2태그 내용은 사라지고 파라미터로 넘긴 id값만 넘어가게됨 -->
	<h2> 로그인 처리 페이지 </h2>		

	<%
		request.setCharacterEncoding("UTF-8");
	
		//임의적으로 ID와 PW 설정
		String dbId = "aaaa";
		String dbPw = "1234";
		
		//사용자로부터 넘어온 입력 데이터를 받아옴
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(dbId.equals(id) && dbPw.equals(pw)) {
			//아이디와 비밀번호가 일치하니까 메인페이지를 보여줘야함
			response.sendRedirect("responseMain.jsp?id="+id);
		} else {
	%>
			<script>
				alert("아이디와 비밀번호가 일치하지 않습니다.");
				history.go(-1);
			</script>
	<%
		
		}
		
	%>

</body>
</html>