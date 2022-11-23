<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.modac.usedProduct.model.vo.Market, 
    com.modac.usedProduct.model.vo.Attachment,
    java.util.ArrayList"%>
<% 
	Market m = (Market)request.getAttribute("m"); 
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	String[] filePath = {"","","","",""};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
	h3{
		margin: auto;
		margin-left: 13%; 
		color: black;
	}
	#enroll{
		/*border: 1.5px solid gainsboro;*/
		box-sizing: border-box;
		width: 1000px;
		color: white;
		margin: auto;
		margin-left: 12.5%;
		display: inline-block;
	}
	#enroll-area{
		border: 1.5px solid;
		box-sizing: border-box;
		width: 800px;
		margin: auto;
		margin-top: 20;
		margin-bottom: ;
		color: rgb(197, 196, 196);
		text-align: center;
		border-radius: 0.5%;
	}
	.title{
		margin-top: 3%;
		margin-left: 2%;
		margin-right: 2%;
		margin-bottom: 10px;
	}
	.content{
		margin-top: 1%; 
		margin-bottom: 10; 
		resize: none;
		border: none;
	}
	.content:focus {
  		outline: 1px solid rgb(175, 174, 174);
		border-radius: 0.5%;
		outline: none;
	}
	.imgAtt{
		border: 1px solid;
		width: 93%;
		margin: auto;
		margin-top: 10;
	}
	#backBtn{
		float: left;
		margin-left: 98px;
		box-sizing: border-box;
		background-color: rgb(206, 205, 205);
		border: rgb(206, 205, 205);
		width: 100px;
		border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
	}
	#updateBtn{
		float: right;
		margin-left: 10px;
		margin-right: 98px;
		background-color: orange;
		border: orange;
		box-sizing: border-box;
		width: 100px;
		border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
	}
	#deleteBtn{
		float: right;
		margin-right: 98px;
		box-sizing: border-box;
		background-color: rgb(206, 205, 205);
		border: rgb(206, 205, 205);
		width: 100px;
		border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
	}
	.test{
		border: 1px solid purple;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div id="enroll">
		<h3>게시글 수정</h1>
		<br>

		<form id="enroll-form" action="<%=contextPath%>/update.mk" method="post" enctype="multipart/form-data">
		
			<input type="hidden" name="mno" value="<%=m.getPostNo()%>" >
	
			<div id="enroll-area" >
				<input type="text" class="title" name="title" value="<%=m.getPostTitle()%>" size="95" required>
				<br>
				
				<div class="imgAtt" style="text-align: left;">
					<% if(!list.isEmpty()){
					   	  int i = 1; 
					   	  
						  for(Attachment at : list) {
							 int index = at.getFileLevel();
							 filePath[index] = contextPath+"/"+at.getPath()+at.getNewName();
							  %>
		
							
							<!-- 원본파일의 파일번호, 수정명을 hidden으로 넘길것 -->
							<input type="hidden" name="originPhotoNo<%=i %>" value="<%=at.getPhotoNo()%>">
							<input type="hidden" name="newPhotoName<%=i %>" value="<%=at.getNewName() %>">
						 <% i++; } 
					   } %>
					<img id="titleImg" src="<%=filePath[1] %>" width="150" height="120" value="1">
					<img id="contentImg1" <%if(!filePath[2].equals("")){ %>src="<%=filePath[2] %>" <%} %> width="150" height="120" value="2">
					<img id="contentImg2" <%if(!filePath[3].equals("")){ %>src="<%=filePath[3] %>" <%} %> width="150" height="120" value="3">
					<img id="contentImg3" <%if(!filePath[4].equals("")){ %>src="<%=filePath[4] %>" <%} %> width="150" height="120" value="4">
					
					<input type="hidden" name="saleNo" value='<%=m.getPostNo() %>'>
				</div>
				
				<!-- 첨부파일 등록 -->
				<div id="file-area">
					<input type="file" id="file1" name="file1" onchange="loadImg(this, 1);" accept="image/*">
					<input type="file" id="file2" name="file2" onchange="loadImg(this, 2);" accept="image/*">
					<input type="file" id="file3" name="file3" onchange="loadImg(this, 3);" accept="image/*">
					<input type="file" id="file4" name="file4" onchange="loadImg(this, 4);" accept="image/*">
					<!-- onchange :  input태그의 내용물이 변경될 시 발생하는 이벤트 -->
				</div>
				
				<textarea class="content" name="content" cols="100" rows="15" required><%=m.getPostContent() %></textarea>
				<br><br>
			</div>
			<br>

			<script>
				$(function(){
					//input 태그 숨김
					$("#file-area").hide();
					
					//titleImg클릭시 file1클릭 -> input태그 발동
					$("#titleImg").click(function(){
						$("#file1").click();
					});
					
					$("#contentImg1").click(function(){
						$("#file2").click();
					});
					
					$("#contentImg2").click(function(){
						$("#file3").click();
					});
					
					$("#contentImg3").click(function(){
						$("#file4").click();
					});
					
				});
				
				//미리보기
				function loadImg(inputFile, num){
					//inputFile : 현재 변화가 생긴 input type="file"요소 객체
					//num : 몇 번쩨 input요소인지 확인 후 해당 영역에 미리보기 하기 위한 하드코딩된 변수
					
					//console.log(inputFile.files, inputFile.files.length);
				/*
					파일 선택시 length=1 , 파일 선택 취소시 length=0 이 출력된다.
					=> 파일의 존재유무를 알 수 있다.
					files속성은 업로드 된 파일의 정보들을 배열 형식으로 여러개 묶어서 반환, length는 그 배열의 크기
				*/
					if(inputFile.files.length != 0){
						//선택한 파일이 존재할 경우
						//선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기
						
						//파일을 읽어들일 FileReader객체 생성
						let reader = new FileReader();
						
						//파일을 읽어들이는 메소드 -> 어느 파일을 읽어들일지 매개변수로 제시해야한다.
						//0번 인덱스에 담긴 파일정보를 제시
						//=> 해당 파일을 익어들이는 순간 해당 파일만의 고유한 url이 부여된다.
						//=> 해당 url을 src의 속성값으로 제시
						reader.readAsDataURL(inputFile.files[0]);
						
						//파일 읽기가 완료되었을 때 실행할 함수 정의
						reader.onload = function(e){ // e.target.result에 reader의 고유 url이 담김
							//각 영역에 맞춰서 이미지 미리보기
							switch(num){
							case 1 : $("#titleImg").attr("src", e.target.result); break;
							case 2 : $("#contentImg1").attr("src", e.target.result); break;
							case 3 : $("#contentImg2").attr("src", e.target.result); break;
							case 4 : $("#contentImg3").attr("src", e.target.result); break;
							}
						}
					}else{
						//선택된 파일이 사라졌을 경우 미리보기도 사라지게 작업
						switch(num){
						case 1 : $("#titleImg").attr("src", null); break;
						case 2 : $("#contentImg1").attr("src", null); break;
						case 3 : $("#contentImg2").attr("src", null); break;
						case 4 : $("#contentImg3").attr("src", null); break;
						}
					}
				}
			</script>
	

			<a href="<%=contextPath%>/list.mk" class="btn btn-secondary btn-sm" id="backBtn">목록</a>
			<input type="submit" class="btn btn-secondary" id="updateBtn" value="수정">
		</form>
	</div>
	<br>
	

<br><br><br><br><br>
</body>
</html>