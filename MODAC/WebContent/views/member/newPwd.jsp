<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String contextPath = request.getContextPath();
    String alertMsg = (String) session.getAttribute("alertMsg");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		let msg = "<%=alertMsg%>";
		if(msg != "null") {
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
	
<form action="<%= contextPath%>/fineupdatePw.me" method="post" >
	<div>
		<input type="hidden" value="${memberId }" name="memberId"/>
		<input type="hidden" value="${memberName }" name="memberName"/>
		<input type="hidden" value="${email }" name="email"/>
	</div>
	${memberId },<br>${memberName },<br>${email }<br>
		새 비밀번호 <input type="text" name=updatePwd required>
		비밀번호 재입력 <input type="text" name=checkPwd required>	
		<button type="submit" onclick="checking()">변경하기</button>
	</form>
	<script>
		function checking() {
			if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
				alert("비밀번호가 일치하지않습니다.")
				return false;
			}else{
				<%=contextPath %>
			}
		}
	</script>
</body>
</html>