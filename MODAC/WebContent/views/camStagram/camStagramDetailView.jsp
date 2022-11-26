<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.modac.camStagram.model.vo.*, com.modac.common.model.vo.*"%>
<%
	CamStagram cs = (CamStagram)request.getAttribute("cs");
	Attachment at = (Attachment)request.getAttribute("at");
	BoardLike bl = (BoardLike)request.getAttribute("bl"); 
%>
<!DOCTYPE html>
<html>
<head><script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel=”stylesheet” href=”http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css“>
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
		width: 60%;
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
               <h3>캠핑 스타그램</h3>
               <br>
			   <div class="insert-area">
	               <div align="right">
	                 <% if(loginMember != null && loginMember.getMemberNic().equals(cs.getMemberNic())) {%>
	                  	<a href="<%=contextPath %>/updateForm.cs?csno=<%=cs.getPostNo()%>" class="btn btn-secondary last1">수정하기</a>
	                  	<a href="<%=contextPath %>/delete.cs?csno=<%=cs.getPostNo()%>" class="btn btn-secondary last1">삭제하기</a>
	                 <% } %> 
	               </div>
				   <br>
				   
	               <div class="foorm-control">
		                <div class="form-control" style="height:100%;">
		                	<div style="text-align:center">
		                     <% if(cs.getTitleImg() != null ) { %>
			               		 <img src="<%=contextPath%>/<%=cs.getTitleImg()%>" width="100%" height="100%">
			                 <% } %>
			                 <br>
				             <% if(at==null) { %>
						 		<!--  첨부파일이 없는경우 -->
						  	 <% } else {%>
								<!-- 첨부파일이 있는경우 -->
								<!-- 브라우저에서 http://localhost:8001/jsp/resources/board_upfiles/xxx.jpg -->
								<input type="hidden" value="<%=contextPath%>/<%= at.getPath() + at.getNewName() %>">
								
							 <% } %>
			                 </div>
			                 	
								<%if(loginMember == null) { %>
									<i class="bi bi-suit-heart"></i>  <span><%=cs.getLikeCount() %></span>  	
								<%} else { %>
									<%if(bl != null) {%>
										<button type="button" class="bi bi-suit-heart" style="display:none;" onclick="like();" id="like"></button> 
										<button type="button"class="bi bi-suit-heart-fill" style="display:inline;" id="unlike"></button> <span><%=cs.getLikeCount() %></span>
									<%} else { %>
										<button type="button"class="bi bi-suit-heart" style="display:inline;" onclick="like();" id="like"></button>
										<button type="button"class="bi bi-suit-heart-fill" style="display:none;" id="unlike"></button> <span><%=cs.getLikeCount() %></span>
									<% } %>
								
<%-- 									<%if(bl != null) {%> --%>
<!-- 										<i class="bi bi-suit-heart" style="display:none;" onclick="likeClick();" id="like"></i>  -->
<%-- 										<i class="bi bi-suit-heart-fill" style="display:inline;" onclick="unLikeClick();" id="unlike"></i> <span><%=cs.getLikeCount() %></span> --%>
<%-- 									<%} else { %> --%>
<!-- 										<i class="bi bi-suit-heart" style="display:inline;" onclick="LikeClick();" id="like"></i> -->
<%-- 										<i class="bi bi-suit-heart-fill" style="display:none;" onclick="unlikeClick();" id="unlike"></i> <span><%=cs.getLikeCount() %></span> --%>
<%-- 									<% } %> --%>
								<% } %>
				
			                    &nbsp;
								<i class="bi bi-chat-dots"></i>  <span><%=cs.getReplyCount()%></span>
			                  	
			                  	<br><br>
								<span><b>&nbsp;<%=cs.getMemberNic() %></b></span>

								<span class="date"><%=cs.getCreateDate() %>&nbsp;</span>
								<br><br><br>
								<div style="padding:5px;"> <%=cs.getPostContent() %></div> 						  
			               		
		                </div>
	                  <br><br><br><br>
	           
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
			    </div>
	        </div>   
            <div align="center">
              <a href="<%=contextPath %>/list.cs" class="btn btn-secondary last1">목록으로</a>
            </div>
            <br>
		    <br>
          </div>
          
          <script>
//           function likeClick(){
// 			  $("#like").css("display","inline");
//         	  $("#unlike").css("display","none");
//           }
          
// 		   $(function(){
// 			 $("#like").click(function(){
				 
				 function like(){
					 $.ajax({
	                        url : "like.cs",
	                        data : {memberNo : "<%=cs.getMemberNo()%>",
	                              postNo : "<%=cs.getPostNo() %>"},
	                        success : function(result){
	                           //좋아요 등
	                           if(result == 1){
	                              alert("좋아요를 등록했습니다.");
	                           }else{
	                              alert("좋아요 등록에 실패했습니다. ");
	                           }
	                        }
	                     });
				 }
                  
//                   }
//             })
            
//             function unLikeClick(){
// 			  $("#like").css("display","none");
//         	  $("#unlike").css("display","inline");
//          	}
            $(function(){
            $("#unlike").click(function(){
                  $.ajax({
                        url : "unlike.cs",
                        data : {MemberNo : "<%=cs.getMemberNo()%>",
                              postNo : <%=cs.getPostNo() %>},
                        success : function(result){
                           //좋아요 등
                           if(result == 1){
                              alert("좋아요를 취소했습니다.");
                              location.reload();
                           }else{
                              alert("좋아요 취소에 실패했습니다. ");
                           }
                        }
                     });
                  }
            })
	      
      	 </script>



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>