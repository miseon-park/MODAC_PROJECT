<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.ArrayList , com.modac.QA.model.vo.Qa, com.modac.common.model.vo.Attachment"    
%>
    
<% 
	Qa q = (Qa)request.getAttribute("q");	
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세페이지</title>
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
		      padding: 50px 50px 20px;
		      float: left;
        }
        .form-control {
          margin: 5px;
        }
        

        .form-select{
          width: 150px;
        }
        
        .date{
        	float: right;
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
		
 		.list-area { 
 			width: 80%; 
 			margin: auto;
 			}
 			
 		hr{
 			border: 0;
    		height: 1px;
    		background: #ccc;"
 		}
 		
 		.reply-area{
 			width : 100%;
 			height : 80px;
 			margin : auto;
 		}
 		
 		.replyText{
 			width : 85%;
 			height : 100%;
 			border : 1px solid rgb(240, 165, 0);
 			float : left;
 		}
 		
 		.replyBtn{
 			width : 15%;
 			height : 100%;
 			background-color : rgb(240, 165, 0);
 			float : right;
 		}
 		
 		.inputReply{
 			width : 100%;
 			height : 100%;
 			resize : none;
 			border: none;
 			outline: none;
 		}
 		
 		.replyList{
 			width : 100%;
 		}
 		
 		table{
 			width : 100%;
 		}
 		
 		table tr{
 			width : 100%;
 			border-bottom : 1px solid antiquewhite;
 		}
</style>

</head>
<body>

<%@ include file="../common/menubar.jsp" %>
	<div class="content">


		<div class="content1">
			<nav class="flex-column">
				<a class="nav-link active" aria-current="page"
					href="<%=contextPath %>/noticeList"><h3>공지사항</h3></a><br>
				<br> <a class="nav-link" href="<%=contextPath %>/noticeList">모닥불
					소식</a> <br> <a class="nav-link" href="<%=contextPath%>/campTipList">캠핑 팁</a> <br> <a
					class="nav-link" href="<%=contextPath %>/qaList">Q&A</a> <br>
				<a class="nav-link" href="<%=contextPath %>/faqList">FAQ</a>
			</nav>
		</div>


		<div class="content2">
			<br>
			<h3>Q&A</h3>
			<div class="list-area">
			<br>
			<div align="right" class="insert-area">

				
				<% if(loginMember != null && loginMember.getMemberNic().equals(q.getMemberNic())) {%>
				<a href="<%=contextPath %>/updateForm.qno?qno=<%=q.getQaNo()%>"
					class="btn btn-warning last1">수정하기</a> <a
					href="<%=contextPath %>/delete.qno?qno=<%=q.getQaNo()%>"
					class="btn btn-secondary last1">삭제하기</a>
				<% } %>

			</div>
			
			<br>

			<div class="foorm-control">
				<input type='hidden' name="qno" value="<%= q.getQaNo() %>">
				<input type='hidden' name="hiddenPost" value="<%=q.getHiddenPost() %>">
				<br>
					<h4>&nbsp; <%=q.getQaTitle() %>
						<% if (q.getHiddenPost().equals("Y")){ %>
							<span class="badge bg-secondary">비밀글</span>
						<%} %>
					</h4>
				<br> 
				
				<span>&nbsp; <%=q.getMemberNic() %></span> 
				<span class="date"><%=q.getCreateDate() %>&nbsp;&nbsp;</span> 
				
				<br>
				<hr>
				<br>
					
				<textarea class="foorm-control" style="height: 500px;" id="contentBox" disabled><%=q.getQaContent()%></textarea>
				<% if(list.isEmpty()) {%>
					첨부파일 없음
				<%}else{
				  	int i = 1;%>
				<% for(Attachment at : list){ %>
					<a href="<%=contextPath %>/<%= at.getPath() %><%=at.getNewName() %>" download="<%=at.getOriginName()%>" name="upfile<%=i %>" value="<%=at.getFileLevel()%>"> 
						<%= at.getOriginName() %>
					</a>
				<%	i++;
			  		} %>
				<%} %>
				
				<hr>
				<h5>댓글</h5>
				<%if(loginMember!=null){ %>
					<div class="reply-area">
						<div class="replyText">
							<textarea class="inputReply" id="replyContent"></textarea>					
						</div>
						<div class="replyBtn" onclick="insertReply();">
							<h5 style="color: white; text-align : center; margin-top : middle; line-height : 80px;">댓글 등록</h5>
						</div>
					</div>
				<%} else { %>
					<div class="reply-area">
						<div class="replyText">
							<textarea class="inputReply" id="replyContent" readonly>로그인 후 이용이 가능한 서비스 입니다.</textarea>					
						</div>
						<div class="replyBtn" onclick="insertReply();">
							<h5 style="color: white; text-align : center; margin-top : middle; line-height : 80px;" disabled>댓글 등록</h5>
						</div>
					</div>
				<% } %>
				
				<div class="replyList">
					<table sytle="width : 100%;">


					</table>
				</div>

			</div>
			<br>
			<div align="center">
				<a href="<%=contextPath%>/qaList" class="btn btn-secondary btn-sm">목록으로</a>

			</div>
			<br> <br>
		</div>

		</div>
	</div>


		
		
		<script>
			$(function(){
				selectReplyList();
				
				setInterval(selectReplyList, 1000);// 괄호 붙이면 메소드가 되어서 한번실행되고 안됨
			});
		
		
			function insertReply(){
				$.ajax({
					url:"insertReply.qa",
					data : {
						replycontent : $("#replyContent").val(), 
						qno : ${q.qaNo}
					},
					
					type : "post",
					success : function(result){
						if(result > 0){// 댓글등록 성공 => 갱신된 댓글리스트 조회
							selectReplyList();
						$("#replyContent").val("");
							
						}
					},
					error : function(){
						console.log("댓글 작성용 ajax 통신실패")
					}
				})
			};
			
			 function selectReplyList(){
				$.ajax({
					
					url:"replyList.qa",
					data:{qno : ${q.qaNo}},// 객체
					success:(list)=>{
						
						let result = "";
						for(let i of list){
							
							
							result+="<tr>"
										+"<td>"+i.writer+"</td>"
										+"<td>"+i.replyContent+"</td>"
										+"<td style='float : right;'>"+i.createDate+"</td>"
										
								  +"</tr>"
								  
							
						}
						$(".replyList>table").html(result); 
						
					},
					error:function(){
						console.log("댓글리스트 조회용 ajax통신 실패")
					}
				})
				
			}  
		
		</script>




<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>