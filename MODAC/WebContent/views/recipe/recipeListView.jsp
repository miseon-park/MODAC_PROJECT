<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 	import="java.util.ArrayList , com.modac.recipe.model.vo.*, com.modac.common.model.vo.*"%>
<%
	ArrayList<Recipe> list = (ArrayList<Recipe>)request.getAttribute("list");

    Attachment at = (Attachment)request.getAttribute("at");

	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head><script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
        .content1{
           width: 20%;
		   height : 1000px;
		   padding: 50px 20px 10px;
		   background-color: antiquewhite;
           float: left; 
        }

        .content2{
            width: 80%;
			padding: 10px 50px 20px;
            float: left; 
        }
		.navbar{
            width: 450px;
		}
		.navbar, .btn-group{
			margin-top: 20px;
            display: table;
            margin-left: auto;
            margin-right: auto;
		}
		.active{
			font-size: large;
			font-weight: 600;
		}
	    .date {
	        float : right;
	    }
	    .list-area {
	    	width: 80%;
			margin: auto;
			padding: 1%;
	    }
	   
</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>
        <div class="content">
            <div class="content1">
                <nav class="flex-column">
                    <a class="nav-link active" aria-current="page" href="#">모닥불이야기</a><br><br>
                    <a class="nav-link" href="#">캠핑장 리뷰</a>
                    <a class="nav-link" href="#">캠핑 레시피</a>
                    <a class="nav-link">캠핑스타그램</a>
                  </nav>
            </div>
            <div class="content2">
				<br>
                <h3>캠핑장 레시피</h3>
				<br>

	            <br>				
				<div class="list-area">
					<% if(loginMember != null) { %>
						<div align="right">
			                <a href="<%=contextPath %>/enrollForm.r" class="btn btn-secondary last1">글쓰기</a> 
		            	</div>
		            <% } %>
		            <br>

					<% if(!list.isEmpty()) {%>
						<% for(Recipe r : list) {%>
	
					<div class="card" style="width: 32%; display:inline-block!important;">
						<input type="hidden" id="rno" value="<%=r.getPostNo()%>"> 
						<img src="<%=contextPath%>/<%=r.getTitleImg()%>" width="200px" height="150px">
	
						<div class="card-body">
							<span><%=r.getMemberNic()%></span> <span class="date"><%=r.getCreateDate()%></span>
							<br>
							<br>
							<h5 class="card-title"><%=r.getPostTitle()%></h5>
	
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-alarm" viewBox="0 0 16 16"> <path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z" />
				                <path d="M6.5 0a.5.5 0 0 0 0 1H7v1.07a7.001 7.001 0 0 0-3.273 12.474l-.602.602a.5.5 0 0 0 .707.708l.746-.746A6.97 6.97 0 0 0 8 16a6.97 6.97 0 0 0 3.422-.892l.746.746a.5.5 0 0 0 .707-.708l-.601-.602A7.001 7.001 0 0 0 9 2.07V1h.5a.5.5 0 0 0 0-1h-3zm1.038 3.018a6.093 6.093 0 0 1 .924 0 6 6 0 1 1-.924 0zM0 3.5c0 .753.333 1.429.86 1.887A8.035 8.035 0 0 1 4.387 1.86 2.5 2.5 0 0 0 0 3.5zM13.5 1c-.753 0-1.429.333-1.887.86a8.035 8.035 0 0 1 3.527 3.527A2.5 2.5 0 0 0 13.5 1z" /> </svg>
							<span class="card-text">소요시간 : </span><span><%=r.getTime()%></span><br>
						
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16">
				                <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z" /></svg>
							<span class="card-text"> 난이도 : </span><span><%=r.getDifficulty()%></span><br>
	
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket2" viewBox="0 0 16 16">
				                <path d="M4 10a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 1 1 2 0v2a1 1 0 0 1-2 0v-2z" />
				                <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-.623l-1.844 6.456a.75.75 0 0 1-.722.544H3.69a.75.75 0 0 1-.722-.544L1.123 8H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM2.163 8l1.714 6h8.246l1.714-6H2.163z" /> </svg>
							<span class="card-text">주재료 : </span><span><%=r.getMainIngre()%></span><br>
						</div>
					</div>
					<% } %>
				<% } else { %>
					등록된 게시글이 없습니다.
				<% } %>

	
			<script>
				$(function(){
					$(".card").click(function(){
						let rno = $("#rno").val();
						location.href = '<%=contextPath%>/detail.r?rno='+rno;
					})
				})
			</script>
			</div>

			<div class="btn-group" aria-label="Basic example" align="center">
			
				<% if(currentPage != 1) { %>
					<button onclick="doPageClick(<%=currentPage-1 %>)" type="button" class="btn"><<</button>
				<% } %>
				
				<% for(int i = startPage; i<= endPage; i++) { %>
					<% if(i != currentPage) { %>
						<button onclick="doPageClick(<%=i%>)" type="button" class="btn"><%=i %></button>
					<% } else { %>
						<button disabled><%=i %></button>
					<% } %>
				<% } %>
				
				<% if(currentPage != 1) { %>
					<button onclick="doPageClick(<%=currentPage+1 %>)" type="button" class="btn">>></button>
				<% } %>
			</div>
			
			<script>
				function doPageClick(currentPage){
					location.href = "<%=contextPath%>/list.r?currentPage="+currentPage;
				}
			</script>
            </div>
			
        </div>

 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>