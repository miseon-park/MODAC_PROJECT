<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList , com.modac.FAQ.model.vo.Faq, com.modac.member.model.vo.Member"%>
    
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
	
	#writeEdit {
		float: right;
	}
	
  .accordion{
    width: 800px;
    margin : 0 auto;
  }
	
  .accordion-button:not(.collapsed){
    background-color: rgb(74,57,51);
    color:white;
  }

	.input-group-text{
		text-decoration: none;
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
            <% if(loginMember != null && loginMember.getMemberLevel() == 10){ %>
              <div>
                  <a class="btn btn-warning" id="writeEdit" href="<%=contextPath%>/faqEnrollForm">글 작성</a>
              </div>
            <% } %> 
            <br><br><br>
            <% int count =1; %>
            <% for(Faq f : list){ %>
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%=count %>" aria-expanded="false" aria-controls="collapse<%=count %>">
                      <%= f.getFaqTitle() %>
                    </button>
                  </h2>
                  <div id="collapse<%=count %>" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <%= f.getFaqContent() %>
                      
                      <% if(loginMember != null && loginMember.getMemberLevel() == 10){ %>
                      <a href="<%=contextPath%>/updateForm.fno?fno=<%=f.getFaqNo() %>" class="btn btn-warning btn-sm last1">수정하기</a>
                      <a href="<%=contextPath %>/faqDelete?fno=<%=f.getFaqNo()%>" class="btn btn-secondary btn-sm last1">삭제하기</a>
                      <%} %>
                    </div>
                  </div>
                </div>
    
              </div> <br>
              <%
              	count++;} %>

        </div>
    </div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>