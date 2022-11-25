<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList , com.modac.FAQ.model.vo.Faq"%>
    
<%ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
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
		padding: 50px 200px 20px;
		float: left;
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
	
	<div class="content">
        <div class="content1">
                <nav class="flex-column">
                    <a class="nav-link active" aria-current="page" href="<%=contextPath %>/noticeList"><h3>공지사항</h3></a> <br><br>
                    <a class="nav-link" href="<%=contextPath %>/noticeList">모닥불 소식</a> <br>
                    <a class="nav-link" href="<%=contextPath%>/campTipList">캠핑 팁</a> <br>
                    <a class="nav-link" href="<%=contextPath%>/qaList">Q&A</a> <br>
                    <a class="nav-link" href="<%=contextPath %>/faqList">FAQ</a>
                </nav>
            </div>
        <div class="content2">
            <h3>FAQ</h3>
            <br>
           
           <form id="enroll-form" action="<%=contextPath %>/faqInsert" method="post">
	          <div class="foorm-control" id="form-control">
	              <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요." aria-label="title">
	              <br>
	              <textarea class="form-control" style="height:500px;" name="content"></textarea>
	          </div>
	          
	          <br><br>
		        
		        <div align="center">
		                
		          <button type="button" class="btn btn-secondary" class="last1" onclick="history.back();">이전으로</button>
		
		          <button type="submit" class="btn btn-warning" class="last1">글올리기</button>
		        </div>
		  </form>

        </div>
    </div>
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>