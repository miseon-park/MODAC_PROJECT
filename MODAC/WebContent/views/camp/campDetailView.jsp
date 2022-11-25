<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.modac.camp.model.vo.Camp, java.util.ArrayList"%>
    
<%
	Camp c = (Camp) request.getAttribute("c");
	ArrayList<Camp> n1 = (ArrayList<Camp>) request.getAttribute("n1");
	ArrayList<Camp> n2 = (ArrayList<Camp>) request.getAttribute("n2");
	ArrayList<Camp> n3 = (ArrayList<Camp>) request.getAttribute("n3");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부 정보</title>
</head>
<body>

	<%@ include file = "../common/menubar.jsp" %>


	<div>
		<table>
			<tr>
				<td><%=c.getCampName() %></td>
				<td><%=c.getAddress() %></td>
				<td><%=c.getCampCall() %></td>
				<td><%=c.getCampWeb() %></td>
				<td><%=c.getCampContent() %></td>
			</tr>
			<tr>
				<td>자연경관</td>
			</tr>
			<tr>
				<% for(Camp c1 : n1) { %>
					<td><%=c1.getNaturalAttri() %></td>
				<% } %>
			</tr>
			<tr>
				<td>지형</td>
			</tr>
			<tr>
				<% for(Camp c2 : n2) { %>
					<td><%=c2.getNaturalAttri() %></td>
				<% } %>
			</tr>
			<tr>
				<td>편의시설</td>
			</tr>
			<tr>
				<% for(Camp c3 : n3) { %>
					<td><%=c3.getNaturalAttri() %></td>
				<% } %>
			</tr>
		</table>
			
	
	
	</div>


</body>
</html>