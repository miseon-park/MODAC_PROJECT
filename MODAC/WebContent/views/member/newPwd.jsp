<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%= contextPath%>/findupdatePw.me" method="post" >
	<div>
		<input type="hidden" value="${memberId }" name="memberId"/>
		<input type="hidden" value="${memberName }" name="memberName"/>
		<input type="hidden" value="${email }" name="email"/>
	</div>
	${memberId }
		새 비밀번호 <input type="text" name=updatePwd required>
		비밀번호 재입력 <input type="text" name=checkPwd required>	
		<button type="submit" onclick="checking()">
	</form>
	<script>
		function checking() {
			if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
				alert("비밀번호가 일치하지않습니다.")
				
				return false;
			}
		}
	</script>
</body>
</html>