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


<style>

	.total-area {
		margin: auto;
		width: 1200px;
	}
	#info-area {
		border: 1px solid lightgray;
		padding-top: 30px;
		padding-bottom: 30px;
	}
	#detail-area {
		border: 1px solid lightgray;
	}


	table, tr, td {
		border: 1px solid green;
	}


	#info-table {
		margin: auto;
		width: 1000px;
	}


</style>

</head>
<body>

	<%@ include file = "../common/menubar.jsp" %>

	<div class="total-area">
		<div id="info-area">
			<table id="info-table">
				<tr>
					<td rowspan="4" style="">이미지</td>
					<td><%=c.getCampName() %></td>
				</tr>
				<tr>
					<td>위치</td>
					<td><%=c.getAddress() %></td>
				</tr>
				<tr>
					<td>웹페이지</td>
					<td><%=c.getCampWeb() %></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><%=c.getCampCall() %></td>
				</tr>
			</table>
		</div>
		<div id="detail-area">
			dfdfdf
		</div>
	</div>


</body>
</html>