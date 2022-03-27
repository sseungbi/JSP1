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
	//center값을 변경해주기 위해서 request객체를 이용하여 center값을 받아옴
	String center = request.getParameter("center");

	//처음 sessionMain.jsp를 실행하면 center = null -> null 처리
	if(center == null) {
		center = "center.jsp";
	}

%>


<center>
	<table width="800" border="1">
		<!-- top -->
		<tr height="150">
			<td align="center" colspan="2">
				<jsp:include page="top.jsp" ></jsp:include>
			</td>
		</tr>
		
		<!-- left -->
		<tr height="400">
			<td align="center" width="200">
				<jsp:include page="left.jsp"></jsp:include>
			</td>
		
			<!-- center -->
			<td align="center" width="600">
				<jsp:include page="<%=center %>"></jsp:include>
			</td>
		</tr>
		
		<!-- bottom -->
		<tr height="100">
			<td align="center" colspan="2">
				<jsp:include page="bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</center>


</body>
</html>