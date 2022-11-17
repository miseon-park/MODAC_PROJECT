<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.modac.recipe.model.vo.Recipe, com.modac.common.model.vo.*"%>
<%
Recipe r = (Recipe)request.getAttribute("r");

Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head><script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	.content1 {
		width: 20%;
		height: 1000px;
		padding: 50px 20px 10px;
		background-color: antiquewhite;
		float: left;
	}
	.content2 {
		width: 80%;
		padding: 10px 50px 20px;
		float: left;
	}
	.form-control {
		margin: 5px;
	}
	.last {
		margin: auto;
	}
	.date {
		float: right;
	}
	.insert-area {
		width: 80%;
		margin: auto;
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
               <h3>캠핑장 리뷰</h3>
             <br>

              <div align="right" class="insert-area">
            
              <% if(loginMember != null && loginMember.getMemberNic().equals(r.getMemberNic())) {%>
              	<a href="<%=contextPath %>/updateForm.r?rno=<%=r.getPostNo()%>" class="btn btn-secondary last1">수정하기</a>
              	<a href="<%=contextPath %>/delete.r?rno=<%=r.getPostNo()%>" class="btn btn-secondary last1">삭제하기</a>
              <% } %>
              
              </div>
			<br>
             <div class="form-control insert-area">
                <br>
                <h3>&nbsp;<%=r.getPostTitle()%></h3>
                 
                <br>
                <span>&nbsp; <%=r.getMemberNic() %></span>
                 
                <span class="date">작성일 : <%=r.getCreateDate() %></span>
                 
                <br>
                <br>
                <div class="form-control" style="height:500px;">
                  <div class="form-control">
                  <label class="col-sm-2 col-form-label"> &nbsp;&nbsp; <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-alarm" viewBox="0 0 16 16"> <path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z"/>
                    <path d="M6.5 0a.5.5 0 0 0 0 1H7v1.07a7.001 7.001 0 0 0-3.273 12.474l-.602.602a.5.5 0 0 0 .707.708l.746-.746A6.97 6.97 0 0 0 8 16a6.97 6.97 0 0 0 3.422-.892l.746.746a.5.5 0 0 0 .707-.708l-.601-.602A7.001 7.001 0 0 0 9 2.07V1h.5a.5.5 0 0 0 0-1h-3zm1.038 3.018a6.093 6.093 0 0 1 .924 0 6 6 0 1 1-.924 0zM0 3.5c0 .753.333 1.429.86 1.887A8.035 8.035 0 0 1 4.387 1.86 2.5 2.5 0 0 0 0 3.5zM13.5 1c-.753 0-1.429.333-1.887.86a8.035 8.035 0 0 1 3.527 3.527A2.5 2.5 0 0 0 13.5 1z"/> </svg> 소요시간 :  <%=r.getTime() %></label>
                  
                  <br>
                  <label class="col-sm-2 col-form-label"> &nbsp;&nbsp; <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16" >
                    <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/></svg> 난이도 :  <%=r.getDifficulty() %></label>
            
                  <br>
                  <label class="col-sm-2 col-form-label"> &nbsp;&nbsp; <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket2" viewBox="0 0 16 16">
                    <path d="M4 10a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 1 1 2 0v2a1 1 0 0 1-2 0v-2z" />
                    <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-.623l-1.844 6.456a.75.75 0 0 1-.722.544H3.69a.75.75 0 0 1-.722-.544L1.123 8H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM2.163 8l1.714 6h8.246l1.714-6H2.163z"/> </svg> 주재료 :  <%=r.getMainIngre() %></label>
                 
                  <br>
                  <label class="col-sm-2 col-form-label"> &nbsp;&nbsp; <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket2" viewBox="0 0 16 16">
                    <path d="M4 10a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 1 1 2 0v2a1 1 0 0 1-2 0v-2z" />
                    <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-.623l-1.844 6.456a.75.75 0 0 1-.722.544H3.69a.75.75 0 0 1-.722-.544L1.123 8H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM2.163 8l1.714 6h8.246l1.714-6H2.163z"/> </svg> 부재료 :  <%=r.getSubIngre() %></label>
                  </div> 
                  <%=r.getTitleImg() %>
                  <%=r.getPostContent() %>
                </div>
            </div>
            <br>
            <div id="reply-area">
		<table border="1" align="center">
			<thead>
				<% if(loginMember != null) { %>
					<!-- 로그인이 되어있을 경우 -->
					<tr>
						<th>댓글작성</th>
						<td>
							<textarea id="replyContent" col="50" row="3" style="resize:none;"></textarea>
						</td>
						<td><button onclick ="insertReply();">댓글등록</button></td>
					</tr>
				<% } else { %>
					<!-- 로그인이 안 되어있을 경우 -->
					<tr>
						<th>댓글작성</th>
						<td>
							<textarea col="50" row="3" style="resize:none;" readonly>로그인 후 이용가능한 서비스입니다.</textarea>
						</td>
						<td><button disabled>댓글등록</button></td>
					</tr>
				<%} %>
			</thead>
			<tbody>
				
			</tbody>
		</table>
	
	</div>
            
            <div align="center">
              <a href="<%=contextPath %>/list.r" class="btn btn-secondary last1">목록으로</a>
            </div>
            <br>
		    <br>
          </div>
      </div>

 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>