<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.modac.campReview.model.vo.*, com.modac.common.model.vo.Attachment"%>
<%
	CampReview cr = (CampReview)request.getAttribute("cr");
	ReviewTag rt = (ReviewTag)request.getAttribute("rt");
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
            	<div align="right">
                  <% if(loginMember != null && loginMember.getMemberNic().equals(cr.getMemberNic())) {%>
                    	<a href="<%=contextPath %>/updateForm.cr?crno=<%=cr.getPostNo()%>" class="btn btn-secondary last1">수정하기</a>
                    	<a href="<%=contextPath %>/delete.cr?crno=<%=cr.getPostNo()%>" class="btn btn-secondary last1">삭제하기</a>
                  <% } %> 
                </div>
			    <br><br>
				    
				<div class="foorm-control">
	                <br><br>
	                <h3>&nbsp;<%=cr.getPostTitle()%></h3>
	                 
	                <br> 
	                <span>&nbsp; 작성자 : <%=cr.getMemberNic()%></span>
	                
	                <span class="date">작성일 : <%=cr.getCreateDate() %>&nbsp;</span>
	                 
	                <br><br>
	                <div class="form-control" style="height:100%;">
	                	<div style="text-align:center">
	                     <% if(cr.getTitleImg() != null ) { %>
		               		 <img src="<%=contextPath%>/<%=cr.getTitleImg()%>" width="80%" height="100%">
		                 <% } %>
		                 <br>
				         <% if(at==null) { %>
					 		<!--  첨부파일이 없는경우 -->
					  	 <% } else {%>
							<!-- 첨부파일이 있는경우 -->
							<!-- 브라우저에서 http://localhost:8001/jsp/resources/board_upfiles/xxx.jpg -->
							<a href ="<%=contextPath%>/<%= at.getPath() + at.getNewName() %>"
							download="<%=at.getOriginName() %>">
								<%=at.getOriginName() %>
							</a>
						 <% } %>
		                 
		                 </div>
		                  	 <br><br>
		               		 <div style="padding:5px;"><%=cr.getPostContent() %></div>
	                </div>
	
	                <div class=" btn-group-sm foorm-control" role="group" aria-label="Basic checkbox toggle button group">
	                  <input type="checkbox" class="btn-check" name="tag" value="1" id="btncheck1" autocomplete="off">
	                  <label class="btn btn-outline-primary" for="btncheck1">#사장님이 친절해요</label>
	                  
	                  <input type="checkbox" class="btn-check" name="tag" value="2" id="btncheck2" autocomplete="off">
	                  <label class="btn btn-outline-primary" for="btncheck2">#시설이 깔끔해요</label>
	                  
	                  <input type="checkbox" class="btn-check" name="tag" value="3" id="btncheck3" autocomplete="off">
	                  <label class="btn btn-outline-primary" for="btncheck3">#주변 경관이 좋아요</label>
	                 
	                  <input type="checkbox" class="btn-check" name="tag" value="4" id="btncheck4" autocomplete="off">
	                  <label class="btn btn-outline-primary" for="btncheck4">#매너시간이 잘 지켜져요</label>
	                  
	                  <input type="checkbox" class="btn-check" name="tag" value="5" id="btncheck5" autocomplete="off">
	                  <label class="btn btn-outline-primary" for="btncheck5">#사이트 공간이 넓어요</label>
	                  
	                  <input type="checkbox" class="btn-check" name="tag" value="6" id="btncheck6" autocomplete="off">
	                  <label class="btn btn-outline-primary" for="btncheck6">#주변 볼거리가 많아요</label>
	               </div>
	            </div>
	            </div>
		  	    <script>
			    <% if(rt != null) {%>
		            $(function(){
		                let tag = "<%= rt.getTagNo()%>"
		                $("input[type=checkbox]").each(function(){
		                    // 순차적으로 접근한 input 요소의 value값이 interest에 포함될경우
		                    // -> 해당 input 요소에 checked 속성을 부여할것.
		                    if(tag.search($(this).val()) != -1){ 
		                        // interest문자열로부터 현재 체크박스의 value가 포함되어있지 않다면 -1을 반환
		                        $(this).attr("checked", true);
		                    }
		                })
		             })
	            <% }%>
		        </script>
	            <br>
	            
	            <div align="center">
	              <a href="<%=contextPath %>/list.cr" class="btn btn-secondary last1">목록으로</a>
	            </div>
	            <br>
			    <br>
		     </div>



 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>