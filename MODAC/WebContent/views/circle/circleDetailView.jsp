<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.modac.circle.model.vo.*"%>
    <%
 	Circle c = (Circle)request.getAttribute("c");
 // 게시글번호, 카테고리명, 제목, 내용, 작성자아이디, 작성일
 
 	//Attachment at = (Attachment)request.getAttribute("at");
 //파일번호, 원본명, 수정명, 저장경로
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
       
                      
           <div class="content2">
			 <br>
               <h3>동아리 모집</h3>
             <br>

             
			<br>
             <div class="form-control insert-area">
                <br>
                <h3>&nbsp;<%=c.getPostTitle()%></h3>
                 
                <br>
                <span>&nbsp; <%=c.getMemberNo() %></span>
                 
                <span class="date">작성일 : <%=c.getCreateDate() %></span>
                 
                <br>
                <br>
                <div class="form-control" style="height:500px;"><%=c.getPostContent() %></div>

                <div align="center">
				<a href="<%=contextPath %>/circle/clist.bo?currentPage=1" class="btn btn-secondary btn-sm">목록가기</a>
			<%if(loginMember != null && loginMember.getMemberNo().equals(c.getMemberNo())){ %>
			
			<!-- 현재 로그인한 사용자가 해당 글을 작성한 작성자일 경우에만 보여진다. -->
			<a href = "<%=contextPath %>/cupdateForm.bo?bno=<%=c.getPostNo() %>" class = "btn btn-warning btn-sm">수정하기</a>
			<a href = "<%=contextPath %>/cdelete.bo?bno=<%=c.getPostNo()%>" class = "btn btn-danger btn-sm">삭제하기</a>
			<%} %>
			
			</div>
            </div>
            <br>
            
            
            <br>
		    <br>
          </div>
      </div>

 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>