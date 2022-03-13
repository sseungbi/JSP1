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
	<table width="800" border="1">
		<!-- top -->
		<tr height="150">
			<td align="center" colspan="2">
				<%-- <%@ include file="top.jsp" %> --%>
				
				<!-- 위에 코드처럼 쓰면 밑에 코드처럼 파라미터를 넘겨줄 수 없음 -->
				<jsp:include page="top.jsp">
					<jsp:param value="aaa" name="id"/>
				</jsp:include>
			</td>
		</tr>
		
		<!-- left -->
		<tr height="400">
			<td align="center" width="200">
				<jsp:include page="left.jsp"></jsp:include>
			</td>
		
			<!-- center -->
			<td align="center" width="600">
				<jsp:include page="center.jsp"></jsp:include>
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