<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.modac.notice.model.vo.Notice, com.modac.common.Attachment, java.util.ArrayList"%>
<%
	Notice n = (Notice)request.getAttribute("n");
	//Attachment at = (Attachment)request.getAttribute("at");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head><script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
<meta charset="UTF-8">
<title>모닥불 소식 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
      .content1{
          width: 20%;
		      height: 1000px;
	      	padding: 50px 20px 10px;
		      background-color: antiquewhite;
		      float: left; 
        }

        .content2{
            width: 80%;
		      	padding: 10px 50px 20px;
            float: left; 
        }
        .form-control {
          margin: 5px;
        }
        
        .date{
          float: right; 
        }

        textarea{
          resize: none;
        }
        
        .form-control:disabled{
          background-color : white;
        }

</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="content">
        <div class="content1">
            <nav class="flex-column">
                <a class="nav-link active" aria-current="page" href="<%=contextPath %>/noticeList"><h3>공지사항</h3></a><br><br>
                <a class="nav-link" href="<%=contextPath %>/noticeList">모닥불 소식</a> <br>
                <a class="nav-link" href="#">캠핑 TIP</a> <br>
                <a class="nav-link" href="<%=contextPath %>/qaList">Q&A</a> <br>
                <a class="nav-link">FAQ</a>
              </nav>
        </div>
        <div class="content2">
            <br>
            <h3>모닥불 소식</h3>
          <br>
              <div align="right" class="insert-area">
              
              
<%--               <% if(loginMember != null && loginMember.getMemberNic().equal(cr.getMemberNo())) {%> --%>
<%--               	<a href="<%=contextPath %>/updateForm.cr?crno=<%=cr.getPostNo()%>" class="btn btn-secondary last1">수정하기</a> --%>
<%--               	<a href="<%=contextPath %>/delete.cr?crno=<%=cr.getPostNo()%>" class="btn btn-secondary last1">삭제하기</a> --%>
<%--               <% } %> --%>


               	<a href="<%=contextPath %>/updateForm.no?nno=<%=n.getNoticeNo()%>" class="btn btn-secondary last1">수정하기</a> 
               	<a href="<%=contextPath %>/deleteNotice?nno=<%=n.getNoticeNo()%>" class="btn btn-secondary last1">삭제하기</a> 
              
              </div>
          
          <div class="form-control">
          	  <input type='hidden' name="noticeNo" value="<%= n.getNoticeNo() %>">
              <br>
              <h3>&nbsp; <%=n.getNoticeTitle() %></h3>
              <br>
              <span>&nbsp; <%=n.getNoticeWriter() %></span>
              <span class="date"><%=n.getCreateDate() %></span>
              <br>
              <br>
              <textarea class="form-control" style="height:500px;" disabled>
              <% for(int i = 1; i<list.size(); i++){ %>
						<img src="<%= contextPath%>/<%= list.get(i).getPath()+list.get(i).getNewName() %>" width="200" height="150">
			  <%} %>
              <%=n.getNoticeContent()%>
              </textarea>
			  <% if(list.isEmpty()) {%>
			  	 첨부파일 없음
			  <%}else{
				  int i = 1;%>
			  	<% for(Attachment at : list){ %>
			  	<a href="<%=contextPath %>/<%= at.getPath() %><%=at.getNewName() %>" download="<%=at.getOriginName()%>" name="upfile<%=i %>" value="<%=at.getFileLevel()%>">
			  		<%= at.getOriginName() %>
			  	</a>
			  	<%
			  	i++;
			  	} %>
			  <%} %>
          </div>
          <br>
          <div align="center">
            <a href="<%=contextPath%>/noticeList" class="btn btn-secondary btn-sm">목록으로</a>
			
          </div>
          <br>


            <br>
        </div>

        
    </div>



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>