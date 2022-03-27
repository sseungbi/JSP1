<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	//아이디 저장 체크 박스가 체크되었는지 판단여부
	String id = request.getParameter("id");
	String save = request.getParameter("save");

	//체크되었는지 판단
	if(save != null ){  //아이디 저장이 눌렸다면
		//쿠키를 사용하려면 쿠키 클래스 생성
		Cookie cookie = new Cookie("id", id);	//첫번째 스트링에는 key 값, 두번째 스트링에는 해당 value 값
		
		//쿠키 유효시간 설정
		cookie.setMaxAge(60*1);	//1분 후 만료
		
		//사용자에게 쿠키값 넘겨줌
		response.addCookie(cookie);
		
		out.write("쿠키 생성 완료");
	} 
	
%>

</body>
</html>