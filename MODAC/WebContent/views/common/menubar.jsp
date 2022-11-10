<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.modac.member.model.vo.Member"%>
<%
    String contextPath = request.getContextPath();

	Member loginMember = (Member) session.getAttribute("loginMember");
	//로그인전 or 로그인 실패시 : null
	//로그인 성공후 : 로그인한 회원의 정보가 담긴 member객체
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	//서비스 요청전 : null
	//서비스 요청성공후 : alert로 띄워줄 메시지 문구.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>