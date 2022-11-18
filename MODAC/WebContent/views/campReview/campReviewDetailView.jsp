<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.modac.campReview.model.vo.CampReview"%>
<%
	CampReview cr = (CampReview)request.getAttribute("cr");
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
	.foorm-control {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>

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

             <div class="insert-area" style="height:100%">
              	  <div class="date">
	              <% if(loginMember != null && loginMember.getMemberNic().equals(cr.getMemberNic())) {%>
	              	<a href="<%=contextPath %>/updateForm.cr?crno=<%=cr.getPostNo()%>" class="btn btn-secondary last1">수정하기</a>
	              	<a href="<%=contextPath %>/delete.cr?crno=<%=cr.getPostNo()%>" class="btn btn-secondary last1">삭제하기</a>
	              <% } %>
	              </div>
				 <br><br>
	             <div class="foorm-control">
	                <input type="hidden" name="postNo" value="<%=cr.getPostNo() %>">
	                <br>
	                <h3>&nbsp;<%=cr.getPostTitle()%></h3>
	                 
	                <br>
	                <span>&nbsp; <%=cr.getMemberNic() %></span>
	                <span class="date">작성일 : <%=cr.getCreateDate() %></span>
	                 
	                <br>
	                <br>
	                <div class="form-control" style="height:500px;">
	               		 <%=cr.getPostContent() %>
	                </div>
	
	                <div class=" btn-group-sm foorm-control" role="group" aria-label="Basic checkbox toggle button group">
	
	                  <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="on">
	                  <label class="btn btn-outline-primary" for="btncheck1">#사장님이 친절해요</label>
	                
	                  <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="on">
	                  <label class="btn btn-outline-primary" for="btncheck2">#시설이 깔끔해요</label>
	                
	                  <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="on">
	                  <label class="btn btn-outline-primary" for="btncheck3">#주변 경관이 좋아요</label>
	               
	                  <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="on">
	                  <label class="btn btn-outline-primary" for="btncheck4">#매너시간이 잘 지켜져요</label>
	                
	                  <input type="checkbox" class="btn-check" id="btncheck5" autocomplete="on">
	                  <label class="btn btn-outline-primary" for="btncheck5">#사이트 공간이 넓어요</label>
	                
	                  <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="on">
	                  <label class="btn btn-outline-primary" for="btncheck6">#주변 볼거리가 많아요</label>
	               </div>
	            </div>
	            <br>
	            
	            <div align="center">
	              <a href="<%=contextPath %>/list.cr" class="btn btn-secondary last1">목록으로</a>
	            </div>
	            <br>
			    <br>
		     </div>
	      </div>


 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>