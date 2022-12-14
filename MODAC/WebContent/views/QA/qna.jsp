<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList , com.modac.notice.model.vo.Notice, com.modac.QA.model.vo.Qa, com.modac.common.model.vo.PageInfo,
	 com.modac.member.model.vo.Member"%>

<%ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); %>
<%
	ArrayList<Qa> qList = (ArrayList<Qa>)request.getAttribute("qList"); 
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Hahmlet&family=Poor+Story&family=Do+Hyeon&display=swap');

	.content>div {
		height: 1000px;
		float: left;
	}
	
	.content1 {
		width: 20%;
		height: 1000px;
		padding: 50px 20px 10px;
		background-color: antiquewhite;
		float: left;
	}
	
	.content2 {
		width: 80%;
		padding: 50px 50px 20px;
		float: left;
	}
	
	.searchbar {
		margin-top: 20px;
		display: table;
		margin-left: auto;
		margin-right: auto;
	}
	
	#writeEdit {
		float: right;
	}
	
	.list-area {
		width: 80%;
		margin: auto;
	}
	
	.input-group-text {
		text-decoration: none;
	}

   .moveBtn{
       color: white;
       background-color: rgb(74,57,51);
       border : none;
       width: 80px;
       border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px
    }
    .pageBtn{
       color: black;
       background-color: gainsboro;
       border-radius: 50%;
       border: gainsboro;
       width: 30px;
       height: 30px;
    }
    .pageBtn:hover{
       width: 30px;
       height: 30px;
       color: white;
       background-color: orange;
    }
    
    .navbar{
    	width: 600px;
    }
    
    .insertBtn{
    	margin-right : 110px;
    }
    
    .list-title{
    	text-align:center;
       	font-family: 'Do Hyeon', sans-serif;
        color: #4a3933;
        font-size: 45px;
    }
    
    .sidemenu {
    	font-family: 'Do Hyeon', sans-serif;
        color: #4a3933;
        font-size: 30px;
    }
    .sidemenu2 {
        font-family: 'Do Hyeon', sans-serif;
        color: #4a3933;
        font-size: 20px;
    }
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp"%>

	<div class="content">
		<div class="content1">
			<nav class="flex-column">
				<a class="nav-link active sidemenu" aria-current="page" href="<%=contextPath %>/noticeList"><h3>????????????</h3></a><br><br> 
				<a class="nav-link sidemenu2" href="<%=contextPath %>/noticeList">????????? ??????</a>
				<a class="nav-link sidemenu2" href="<%=contextPath%>/campTipList">?????? ???</a> 
				<a class="nav-link sidemenu2" href="<%=contextPath %>/qaList">Q&A</a>
				<a class="nav-link sidemenu2" href="<%=contextPath%>/faqList">FAQ</a>
			</nav>
		</div>
		<div class="content2">
			<h3 class="list-title">Q&A</h3>
			<br>
			<div class="searchbar">
						<nav class="navbar">
							<form class="container-fluid">
                         		<div class="input-group">
                            		<select class="form-select" name ="f" aria-label="Default select example" style="width:25%;">
                                	<option  ${(param.f == "POST_TITLE")? "selected":""} value="POST_TITLE">??????</option>
                                	<option  ${(param.f == "MEMBER_NIC")? "selected":""} value="MEMBER_NIC">?????????</option>
                               		</select>
                            	<input type="text" name ="q" class="form-control" placeholder="???????????? ???????????????" aria-label="Username" aria-describedby="basic-addon1" style="width: 60%;" value="${param.q}">
                            	<input type="submit" class="input-group-text" id="basic-addon1" value="??????">
                        		</div>
                        	</form>
							<br>
						</nav>
			</div>

			 <% if(loginMember != null && loginMember.getMemberLevel() == 1){ %>
                    <div class="insertBtn">
					<a type="button" class="btn text-white" style="background-color : orange;" id="writeEdit" href="<%=contextPath %>/qaEnrollForm">??? ??????</a> <br>
                    </div>
             <% } %>
			<br>
			<br>

			<div class="list-area">
				<table class="table table-hover" style="text-align: center;">
					<thead>
						<tr>
							<th scope="col" width="90px;">?????????</th>
							<th scope="col" width="450px;">??????</th>
							<th scope="col" width="150px;">?????????</th>
							<th scope="col" width="130px;">????????????</th>
							<th scope="col" width="80px;">?????????</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (list.isEmpty()) {
						%>
						<!-- ???????????? ???????????? ?????? -->
						<tr>
							<td colspan="5">???????????? ??????????????? ????????????.</td>
						</tr>
						<%
							} else {
						%>

						<% for(Notice n : list){ %>

						<%
							if (n.getNoticeCategory() != 1) {
						%>
						<tr style="background-color: rgb(250, 241, 241)">
							<td style="display: none;"><%=n.getNoticeNo()%></td>
							<th scope="row"><span class="badge text-bg-danger">??????</span></th>
							<td><%=n.getNoticeTitle()%></td>
							<td><%=n.getNoticeWriter()%></td>
							<td><%=n.getCreateDate()%></td>
							<td><%=n.getCount()%></td>
						</tr>
						<% } %>
						<% } %>

						<% for(Qa q : qList){ %>
						<% if(q.getHiddenPost().equals("N")){ %>
						<tr class="qa">
							<th scope="row"><%=q.getQaNo()%></th>
							<td><%=q.getQaTitle()%></td>
							<td><%=q.getMemberNic()%></td>
							<td><%=q.getCreateDate()%></td>
							<td><%=q.getCount()%></td>
						</tr>
						<% }else{ %>
						<tr class="qa_hidden">
							<th scope="row"><%=q.getQaNo()%></th>
							<td><%=q.getQaTitle()%> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"/>
</svg></td>
							<td><%=q.getMemberNic()%></td>
							<td><%=q.getCreateDate()%></td>
							<td><%=q.getCount()%></td>
						</tr>
						<% } %>
						<%
							}}
						%>

					</tbody>
				</table>
			</div>
			
			<script>
				$(function(){
						$(".list-area>table>tbody>tr").click(function(){
							// ????????? ?????? ??????????????? ????????? ????????????
							// ?????? tr????????? ??????????????? ????????? td??? ????????? ????????? ????????????.
							
							let nno = $(this).children().eq(0).text(); 
							// ?????? ?????? ????????? tr??? ???????????? 0????????? ????????? ????????? textnode????????? ????????????
							
							// ????????? url????=??????&???=??????&???=??????
							// ????????? ?????? ????????? ???????????????????????? ?????????. => ?????? ???????????? ????????????.
							location.href = '<%=contextPath%>/noticeDetail?nno='+ nno;
							
						});
						
// 						if(loginMember != null && loginMember.getMemberLevel() == 10){
// 							$(".qa").click(function(){
// 								let qno = $(this).children().eq(0).text();
								
<%-- 								location.href = '<%=contextPath%>/qaDetail?qno='+qno; --%>
// 							});
							
// 							$(".qa_hidden").click(function(){
// 								let qno = $(this).children().eq(0).text();
								
<%-- 								location.href = '<%=contextPath%>/qaDetail?qno='+qno; --%>
// 							});
// 						}
						
						$(".qa").click(function(){
							let qno = $(this).children().eq(0).text();
							
							location.href = '<%=contextPath%>/qaDetail?qno='+qno;
						});
						
						$(".qa_hidden").click(function(){
							let qno = $(this).children().eq(0).text();
							
							location.href = '<%=contextPath%>/qaCheckPwd.qa?qno='+qno;
						});
						
						
					})
	
	        </script>
			
			<br>
			<div align="center" class="paging-area">
	         <% if(currentPage != 1) {%>
	            <button class="moveBtn" onclick="doPageClick(<%=currentPage -1 %>)">&lt;??????</button>
	         <% } %>
         
         	 <% for(int i = startPage; i <= endPage; i++) { %>
             <%if(i != currentPage) {%>
               <button  class="pageBtn" onclick="doPageClick(<%=i%>)"><%=i %></button>
             <%} else {%>
               <button class="pageBtn" style="background-color: orange; color: white;" disabled><%= i %></button>
             <%} %>
         	 <% } %>
         
	         <% if(currentPage != maxPage) { %>
	            <button class="moveBtn" onclick="doPageClick(<%=currentPage +1 %>)">&gt;??????</button>
	         <% } %>
      		</div>
			
			<script>
				function doPageClick(currentPage){
					location.href = "<%=contextPath%>/qaList?currentPage="+currentPage;
				}
			</script>
			
			
		</div>
	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>