<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.ArrayList , com.modac.QA.model.vo.Qa, com.modac.common.model.vo.Attachment"    
%>
<%
	Qa q = (Qa)request.getAttribute("q");	
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	String[] filePath = {"", "", "", "", ""};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Hahmlet&family=Poor+Story&family=Do+Hyeon&display=swap');

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
			float: right;
        }
        .form-control {
          margin: 5px;
        }
        

        .form-select{
          width: 150px;
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
		
		.btn-close{
			float : right;
		}

		.list-area { 
			width: 80%; 
	 		margin: auto;
	 	}

		.list-title{
			
      		color: rgb(74,57,51);	
      		font-size : 35px;
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
	<%@ include file="../common/menubar.jsp" %>

	 <div class="content">
	        <div class="content1">
	            <nav class="flex-column">
	                <a class="nav-link active sidemenu" aria-current="page" href="<%=contextPath %>/noticeList"><h3>공지사항</h3></a><br><br>
	                <a class="nav-link sidemenu2" href="<%=contextPath %>/noticeList">모닥불 소식</a> 
	                <a class="nav-link sidemenu2" href="<%=contextPath%>/campTipList">캠핑 팁</a> 
	                <a class="nav-link sidemenu2" href="<%=contextPath%>/qaList">Q&A</a> 
	                <a class="nav-link sidemenu2" href="<%=contextPath%>/faqList">FAQ</a> 
	              </nav>
	        </div>
	
	        <div class="content2">
	          <br>
	          <div class="list-area">
	          	<h3 class="list-title">Q&A</h3>
	          <br>
				
			  <form id="enroll-form" action="<%=contextPath %>/updateQa" method="post" enctype="multipart/form-data">
		          <div class="foorm-control" id="form-control">
<%-- 	 	          	 <input type="hidden" name="userNo" value="<%=loginMember.getMemberNic() %>"> --%>
		          	 
		              <input type="text" class="form-control" name = "title" id="title" placeholder="제목을 입력해주세요." aria-label="title" value="<%= q.getQaTitle()%>">
		              
		              <textarea class="form-control" style="height:500px;" name='content'><%=q.getQaContent() %></textarea>
		              
		              <%if(!list.isEmpty()){ %>
		              <% int i = 1; 
		              
		              	 for(Attachment at : list){ 
		              		 
		              		 int index = at.getFileLevel();
		              		 filePath[index] = contextPath + "/" + at.getPath() + at.getNewName();
		              %>
	                 
	                  <!-- 원본파일의 파일번호, 수정명을 hidden으로 넘길것. -->
	                  <input type="hidden" name="originFileNo<%=i %>" value="<%=at.getPhotoNo()%>">
	                  <input type="hidden" name="originFileName<%=i %>" value="<%=at.getNewName()%>">
	               <% i++;
	               	  }	 
		              }%>
		              
		              <table>
		              	<tr>
		              	
			              	<% if(list.isEmpty()) {%>
		              		<th>
									첨부파일 없음
		              		</th>
							<%}else{
						  			int i = 1;%>
							<% for(Attachment at : list){ %>
		              		<th>
								<input type="text" value="<%= at.getOriginName() %>" style="border: none; background: transparent; pointer-events: none;" readonly>
<%-- 								<input type="button" class="btn-close" id="deleteBtn<%=i %>" aria-label="Close" onclick="deleteAttachment();"> --%>
		              		</th>
							<%	i++;
					  		} %>
							<%} %>
		              	</tr>
		              	<tr>
		              		<td>
								 <img id="titleImg" src="<%=filePath[1] %>" value="1" width="210" height="180" style="border:1px solid white;">	              		
		              		</td>
		              		<td>
		              			<img id="contentImg1" <%if(!filePath[2].equals("")){ %>src="<%=filePath[2] %>" <%} %> value="2" width="210" height="180" style="border:1px solid white;">
		              		</td>
		              		<td>
		              			<img id="contentImg2" <%if(!filePath[3].equals("")){ %>src="<%=filePath[3] %>" <%} %>  value="3" width="210" height="180" style="border:1px solid white;">
		              		</td>
		              		<td>
		              			<img id="contentImg3" <%if(!filePath[4].equals("")){ %>src="<%=filePath[4] %>" <%} %>  value="4" width="210" height="180" style="border:1px solid white;"> <br>
		              		</td>
		              	</tr>
		              </table>
		             
		      
		             
					<div class="file-area">
						<div class="inputFile" style="width: 550px;">
			                 <input type="file" class="form-control" name="upfile1" value="1" id="file1" onchange="loadImg(this, 1);">
			                 <input type="file" class="form-control" name="upfile2" value="2" id="file2" onchange="loadImg(this, 2);">
			                 <input type="file" class="form-control" name="upfile3" value="3" id="file3" onchange="loadImg(this, 3);">
			                 <input type="file" class="form-control" name="upfile4" value="4" id="file4" onchange="loadImg(this, 4);">
						</div>
					</div>
		              <input type='hidden' name='qno' value='<%= q.getQaNo() %>'>
		          </div>
		          
		          <br><br>
			        
			        <div align="center">
			                
			          <button type="button" class="btn text-white" style="background-color: #BDBDBD;" class="last1" onclick="history.back();">이전으로</button>
			
			          <button type="submit" class="btn text-white" style="background-color: orange;" class="last1">수정하기</button>
			        </div>
			  </form>
	
	        </div>
			<br clear="both">
	    </div>
	    </div>

	<script>
		$(function() {

			$("#titleImg").click(function() {
				$("#file1").click();
			});

			$("#contentImg1").click(function() {
				$("#file2").click();
			})

			$("#contentImg2").click(function() {
				$("#file3").click();
			})

			$("#contentImg3").click(function() {
				$("#file4").click();
			});

		});

		function loadImg(inputFile, num) {
			// inputFile : 현재 변화가 생긴 input type="file"요소 객체
			// num : 몇번째 input 요소인지 확인 후 해당 영역에 미리보기 하기 위한 하드코딩된 변수

			// console.log(inputFile.files , inputFile.files.length);
			/*
				파일 선택시 length = 1, 파일선택 취소시 length = 0이 출력됨 => 즉, 파일의 존재유무를 알 수 있다.
				files속성은 업로드된 파일의 정보들을 배열형식으로 여러개 묶어서 반환, length는 그 배열의 크기
			 */
			if (inputFile.files.length != 0) {
				// 선택된 파일이 존재할 경우
				// 선택된 파일들을 읽어들여서 그 영역에 맞는 곳에 미리보기

				// 파일을 읽어들일 FileReader 객체 생성
				let reader = new FileReader();

				// 파일을 읽어들이는 메소드 => 어느 파일을 읽어들일지 매개변수로 제시해야함
				// 0번 인덱스에 담긴 파일정보를 제시
				// => 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url이 부여된다.
				// => 해당 url을 이미지 src의 속성값으로 제시
				reader.readAsDataURL(inputFile.files[0]);

				// 파일 읽기가 완료되었을 때 실행할 함수 정의
				reader.onload = function(e) { // e. target.result에 reader의 고유 url담김
					// 각 영역에 맞춰서 이미지 미리보기
					switch (num) {
					case 1:
						$("#titleImg").attr("src", e.target.result);
						break;
					case 2:
						$("#contentImg1").attr("src", e.target.result);
						break;
					case 3:
						$("#contentImg2").attr("src", e.target.result);
						break;
					case 4:
						$("#contentImg3").attr("src", e.target.result);
						break;
					}

				}

			} else {
				// 선택된 파일이 사라졌을 경우 미리보기도 사라지게끔 작업
				switch (num) {
				case 1:
					$("#titleImg").attr("src", null);
					break;
				case 2:
					$("#contentImg1").attr("src", null);
					break;
				case 3:
					$("#contentImg2").attr("src", null);
					break;
				case 4:
					$("#contentImg3").attr("src", null);
					break;
				}
			}

		}
		
		
		function deleteAttachment(fileNo){
			$.ajax({
				url : "<%= request.getContextPath() %>/delete.at",
				data : {file_no : file_no},
				success : function(result){
					//삭제성공시
					if(result == 1){
						alert("삭제에성공했습니다");
						location.reload();
					}else{
						alert("삭제에 실패했습니다.");
					}
					
				}
				
				
			})
			
		}
		
	</script>


	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>