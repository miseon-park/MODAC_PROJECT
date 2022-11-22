<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList , com.modac.notice.model.vo.Notice"%>
    
<%ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모닥불 소식 메인</title>
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
		padding: 50px 50px 20px;
		float: left;
	}
	
	.searchbar {
		margin-top: 20px;
		display: table;
		margin-left: auto;
		margin-right: auto;
	}
	
	#writeEdit {
		float: right;
	}
	
	.list-area {
		width: 80%;
		margin: auto;
	}
	
	.input-group-text{
		text-decoration: none;
	}
</style>

</head>
<body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

	<%@ include file="../common/menubar.jsp" %>
        <div class="content">
            <div class="content1">
                <nav class="flex-column">
                    <a class="nav-link active" aria-current="page" href="<%=contextPath %>/noticeList"><h3>공지사항</h3></a> <br><br>
                    <a class="nav-link" href="<%=contextPath %>/noticeList">모닥불 소식</a> <br>
                    <a class="nav-link" href="#">캠핑팁</a> <br>
                    <a class="nav-link" href="<%=contextPath %>/qaList">Q&A</a> <br>
                    <a class="nav-link" href="<%=contextPath %>/faqList">FAQ</a>
                </nav>
            </div>
            <div class="content2">
                <h3>모닥불 소식</h3>
                <br>
                <div class="searchbar">
                    <nav class="navbar">
                        <form class="container-fluid">
                          <div class="input-group">
                            <input type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="Username" aria-describedby="basic-addon1" style="width: 450px;">
                            <a class="input-group-text" id="basic-addon1" href="">검색</a>
                          </div>
                        </form>
                      </nav>
                </div>

                <%-- <% if(loginUser != null && loginUser.getMemberLevel.equals(10)){ %>
                <% } %> --%>

                    <div>
                        <a id="writeEdit" class="btn btn-secondary" href="<%=contextPath %>/noticeEnrollForm">글 작성</a>
                    </div>
                <br><br><br>
                
                <div class="list-area">
                <table class="table table-hover" style="text-align: center;">
                    <thead>
                      <tr>
                        <th scope="col" width="90px;" >글번호</th>
                        <th scope="col" width="450px;">제목</th>
                        <th scope="col" width="150px;">작성자</th>
                        <th scope="col" width="100px;">등록일자</th>
                        <th scope="col" width="80px;">조회수</th>
                      </tr>
                    </thead>
                    <tbody>
						<%
							if (list.isEmpty()) {
						%>
						<!-- 리스트가 비어있는 경우 -->
						<tr>
							<td colspan="5">존재하는 공지사항이 없습니다.</td>
						</tr>
						<%
							} else {
						%>
						<%
							for (Notice n : list) {
						%>
						<%
							if (n.getNoticeCategory() != 1) {
						%>
						<tr style="background-color: rgb(250, 241, 241)">
							<td style="display:none;"><%=n.getNoticeNo()%></td>
							<th scope="row"><span class="badge text-bg-danger">공지</span></th>
							<td><%=n.getNoticeTitle()%></td>
							<td><%=n.getNoticeWriter()%></td>
							<td><%=n.getCreateDate()%></td>
							<td><%=n.getCount()%></td>
						</tr>

						<%
							} else {
						%>
						<tr>
							<th scope="row"><%=n.getNoticeNo()%></th>
							<td><%=n.getNoticeTitle()%></td>
							<td><%=n.getNoticeWriter()%></td>
							<td><%=n.getCreateDate()%></td>
							<td><%=n.getCount()%></td>
						</tr>
						<%
							}
						%>
						<%
							}
						%>
						<%
							}
						%>

					</tbody>
                  </table>
                  </div> 
            </div>
        </div>

	<script>
		$(function(){
				$(".list-area>table>tbody>tr").click(function(){
					// 클릭시 해당 공지사항의 번호를 넘겨야함
					// 해당 tr요소의 자손중에서 첫번째 td의 영역의 내용이 필요하다.
					
					let nno = $(this).children().eq(0).text(); 
					// 현재 내가 클릭한 tr의 자손들중 0번째에 위치한 자식의 textnode내용을 가져온다
					
					// 요청할 url?키=밸류&키=밸류&키=밸류
					// 물음표 뒤의 내용을 쿼리스트링이라고 부른다. => 직접 만들어서 넘겨야함.
					location.href = '<%=contextPath%>/noticeDetail?nno='+ nno;
				});
			})

        </script>




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></scrip>
</body>
</html>